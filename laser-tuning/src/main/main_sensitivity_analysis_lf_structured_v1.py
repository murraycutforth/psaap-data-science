import pathlib

import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

from plotting import write_isosurface_plot_from_arr, write_isosurface_mega_plot_from_arrs
from utils_gg_combustor import read_gg_combustor_file, extract_laser_fwhm, extract_laser_geometry



def main():

    for temperature_level in [2.0, 3.0, 4.0]:

        data_dir = pathlib.Path('/Volumes/My Passport for Mac/laser_tuning/LF/01_aa_quiescent_systematic')
        outdir = pathlib.Path('../output/lf_structured_v1')
        outdir = outdir / f'temperature_{temperature_level:.2f}'
        outdir.mkdir(exist_ok=True, parents=True)

        run_dirs = sorted(data_dir.glob('[0-9][0-9]'))
        df = extract_meta_df(run_dirs)

        print(f'Found {len(run_dirs)} runs in {data_dir}')

        # 3D plots of temperature isosurfaces for qualitative comparison
        #plot_temp_isosurface_mega_plot(run_dirs, temperature_level)
        #plot_all_temp_arrs(run_dirs, temperature_level)

        # Pair plot of the 3 input parameters which are varied
        plot_meta_df(df, outdir)

        # Min radial extent vs. time plot
        #run_dir_to_min_radial_extent_data = plot_all_min_radial_extents(run_dirs, temperature_level, df, outdir)
        #plot_ejecta_velocity(run_dir_to_min_radial_extent_data, df, temperature_level, outdir)


def estimate_ejecta_velocity(times, min_radial_extents):
    # First filter to values between 100 and 300 us
    times = np.array(times)
    min_radial_extents = np.array(min_radial_extents)

    mask = (times > 100) & (times < 300)
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


def plot_ejecta_velocity(run_dir_to_min_radial_extent_data: dict, df: pd.DataFrame, temperature_level, outdir) -> None:
    fig, ax = plt.subplots(1, 4, figsize=(12, 3), dpi=200)

    rows = []

    for run_dir, (times, min_radial_extents) in run_dir_to_min_radial_extent_data.items():
        ejecta_v, upper, lower = estimate_ejecta_velocity(times, min_radial_extents)
        yerr_upper = np.abs(upper - ejecta_v)
        yerr_lower = np.abs(ejecta_v - lower)

        row = df.loc[run_dir]
        beta = row['near_radius'] / row['far_radius']
        alpha = row['axial_length'] / (2 * row['near_radius'])
        ax[0].scatter(beta, ejecta_v, color='blue')
        ax[0].errorbar(beta, ejecta_v, yerr=[[yerr_lower], [yerr_upper]], fmt='o', color='blue')
        ax[1].scatter(alpha, ejecta_v, color='blue')
        ax[1].errorbar(alpha, ejecta_v, yerr=[[yerr_lower], [yerr_upper]], fmt='o', color='blue')
        ax[2].scatter(row['laser_fwhm'], ejecta_v, color='blue')
        ax[2].errorbar(row['laser_fwhm'], ejecta_v, yerr=[[yerr_lower], [yerr_upper]], fmt='o', color='blue')
        ax[3].scatter(row['axial_length'], ejecta_v, color='blue')
        ax[3].errorbar(row['axial_length'], ejecta_v, yerr=[[yerr_lower], [yerr_upper]], fmt='o', color='blue')

        rows.append({
            'alpha': alpha,
            'beta': beta,
            'laser_fwhm': row['laser_fwhm'],
            'axial_length': row['axial_length'],
            'ejecta_v': ejecta_v,
            'ejecta_v_upper': upper,
            'ejecta_v_lower': lower,
        })

    ax[0].set_xlabel('$\\beta$')
    ax[0].set_ylabel('Ejecta velocity [m/s]')
    ax[1].set_xlabel('$\\alpha$')
    ax[1].set_ylabel('Ejecta velocity [m/s]')
    ax[2].set_xlabel('Laser FWHM')
    ax[2].set_ylabel('Ejecta velocity [m/s]')

    fig.tight_layout()
    fig.savefig(outdir / 'ejecta_velocity.png')
    plt.close(fig)

    df = pd.DataFrame(rows)
    df.to_csv(outdir / f'ejecta_velocity_{temperature_level:.2f}.csv', index=False)

    # Plot 2D scatter of alpha vs beta, color by ejecta velocity
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    ax.tricontourf(df['alpha'], df['beta'], df['ejecta_v'], alpha=0.5)
    im = ax.scatter(df['alpha'], df['beta'], c=df['ejecta_v'], cmap='viridis')
    cbar = fig.colorbar(im, ax=ax)

    ax.set_xlabel('$\\alpha$')
    ax.set_ylabel('$\\beta$')
    cbar.set_label('Ejecta velocity [m/s]')

    fig.tight_layout()
    fig.savefig(outdir / 'ejecta_velocity_alpha_beta.png')
    plt.close(fig)


def plot_all_min_radial_extents(run_dirs: list, temperature_level: float, df: pd.DataFrame, outdir) -> dict:
    # For each run, plot the min radial extent as a function of time

    run_dir_to_min_radial_extent_data = {}

    for run_dir in run_dirs:
        print(f'Processing {run_dir}')

        snapshot_names = [f.stem for f in run_dir.glob('data_*.npz')]
        snapshot_inds = [int(name.split('_')[-1]) for name in snapshot_names]
        snapshot_inds.sort()

        min_radial_extents = []
        times = []

        for snapshot_ind in snapshot_inds:
            temp_arr = extract_temp_arr(run_dir, snapshot_ind)
            xyz = extract_xyz_arr(run_dir, snapshot_ind)
            min_radial_extent = compute_min_radial_extent(temp_arr, xyz, temperature_level)
            min_radial_extents.append(min_radial_extent)
            times.append(extract_sim_time(run_dir, snapshot_ind))

        run_dir_to_min_radial_extent_data[run_dir] = (times, min_radial_extents)

    outpath = outdir / 'min_radial_extent_plot_all.png'
    write_min_radial_extent_plot_all(run_dir_to_min_radial_extent_data, outpath)
    outpath = outdir / 'min_radial_extent_plot_beta.png'
    write_min_radial_extent_plot_beta(run_dir_to_min_radial_extent_data, outpath, df)
    outpath = outdir / 'min_radial_extent_plot_fwhm.png'
    write_min_radial_extent_plot_fwhm(run_dir_to_min_radial_extent_data, outpath, df)
    outpath = outdir / 'min_radial_extent_plot_alpha.png'
    write_min_radial_extent_plot_alpha(run_dir_to_min_radial_extent_data, outpath, df)
    outpath = outdir / 'min_radial_extent_plot_L.png'
    write_min_radial_extent_plot_L(run_dir_to_min_radial_extent_data, outpath, df)

    return run_dir_to_min_radial_extent_data


def write_min_radial_extent_plot_L(run_dir_to_min_radial_extent_data: dict, outpath: pathlib.Path, df: pd.DataFrame) -> None:
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    vmin = 0.25
    vmax = 0.75
    cmap = plt.get_cmap('viridis', 256)
    norm = plt.Normalize(vmin, vmax)

    for run_dir, (snapshot_inds, min_radial_extents) in run_dir_to_min_radial_extent_data.items():
        row = df.loc[run_dir]
        L = row['axial_length']
        ax.plot(snapshot_inds, min_radial_extents, color=cmap(norm(L)), alpha=1)

    # Add colorbar
    sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
    sm.set_array([])
    cbar = fig.colorbar(sm, ax=ax)
    cbar.set_label('L')

    ax.set_xlabel('Time $\\mu s$')
    ax.set_ylabel('Min radial extent [mm]')

    fig.tight_layout()
    fig.savefig(outpath)
    plt.close(fig)


def write_min_radial_extent_plot_alpha(run_dir_to_min_radial_extent_data: dict, outpath: pathlib.Path, df: pd.DataFrame) -> None:
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    vmin = 2.0
    vmax = 2.5
    cmap = plt.get_cmap('viridis', 256)
    norm = plt.Normalize(vmin, vmax)

    for run_dir, (snapshot_inds, min_radial_extents) in run_dir_to_min_radial_extent_data.items():
        row = df.loc[run_dir]
        alpha = row['axial_length'] / (2 * row['near_radius'])
        print(alpha)
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


def write_min_radial_extent_plot_fwhm(run_dir_to_min_radial_extent_data: dict, outpath: pathlib.Path, df: pd.DataFrame) -> None:
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    vmin = 0.8e-3
    vmax = 1.4e-3
    cmap = plt.get_cmap('viridis', 256)
    norm = plt.Normalize(vmin, vmax)

    for run_dir, (snapshot_inds, min_radial_extents) in run_dir_to_min_radial_extent_data.items():
        row = df.loc[run_dir]
        fwhm = row['laser_fwhm']
        ax.plot(snapshot_inds, min_radial_extents, color=cmap(norm(fwhm)), alpha=1)

    # Add colorbar
    sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
    sm.set_array([])
    cbar = fig.colorbar(sm, ax=ax)
    cbar.set_label('FWHM')

    ax.set_xlabel('Time $\\mu s$')
    ax.set_ylabel('Min radial extent [mm]')

    fig.tight_layout()
    fig.savefig(outpath)
    plt.close(fig)


def write_min_radial_extent_plot_beta(run_dir_to_min_radial_extent_data: dict, outpath: pathlib.Path, df: pd.DataFrame) -> None:
    fig, ax = plt.subplots(figsize=(4, 3), dpi=200)

    vmin = 1.0
    vmax = 1.8
    cmap = plt.get_cmap('viridis', 256)
    norm = plt.Normalize(vmin, vmax)

    for run_dir, (snapshot_inds, min_radial_extents) in run_dir_to_min_radial_extent_data.items():
        row = df.loc[run_dir]
        beta = row['near_radius'] / row['far_radius']
        print(beta)
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
        run_name = run_dir.name
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

    mask = temp_arr > t_level

    if not mask.any():
        return np.nan

    x = xyz[..., 1]
    y = xyz[..., 2]

    x_masked = x[mask]
    y_masked = y[mask]

    r_masked = np.sqrt(x_masked**2 + y_masked**2)

    r_min = r_masked.min()

    return r_min



def plot_temp_isosurface_mega_plot(run_dirs, temperature_level) -> None:

    snapshot_names = [f.stem for f in run_dirs[0].glob('data_*.npz')]
    snapshot_inds = [int(name.split('_')[-1]) for name in snapshot_names]
    snapshot_inds.sort()

    for snapshot_ind in snapshot_inds:
        write_isosurface_mega_plot(snapshot_ind, 18, run_dirs, temperature_level)



def plot_all_temp_arrs(run_dirs: list, temperature_level: float):
    # Plot temperature isosurface for each snapshot in each run
    outdir = pathlib.Path('../output/01_quiescent_systematic/temperature_isosurfaces')
    outdir.mkdir(exist_ok=True, parents=True)

    for run_dir in run_dirs:
        print(f'Processing {run_dir}')

        run_outdir = outdir / run_dir.name
        run_outdir.mkdir(exist_ok=True)

        snapshot_names = [f.stem for f in run_dir.glob('data_*.npz')]
        snapshot_inds = [int(name.split('_')[-1]) for name in snapshot_names]
        snapshot_inds.sort()

        for snapshot_ind in snapshot_inds:
            temp_arr = extract_temp_arr(run_dir, snapshot_ind)
            print(f'Processing {run_dir.name} | {snapshot_ind:05d}, temperature range: {temp_arr.min()} to {temp_arr.max()}')

            outname = run_outdir / f'{run_dir.name}_{snapshot_ind:05d}.png'
            write_isosurface_plot_from_arr(temp_arr, outname=outname, level=temperature_level, verbose=True, title=f'{run_dir.name} | {snapshot_ind:05d}')


def write_isosurface_mega_plot(snapshot_ind: int, max_num_runs: int, run_dirs: list, temperature_level: float):
    # Create a large 3D multiplot of isosurfaces from all runs at the same snapshot
    outdir = pathlib.Path('../output/01_quiescent_systematic/temperature_isosurfaces/mega_plot')
    outdir.mkdir(exist_ok=True, parents=True)

    temp_arrs = []
    run_names = []

    for run_dir in run_dirs[:max_num_runs]:
        temp_arr = extract_temp_arr(run_dir, snapshot_ind)
        laser_fwhm, near_radius, far_radius, axial_length = extract_run_params(run_dir)
        temp_arrs.append(temp_arr)
        beta = near_radius / far_radius
        alpha = axial_length / (2 * near_radius)
        run_names.append(f'FWHM: {laser_fwhm:.2g}, $\\alpha$: {alpha:.2g}, beta: {beta:.2g}')

    outpath = outdir / f'isosurface_{snapshot_ind:05d}.png'
    write_isosurface_mega_plot_from_arrs(temp_arrs[:18], run_names[:18], outpath, temperature_level, n=3, m=6)




def extract_temp_binary_arr(run_dir: pathlib.Path, snapshot_ind: int, temperature_level: float) -> np.ndarray:
    temp_arr_path = run_dir / f'data_{snapshot_ind:05d}.npz'

    assert temp_arr_path.exists(), f'File not found: {temp_arr_path}'

    arr = np.load(temp_arr_path)['temperature']
    return arr


def plot_meta_df(df: pd.DataFrame, outdir: pathlib.Path) -> None:
    fig = plt.figure(figsize=(4, 4), dpi=200)
    sns.pairplot(df[['laser_fwhm [dimensionless]', 'alpha', 'beta', 'axial_length [mm]']])
    plt.tight_layout()
    plt.savefig(outdir / 'meta_pairplot.png')
    plt.close(fig)


def extract_meta_df(run_dirs: list) -> pd.DataFrame:

    rows = []

    for run_dir in run_dirs:
        print(f'Processing {run_dir}')
        laser_fwhm, near_radius, far_radius, axial_length = extract_run_params(run_dir)

        rows.append({
            'run_dir': run_dir,
            'laser_fwhm [dimensionless]': laser_fwhm,
            'near_radius': near_radius,
            'far_radius': far_radius,
            'axial_length': axial_length,
            'axial_length [mm]': axial_length * 3.175,  # Convert to [mm] using length scale of 3.175 mm
            'alpha': axial_length / (2 * near_radius),
            'beta': near_radius / far_radius,
        })

    # Set index to run_dir
    df = pd.DataFrame(rows)
    df.set_index('run_dir', inplace=True)
    return df


def extract_run_params(run_dir: pathlib.Path) -> tuple:
    laser_fwhm = extract_laser_fwhm(run_dir / 'GG-combustor.json')
    near_radius, far_radius, axial_length = extract_laser_geometry(run_dir / 'GG-combustor.json')

    return laser_fwhm, near_radius, far_radius, axial_length


def extract_temp_arr(run_dir: pathlib.Path, snapshot_ind: int) -> np.ndarray:
    temp_arr_path = run_dir / f'data_{snapshot_ind:05d}.npz'

    assert temp_arr_path.exists(), f'File not found: {temp_arr_path}'

    arr = np.load(temp_arr_path)['temperature']
    return arr


def extract_xyz_arr(run_dir: pathlib.Path, snapshot_ind: int) -> np.ndarray:
    xyz_arr_path = run_dir / f'data_{snapshot_ind:05d}.npz'

    assert xyz_arr_path.exists(), f'File not found: {xyz_arr_path}'

    arr = np.load(xyz_arr_path)['position']

    # Multiply by length scale to get units of [mm]
    arr *= 3.175

    return arr


def extract_sim_time(run_dir: pathlib.Path, snapshot_ind: int) -> float:
    sim_time_path = run_dir / f'data_{snapshot_ind:05d}.npz'

    assert sim_time_path.exists(), f'File not found: {sim_time_path}'

    sim_time = np.load(sim_time_path)['simTime']
    sim_time *= 11.375  # Multiply by time scale to get units of [us]
    return sim_time


if __name__ == '__main__':
    main()