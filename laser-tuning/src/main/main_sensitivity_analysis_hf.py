import pathlib

import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

from plotting import write_isosurface_plot_from_arr, write_isosurface_mega_plot_from_arrs
from utils_gg_combustor import read_gg_combustor_file, extract_laser_fwhm, extract_laser_geometry



def main():
    # Script-level arguments
    temperature_level = 2.0  # Again, Tref = 300 K

    data_dir = pathlib.Path('/Volumes/My Passport for Mac/laser_tuning/HF')
    runs = sorted(data_dir.glob('*.npz'))
    df = extract_meta_df(runs)

    # Pair plot of the 3 input parameters which are varied
    plot_meta_df(df)

    print(f'Found {len(runs)} files in {data_dir}')

    # 3D plots of temperature isosurfaces for qualitative comparison
    #plot_temp_isosurface_mega_plot(runs, temperature_level)
    #plot_all_temp_arrs(runs, temperature_level)


    # Min radial extent vs. time plot
    #run_dir_to_min_radial_extent_data = plot_all_min_radial_extents(runs, temperature_level, df)
    #plot_ejecta_velocity(run_dir_to_min_radial_extent_data, df, temperature_level)


def estimate_ejecta_velocity(times, min_radial_extents):
    # First filter to values between 100 and 200 us
    times = np.array(times)
    min_radial_extents = np.array(min_radial_extents)

    mask = (times > 100) & (times < 200)
    times = times[mask]
    min_radial_extents = min_radial_extents[mask]

    # Convert to SI units
    times *= 1e-6
    min_radial_extents *= 1e-3

    ejecta_v, upper, lower = fit_slope_with_confidence_intervals(times, min_radial_extents)

    return ejecta_v, upper, lower


def fit_slope_with_confidence_intervals(x, y, num_bootstrap=1000, confidence_level=0.95):
    # Fit a linear model to the data
    p = np.polyfit(x, y, 1)
    slope = p[0]

    # Bootstrap resampling
    slopes = []
    n = len(x)
    for _ in range(num_bootstrap):
        indices = np.random.choice(n, n, replace=True)
        x_sample = x[indices]
        y_sample = y[indices]
        p_sample = np.polyfit(x_sample, y_sample, 1)
        slopes.append(p_sample[0])

    # Calculate confidence intervals
    lower_bound = np.percentile(slopes, (1 - confidence_level) / 2 * 100)
    upper_bound = np.percentile(slopes, (1 + confidence_level) / 2 * 100)

    return slope, lower_bound, upper_bound


def plot_ejecta_velocity(run_id_to_min_radial_extent_data: dict, df: pd.DataFrame, temperature_level) -> None:
    fig, ax = plt.subplots(1, 2, figsize=(6, 3), dpi=200)

    rows = []

    for run_id, (times, min_radial_extents) in run_id_to_min_radial_extent_data.items():
        ejecta_v, upper, lower = estimate_ejecta_velocity(times, min_radial_extents)
        yerr_upper = np.abs(upper - ejecta_v)
        yerr_lower = np.abs(ejecta_v - lower)

        alpha = run_id_to_alpha(run_id)
        beta = run_id_to_beta(run_id)

        ax[0].scatter(beta, ejecta_v, color='blue')
        ax[0].errorbar(beta, ejecta_v, yerr=[[yerr_lower], [yerr_upper]], fmt='o', color='blue')
        ax[1].scatter(alpha, ejecta_v, color='blue')
        ax[1].errorbar(alpha, ejecta_v, yerr=[[yerr_lower], [yerr_upper]], fmt='o', color='blue')

        rows.append({
            'alpha': alpha,
            'beta': beta,
            'ejecta_v': ejecta_v,
            'ejecta_v_upper': upper,
            'ejecta_v_lower': lower
        })

    ax[0].set_xlabel('$\\beta$')
    ax[0].set_ylabel('Ejecta velocity [m/s]')
    ax[1].set_xlabel('$\\alpha$')
    ax[1].set_ylabel('Ejecta velocity [m/s]')

    fig.tight_layout()
    fig.savefig('../output/hf/ejecta_velocity.png')
    plt.close(fig)

    df = pd.DataFrame(rows)
    df.to_csv(f'../output/hf/ejecta_velocity_{temperature_level:.2f}.csv', index=False)

    # Plot 2D scatter of alpha vs beta, color by ejecta velocity
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    ax.tricontourf(df['alpha'], df['beta'], df['ejecta_v'], alpha=0.5)
    im = ax.scatter(df['alpha'], df['beta'], c=df['ejecta_v'], cmap='viridis')
    cbar = fig.colorbar(im, ax=ax)

    ax.set_xlabel('$\\alpha$')
    ax.set_ylabel('$\\beta$')
    cbar.set_label('Ejecta velocity [m/s]')

    fig.tight_layout()
    fig.savefig('../output/01_quiescent_systematic/ejecta_velocity_alpha_beta.png')
    plt.close(fig)


def plot_all_min_radial_extents(runs: list, temperature_level: float, df: pd.DataFrame) -> dict:
    # For each run, plot the min radial extent as a function of time

    outdir = pathlib.Path('../output/hf/min_radial_extent')
    outdir.mkdir(exist_ok=True, parents=True)

    run_ids = set([extract_run_id(run) for run in runs])
    run_id_to_min_radial_extent_data = {}

    for run_id in run_ids:
        print(f'Processing {run_id} for min radial extent plot')

        run_names = list(pathlib.Path('./../data/HF').glob(f'{run_id}_*.npz'))
        run_names.sort(key=lambda x: int(x.stem.split('_')[-1]))

        min_radial_extents = []
        times = []

        for run in run_names:
            temp_arr = extract_temp_arr(run)
            xyz = extract_xyz_arr(run)

            min_radial_extent = compute_min_radial_extent(temp_arr, xyz, temperature_level)
            min_radial_extents.append(min_radial_extent)
            times.append(extract_sim_time(run))

        run_id_to_min_radial_extent_data[run_id] = (times, min_radial_extents)

    outpath = outdir / 'min_radial_extent_plot_all.png'
    write_min_radial_extent_plot_all(run_id_to_min_radial_extent_data, outpath)
    outpath = outdir / 'min_radial_extent_plot_beta.png'
    write_min_radial_extent_plot_beta(run_id_to_min_radial_extent_data, outpath, df)
    outpath = outdir / 'min_radial_extent_plot_alpha.png'
    write_min_radial_extent_plot_alpha(run_id_to_min_radial_extent_data, outpath, df)

    return run_id_to_min_radial_extent_data


def write_min_radial_extent_plot_alpha(run_dir_to_min_radial_extent_data: dict, outpath: pathlib.Path, df: pd.DataFrame) -> None:
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    vmin = 2.0
    vmax = 2.5
    cmap = plt.get_cmap('viridis', 256)
    norm = plt.Normalize(vmin, vmax)

    for run_id, (snapshot_inds, min_radial_extents) in run_dir_to_min_radial_extent_data.items():
        alpha = run_id_to_alpha(run_id)
        ax.plot(snapshot_inds, min_radial_extents, color=cmap(norm(alpha)), alpha=1)

    # Add colorbar
    sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
    sm.set_array([])
    cbar = fig.colorbar(sm, ax=ax)
    cbar.set_label('$\\alpha$')

    ax.set_xlabel('Time $\\mu s$')
    ax.set_ylabel('Min radial extent [mm]')

    fig.tight_layout()
    fig.savefig(outpath)
    plt.close(fig)


def run_id_to_alpha(run_id: str) -> float:
    parts = run_id.split('_')
    return float(parts[0][5:])


def run_id_to_beta(run_id: str) -> float:
    parts = run_id.split('_')
    return float(parts[1][4:])

def write_min_radial_extent_plot_beta(run_id_to_min_radial_extent_data: dict, outpath: pathlib.Path, df: pd.DataFrame) -> None:
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    vmin = 1.0
    vmax = 2.0
    cmap = plt.get_cmap('viridis', 256)
    norm = plt.Normalize(vmin, vmax)

    for run_id, (snapshot_inds, min_radial_extents) in run_id_to_min_radial_extent_data.items():
        beta = run_id_to_beta(run_id)
        ax.plot(snapshot_inds, min_radial_extents, color=cmap(norm(beta)), alpha=1)

    # Add colorbar
    sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
    sm.set_array([])
    cbar = fig.colorbar(sm, ax=ax)
    cbar.set_label('$\\beta$')

    ax.set_xlabel('Time $\\mu s$')
    ax.set_ylabel('Min radial extent [mm]')

    fig.tight_layout()
    fig.savefig(outpath)
    plt.close(fig)


def write_min_radial_extent_plot_all(run_dir_to_min_radial_extent_data: dict, outpath: pathlib.Path) -> None:
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    for run_dir, (snapshot_inds, min_radial_extents) in run_dir_to_min_radial_extent_data.items():
        ax.plot(snapshot_inds, min_radial_extents, color='blue', alpha=0.5)

    ax.set_xlabel('Time $\\mu s$')
    ax.set_ylabel('Min radial extent [mm]')

    fig.tight_layout()
    fig.savefig(outpath)
    plt.close(fig)


def compute_min_radial_extent(temp_arr: np.array, xyz: np.array, t_level: float) -> float:
    assert temp_arr.shape == xyz.shape[:-1]
    assert temp_arr.ndim == 3
    assert t_level > 0

    print(f'Computing min radial extent for temperature level {t_level}')
    print(f'Temperature range: {temp_arr.min()} to {temp_arr.max()}')

    mask = temp_arr > t_level

    if not mask.any():
        return np.nan

    y = xyz[..., 1]
    r_masked = y[mask]
    r_min = r_masked.min()

    return r_min



def plot_temp_isosurface_mega_plot(runs, temperature_level) -> None:
    snapshot_inds = list(set([int(name.stem.split('_')[-1]) for name in runs]))
    snapshot_inds.sort()

    for snapshot_ind in snapshot_inds:
        write_isosurface_mega_plot(snapshot_ind, 5, runs, temperature_level)


def extract_run_id(run: pathlib.Path):
    parts = run.stem.split('_')
    return '_'.join(parts[:2])


def plot_all_temp_arrs(runs: list, temperature_level: float):
    # Plot temperature isosurface for each snapshot in each run
    outdir = pathlib.Path('../output/hf/temperature_isosurfaces')
    outdir.mkdir(exist_ok=True, parents=True)

    run_ids = set([extract_run_id(run) for run in runs])

    for run_id in run_ids:
        print(f'Processing {run_id} for isosurface plot')

        run_outdir = outdir / run_id
        run_outdir.mkdir(exist_ok=True)

        run_names = list(pathlib.Path('./../data/HF').glob(f'{run_id}_*.npz'))
        run_names.sort(key=lambda x: int(x.stem.split('_')[-1]))

        print(run_names)

        for run_name in run_names:
            temp_arr = extract_temp_arr(run_name)
            outname = run_outdir / f'{run_name.stem}.png'
            write_isosurface_plot_from_arr(temp_arr, outname=outname, level=temperature_level, verbose=True)


def extract_temp_arr(run_name: pathlib.Path):
    data = np.load(run_name)
    return data['temperature']


def write_isosurface_mega_plot(snapshot_ind: int, max_num_runs: int, runs: list, temperature_level: float):
    # Create a large 3D multiplot of isosurfaces from all runs at the same snapshot
    outdir = pathlib.Path('../output/hf/temperature_isosurfaces/mega_plot')
    outdir.mkdir(exist_ok=True, parents=True)

    runs_given_snapshot = [run for run in runs if int(run.stem.split('_')[-1]) == snapshot_ind]

    temp_arrs = []
    run_names = []

    for run in runs_given_snapshot[:max_num_runs]:
        temp_arr = extract_temp_arr(run)
        run_id = extract_run_id(run)
        alpha = run_id_to_alpha(run_id)
        beta = run_id_to_beta(run_id)
        temp_arrs.append(temp_arr)
        run_names.append(f'$\\alpha$: {alpha:.2g}, beta: {beta:.2g}')

    outpath = outdir / f'isosurface_{snapshot_ind:05d}.png'
    if not outpath.exists():
        write_isosurface_mega_plot_from_arrs(temp_arrs, run_names, outpath, temperature_level, n=3, m=2)




def extract_temp_binary_arr(run_dir: pathlib.Path, snapshot_ind: int, temperature_level: float) -> np.ndarray:
    temp_arr_path = run_dir / f'data_{snapshot_ind:05d}.npz'

    assert temp_arr_path.exists(), f'File not found: {temp_arr_path}'

    arr = np.load(temp_arr_path)['temperature']
    return arr


def plot_meta_df(df: pd.DataFrame):
    # Pairplot of the three parameters
    fig = plt.figure(figsize=(8, 8))
    sns.pairplot(df)
    plt.tight_layout()
    plt.savefig('../output/hf/meta_pairplot.png')
    plt.close(fig)


def extract_meta_df(runs: list) -> pd.DataFrame:

    rows = []

    for run in runs:
        parts = run.stem.split('_')
        alpha = float(parts[0][5:])
        beta = float(parts[1][4:])

        rows.append({
            'run_name': run,
            'alpha': alpha,
            'beta': beta,
        })

    # Set index to run_name
    df = pd.DataFrame(rows)
    df.set_index('run_name', inplace=True)
    return df


def extract_xyz_arr(run: pathlib.Path) -> np.ndarray:
    arr = np.load(run)['position']

    # Multiply by length scale to get units of [mm]
    arr *= 1.25

    return arr


def extract_sim_time(run: pathlib.Path) -> float:
    sim_time = np.load(run)['simTime']
    sim_time *= 4.477124  # Multiply by time scale to get units of [us]
    return sim_time


if __name__ == '__main__':
    main()