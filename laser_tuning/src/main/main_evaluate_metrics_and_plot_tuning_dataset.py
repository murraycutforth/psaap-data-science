import pathlib

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

from laser_tuning.src.optimisation import constant_offset_model_optimisation, visualise_optimisation_landscape
from laser_tuning.src.utils.data_loading import get_lf_arr, get_hf_arr, get_hf_df, get_lf_df, get_spatial_domain, \
    get_resolution, get_resolution_ejecta_v
from laser_tuning.src.metrics.dice import compute_dice, compute_rmse, compute_mae, compute_zncc, create_cone_mask, compute_dice_cone_subset
from laser_tuning.src.utils.plotting_utils import write_isosurface_and_slice_plot
from laser_tuning.src.utils.velocities import estimate_ejecta_velocity


def compare_orthogonal_slices(arr1, arr2, title1, title2, outfile=None):
    fig, ax = plt.subplots(2, 3, figsize=(15, 8))

    dx = get_resolution()
    origin, extents = get_spatial_domain()

    for i in range(3):
        arr1_slice = np.take(arr1, indices=arr1.shape[i]//2, axis=i)
        im = ax[0, i].imshow(arr1_slice, extent=[origin[i], origin[i] + extents[i], origin[i], origin[i] + extents[i]])
        fig.colorbar(im, ax=ax[0, i])
        ax[0, i].set_aspect('equal')
        ax[0, i].set_title(f'{title1} Slice {i} (index {arr1.shape[i] // 2})')
        ax[0, i].set_xlabel('[mm]')
        ax[0, i].set_ylabel('[mm]')

        arr2_slice = np.take(arr2, indices=arr2.shape[i]//2, axis=i)
        im = ax[1, i].imshow(arr2_slice, extent=[origin[i], origin[i] + extents[i], origin[i], origin[i] + extents[i]])
        fig.colorbar(im, ax=ax[1, i])
        ax[1, i].set_aspect('equal')
        ax[1, i].set_title(f'{title2} Slice {i} (index {arr2.shape[i] // 2})')
        ax[1, i].set_xlabel('[mm]')
        ax[1, i].set_ylabel('[mm]')

    fig.tight_layout()

    if outfile is not None:
        plt.savefig(outfile)
    else:
        plt.show()


def compute_ejecta_velocity(group, threshold, hf=False):
    file_names = group.index  # Should already be ordered in increasing sim time
    min_y_extents = []
    times = []
    dx = get_resolution_ejecta_v()

    for f in file_names:
        if hf:
            arr, t = get_hf_arr(f, ejecta_v=True)
        else:
            arr, t = get_lf_arr(f, ejecta_v=True)

        arr_mask = arr > threshold

        if np.sum(arr_mask) == 0:
            min_y_extents.append(np.nan)
            times.append(t)
            continue

        y_vals_vol_space = np.arange(arr.shape[1])[np.newaxis, :, np.newaxis] * np.ones_like(arr)

        y_min = np.min(y_vals_vol_space[arr_mask]) * dx

        min_y_extents.append(y_min)
        times.append(t)

    try:
        ejecta_v, upper, lower = estimate_ejecta_velocity(times, min_y_extents)
    except ValueError:
        print(f'Unable to estimate ejecta velocity for group with threshold {threshold}')
        return np.nan

    return ejecta_v


def cache_all_data(lf_data_dir, hf_data_dir):
    cache_dir = pathlib.Path('/Users/murray/laser_tuning/cache').resolve()
    cache_dir.mkdir(exist_ok=True)

    # For each LF run, find the output closest to 190us and cache it

    df_lf = get_lf_df(lf_data_dir)

    param_cols = ['alpha', 'beta', 'axial_length', 'laser_fwhm']

    grouped = df_lf.groupby(param_cols)

    for name, group in grouped:
        group = group.sort_values('sim_time')
        closest_idx = np.argmin(np.abs(group['sim_time'] - 190))
        closest_filename = group.iloc[closest_idx, :].name

        cache_filename = cache_dir / f'lf_{closest_filename.parent.stem}_{closest_filename.stem}.npz'

        if cache_filename.exists():
            print(f'Skipping {cache_filename} as it already exists')
            continue

        arr_lf, t_lf = get_lf_arr(closest_filename)
        ejecta_v_500 = compute_ejecta_velocity(group, 500.0)
        ejecta_v_1000 = compute_ejecta_velocity(group, 1000.0)

        print(f'Saving {closest_filename} with t={t_lf:.4g} and params {name} to cache')

        np.savez_compressed(cache_filename, arr=arr_lf, t=t_lf, ejecta_v_500=ejecta_v_500, ejecta_v_1000=ejecta_v_1000, params=np.array(name))

    df_hf = get_hf_df(hf_data_dir)

    param_cols = ['alpha', 'beta']

    grouped = df_hf.groupby(param_cols)

    for name, group in grouped:
        group = group.sort_values('sim_time')
        closest_idx = np.argmin(np.abs(group['sim_time'] - 190))
        closest_filename = group.iloc[closest_idx, :].name

        cache_filename = cache_dir / f'hf_{closest_filename.stem}.npz'

        if cache_filename.exists():
            print(f'Skipping {cache_filename} as it already exists')
            continue

        arr_hf, t_hf = get_hf_arr(closest_filename)
        ejecta_v_500 = compute_ejecta_velocity(group, 500.0, hf=True)
        ejecta_v_1000 = compute_ejecta_velocity(group, 1000.0, hf=True)

        print(f'Saving {closest_filename} with t={t_hf:.4g} and params {name} to cache')

        np.savez_compressed(cache_filename, arr=arr_hf, t=t_hf, ejecta_v_500=ejecta_v_500, ejecta_v_1000=ejecta_v_1000, params=np.array(name))


def load_cached_data():
    cache_dir = pathlib.Path('/Users/murray/laser_tuning/cache').resolve()

    lf_files = list(cache_dir.glob('lf_*.npz'))
    hf_files = list(cache_dir.glob('hf_*.npz'))

    lf_data = [np.load(f) for f in lf_files]
    hf_data = [np.load(f) for f in hf_files]

    return lf_data, hf_data


def compute_ejecta_velocity_error(lf_data, hf_data, threshold=500):
    n = len(lf_data)
    m = len(hf_data)

    results = np.zeros((n, m))

    for i in range(n):
        for j in range(m):
            if threshold == 500:
                lf_ejecta_v = lf_data[i]['ejecta_v_500']
                hf_ejecta_v = hf_data[j]['ejecta_v_500']
            elif threshold == 1000:
                lf_ejecta_v = lf_data[i]['ejecta_v_1000']
                hf_ejecta_v = hf_data[j]['ejecta_v_1000']
            else:
                raise ValueError('Invalid threshold')

            results[i, j] = np.abs(lf_ejecta_v - hf_ejecta_v)
            assert not np.isnan(results[i, j])

    return results


def compute_pairwise_metric(lf_data, hf_data, metric_fn, threshold=None):
    n = len(lf_data)
    m = len(hf_data)

    print(f'Computing pairwise metric for {n} LF runs and {m} HF runs with metric {metric_fn.__name__}')

    results = np.zeros((n, m))

    for i in range(n):
        for j in range(m):
            lf_arr = lf_data[i]['arr']
            hf_arr = hf_data[j]['arr']

            if threshold is not None:
                arr1 = lf_arr > threshold
                arr2 = hf_arr > threshold
            else:
                arr1 = lf_arr
                arr2 = hf_arr

            results[i, j] = metric_fn(arr1, arr2)

    return results


def plot_pairwise_metrics(lf_data, hf_data):
    rmses = compute_pairwise_metric(lf_data, hf_data, compute_rmse)
    maes = compute_pairwise_metric(lf_data, hf_data, compute_mae)
    znccs = compute_pairwise_metric(lf_data, hf_data, compute_zncc)
    dice_500 = compute_pairwise_metric(lf_data, hf_data, compute_dice, threshold=500.0)
    dice_1000 = compute_pairwise_metric(lf_data, hf_data, compute_dice, threshold=1000.0)

    fig, ax = plt.subplots(2, 3, figsize=(4, 6), dpi=200)

    im = ax[0, 0].imshow(rmses)
    fig.colorbar(im, ax=ax[0, 0])
    ax[0, 0].set_title('RMSE')

    im = ax[0, 1].imshow(maes)
    fig.colorbar(im, ax=ax[0, 1])
    ax[0, 1].set_title('MAE')

    im = ax[1, 0].imshow(znccs)
    fig.colorbar(im, ax=ax[1, 0])
    ax[1, 0].set_title('ZNCC')

    im = ax[1, 1].imshow(dice_500)
    fig.colorbar(im, ax=ax[1, 1])
    ax[1, 1].set_title('Dice (500K)')

    im = ax[1, 2].imshow(dice_1000)
    fig.colorbar(im, ax=ax[1, 2])
    ax[1, 2].set_title('Dice (1000K)')

    fig.tight_layout()
    fig.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/pairwise_metrics.png')
    plt.close()


def plot_all_individual_datasets(lf_data, hf_data):
    # Plot slices / 1000K surface from all datasets
    for i, data in enumerate(hf_data):
        arr = data['arr']
        params = data['params']
        t = data['t']

        outpath = pathlib.Path(f'/Volumes/My Passport for Mac/laser_tuning/plots/hf_{i}_slices.png')
        write_isosurface_and_slice_plot(arr, dx=get_resolution(), outpath=outpath, level=1000.0, title=f'HF {i} at t={t:.4g} with params {params}')

    for i, data in enumerate(lf_data):
        arr = data['arr']
        params = data['params']
        t = data['t']

        outpath = pathlib.Path(f'/Volumes/My Passport for Mac/laser_tuning/plots/lf_{i}_slices.png')
        write_isosurface_and_slice_plot(arr, dx=get_resolution(), outpath=outpath, level=1000.0, title=f'LF {i} at t={t:.4g} with params {params}')


def plot_cone_mask_test(hf_data):
    cone_mask = create_cone_mask(hf_data[0]['arr'].shape)

    for i, data in enumerate(hf_data):
        arr = data['arr']
        arr[~cone_mask] = np.nan
        params = data['params']
        t = data['t']

        outpath = pathlib.Path(f'/Volumes/My Passport for Mac/laser_tuning/plots/hf_{i}_slices_masked.png')
        write_isosurface_and_slice_plot(arr, dx=get_resolution(), outpath=outpath, level=1000.0, title=f'HF {i} at t={t:.4g} with params {params}')



def plot_pairplot_visualization(metric_name_to_distance_matrix, lf_data, hf_data):

    lf_params = np.array([data['params'] for data in lf_data])
    lf_params_df = pd.DataFrame(lf_params, columns=['alpha', 'beta', 'axial_length', 'laser_fwhm'])

    def _pairplot_metric(metric_name, metric_vals, j):
        assert len(metric_vals) == len(lf_params_df)

        # This gives us the similarity between HF j, and all LF runs, under some metric
        lf_params_df[metric_name] = metric_vals[:, j]

        sns.pairplot(lf_params_df, hue=metric_name, diag_kws=dict(hue=None, color=".2"), corner=True, palette='viridis')
        plt.savefig(f'/Volumes/My Passport for Mac/laser_tuning/plots/pairplot_hf_{j}_{metric_name}.png')
        plt.close()
        print(f'Saved pairplot for {metric_name} and HF {j}')
        lf_params_df.drop(columns=[metric_name], inplace=True)

    for j in range(len(hf_data)):
        for metric_name, metric_vals in metric_name_to_distance_matrix.items():
            _pairplot_metric(metric_name, metric_vals, j)

        break  # Not worth repeating for all 5 HFs?


def plot_metric_correlation(metric_name_to_distance_matrix):
    df = pd.DataFrame({k: v.flatten() for k, v in metric_name_to_distance_matrix.items()})

    sns.pairplot(df, corner=True, kind='kde')
    fig = plt.gcf()
    fig.tight_layout()
    plt.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/all_metric_pairplot.png')
    plt.close()

    sns.heatmap(df.corr())
    fig = plt.gcf()
    fig.tight_layout()
    plt.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/all_metric_correlation_heatmap.png')
    plt.close()


def compute_metric_name_to_distance_matrix(lf_data, hf_data):
    rmses = compute_pairwise_metric(lf_data, hf_data, compute_rmse)
    #maes = compute_pairwise_metric(lf_data, hf_data, compute_mae)
    #znccs = compute_pairwise_metric(lf_data, hf_data, compute_zncc)
    #dice_500 = compute_pairwise_metric(lf_data, hf_data, compute_dice, threshold=500.0)
    dice_1000 = compute_pairwise_metric(lf_data, hf_data, compute_dice, threshold=1000.0)
    dice_500_ejecta = compute_pairwise_metric(lf_data, hf_data, compute_dice_cone_subset, threshold=500.0)
    #dice_1000_ejecta = compute_pairwise_metric(lf_data, hf_data, compute_dice_cone_subset, threshold=1000.0)
    #ejecta_v_500 = compute_ejecta_velocity_error(lf_data, hf_data, threshold=500)
    ejecta_v_1000 = compute_ejecta_velocity_error(lf_data, hf_data, threshold=1000)

    print('All metrics computed')

    return {
        'RMSE': rmses,
        #'MAE': maes,
        #'ZNCC': znccs,
        #'Dice (500K)': dice_500,
        'Dice (1000K)': dice_1000,
        'Dice (Ejecta 500K)': dice_500_ejecta,
        #'Dice (Ejecta 1000K)': dice_1000_ejecta,
        #'Ejecta Velocity (500K)': ejecta_v_500,
        'Ejecta Velocity (1000K)': ejecta_v_1000
    }


def plot_velocity_vs_params(lf_data, hf_data):
    lf_params = np.array([data['params'] for data in lf_data])
    lf_ejecta_vs_params = np.array([data['ejecta_v_500'] for data in lf_data])

    hf_params = np.array([data['params'] for data in hf_data])
    hf_ejecta_vs_params = np.array([data['ejecta_v_500'] for data in hf_data])

    fig, ax = plt.subplots(2, 2, figsize=(8, 8), dpi=200)

    for i in range(2):
        ax[0, i].scatter(lf_params[:, i], lf_ejecta_vs_params, label='LF')
        ax[0, i].scatter(hf_params[:, i], hf_ejecta_vs_params, label='HF')
        ax[0, i].set_xlabel(['alpha', 'beta'][i])
        ax[0, i].set_ylabel('Ejecta velocity [m/s]')
        ax[0, i].legend()

    for i in range(2, 4):
        ax[1, i - 2].scatter(lf_params[:, i], lf_ejecta_vs_params, label='LF')
        ax[1, i - 2].set_xlabel(['L', 'fwhm'][i - 2])
        ax[1, i - 2].set_ylabel('Ejecta velocity [m/s]')
        ax[1, i - 2].legend()

    fig.tight_layout()
    fig.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/velocity_500_vs_params.png')
    plt.close()

    lf_ejecta_vs_params = np.array([data['ejecta_v_1000'] for data in lf_data])
    hf_ejecta_vs_params = np.array([data['ejecta_v_1000'] for data in hf_data])

    fig, ax = plt.subplots(2, 2, figsize=(8, 8), dpi=200)

    for i in range(2):
        ax[0, i].scatter(lf_params[:, i], lf_ejecta_vs_params, label='LF')
        ax[0, i].scatter(hf_params[:, i], hf_ejecta_vs_params, label='HF')
        ax[0, i].set_xlabel(['alpha', 'beta'][i])
        ax[0, i].set_ylabel('Ejecta velocity [m/s]')
        ax[0, i].legend()

    for i in range(2, 4):
        ax[1, i - 2].scatter(lf_params[:, i], lf_ejecta_vs_params, label='LF')
        ax[1, i - 2].set_xlabel(['L', 'fwhm'][i - 2])
        ax[1, i - 2].set_ylabel('Ejecta velocity [m/s]')
        ax[1, i - 2].legend()

    fig.tight_layout()
    fig.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/velocity_1000_vs_params.png')
    plt.close()


def print_ejecta_vs(lf_data, hf_data):
    lf_ejecta_vs_params = np.array([data['ejecta_v_500'] for data in lf_data])
    hf_ejecta_vs_params = np.array([data['ejecta_v_500'] for data in hf_data])
    print(f"LF Ejecta Velocity 500K: {lf_ejecta_vs_params}")
    print(f"HF Ejecta Velocity 500K: {hf_ejecta_vs_params}")

    lf_ejecta_vs_params = np.array([data['ejecta_v_1000'] for data in lf_data])
    hf_ejecta_vs_params = np.array([data['ejecta_v_1000'] for data in hf_data])
    print(f"LF Ejecta Velocity 1000K: {lf_ejecta_vs_params}")
    print(f"HF Ejecta Velocity 1000K: {hf_ejecta_vs_params}")


def main():
    lf_data_dir = pathlib.Path('/Volumes/My Passport for Mac/laser_tuning/LF/hyperCubeSampling')
    hf_data_dir = pathlib.Path('/Volumes/My Passport for Mac/laser_tuning/HF')

    cache_all_data(lf_data_dir, hf_data_dir)
    lf_data, hf_data = load_cached_data()
    metric_name_to_distance_matrix = compute_metric_name_to_distance_matrix(lf_data, hf_data)

    #plot_velocity_vs_params(lf_data, hf_data)
    #plot_all_individual_datasets(lf_data, hf_data)
    #plot_pairwise_metrics(lf_data, hf_data)
    #plot_pairplot_visualization(metric_name_to_distance_matrix, lf_data, hf_data)
    #plot_metric_correlation(metric_name_to_distance_matrix)
    #visualise_optimisation_landscape(lf_data, hf_data, metric_name_to_distance_matrix)
    constant_offset_model_optimisation(lf_data, hf_data, metric_name_to_distance_matrix)




if __name__ == '__main__':
    main()






