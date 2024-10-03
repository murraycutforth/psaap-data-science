import pathlib

import numpy as np
import pandas as pd
from scipy.interpolate import griddata

from laser_tuning.src.utils.utils_gg_combustor import extract_laser_fwhm, extract_laser_geometry, extract_laser_focal_location
from laser_tuning.src.utils.resampling import resample_point_cloud_to_regular_grid_2d


def extract_sim_time_hf(run: pathlib.Path) -> np.ndarray:
    """Extract the sim time for the high-fidelity data
    """
    sim_time = np.load(run)['simTime']
    sim_time *= 4.477124  # Convert to units of [us]
    return sim_time


def extract_sim_time_lf(run: pathlib.Path) -> np.ndarray:
    """Extract the sim time for the low-fidelity data
    """
    sim_time = np.load(run)['simTime']
    sim_time *= 11.375  # Convert to units of [us]
    return sim_time


def extract_temp_arr_hf(run_name: pathlib.Path):
    data = np.load(run_name)
    return data['temperature'] * 300  # Convert to units of [K]


def extract_temp_arr_lf(run_name: pathlib.Path):
    data = np.load(run_name)
    return data['temperature'] * 300  # Convert to units of [K]


def extract_spatial_coords_hf(run_name: pathlib.Path):
    data = np.load(run_name)
    return data['position'] * 1.25  # Units of [mm]


def extract_spatial_coords_lf(run_name: pathlib.Path):
    data = np.load(run_name)
    return data['position'] * 3.175  # Units of [mm]


def get_spatial_domain():
    """Common domain for LF and HF data. Origin is laser focal location. Units of mm.
    """
    origin = np.array([-5, -7, -5])
    extents = np.array([10, 10, 10])
    return origin, extents


def get_spatial_domain_ejecta_v():
    """Common domain for LF and HF data. Origin is laser focal location. Units of mm.
    """
    origin = np.array([-2.5, -7, -2.5])
    extents = np.array([5, 8, 5])
    return origin, extents


def get_resolution():
    """Common resolution for LF and HF data. Units of mm. This is the original HF resolution.
    """
    return 0.05681818182


def get_resolution_ejecta_v():
    return 0.05


def get_hf_arr(run_path: pathlib.Path, ejecta_v=False) -> tuple:
    """Extract the HF data from the run
    """
    assert run_path.exists()

    sim_time = extract_sim_time_hf(run_path)
    temperature = extract_temp_arr_hf(run_path)
    spatial_coords = extract_spatial_coords_hf(run_path)

    if ejecta_v:
        dx = get_resolution_ejecta_v()
        origin, extents = get_spatial_domain_ejecta_v()
    else:
        dx = get_resolution()
        origin, extents = get_spatial_domain()

    new_shape = (extents / dx).astype(int)

    #print(f'Resampling {run_path} to shape {new_shape}')

    temperature_resampled = resample_point_cloud_to_regular_grid_2d(spatial_coords.reshape(-1, 3),
                                                                    temperature.flatten(),
                                                                    new_shape, extents, origin,
                                                                    method='nearest')

    return temperature_resampled, sim_time


def get_lf_arr(run_path: pathlib.Path, ejecta_v=False) -> tuple:
    """Extract the LR data from the run
    """
    assert run_path.exists()

    sim_time = extract_sim_time_lf(run_path)
    temperature = extract_temp_arr_lf(run_path)
    spatial_coords = extract_spatial_coords_lf(run_path)
    focal_location = extract_laser_focal_location(run_path.parent / 'GG-combustor.json') * 3.175
    spatial_coords -= focal_location  # Centre the data around the focal location

    if ejecta_v:
        dx = get_resolution_ejecta_v()
        origin, extents = get_spatial_domain_ejecta_v()
    else:
        dx = get_resolution()
        origin, extents = get_spatial_domain()

    new_shape = (extents / dx).astype(int)

    #print(f'Resampling {run_path} to shape {new_shape}')

    temperature_resampled = resample_point_cloud_to_regular_grid_2d(spatial_coords.reshape(-1, 3),
                                                                    temperature.flatten(),
                                                                    new_shape, extents, origin,
                                                                    method='nearest')

    return temperature_resampled, sim_time


def get_hf_df(data_dir: pathlib.Path) -> pd.DataFrame:
    runs = sorted(data_dir.glob('*.npz'))
    assert len(runs) > 0, 'No runs found in directory'
    rows = []

    for run in runs:
        parts = run.stem.split('_')
        alpha = float(parts[0][5:])
        beta = float(parts[1][4:])
        timestep = int(parts[-1])
        sim_time = extract_sim_time_hf(run)

        rows.append({
            'run_name': run,
            'alpha': alpha,
            'beta': beta,
            'timestep': timestep,
            'sim_time': sim_time
        })

    # Set index to run_name
    df = pd.DataFrame(rows)
    df.set_index('run_name', inplace=True)
    return df


def get_lf_df(data_dir: pathlib.Path) -> pd.DataFrame:
    run_dirs = sorted(data_dir.glob('[0-9][0-9]'))
    rows = []

    for run_dir in run_dirs:
        laser_fwhm = extract_laser_fwhm(run_dir / 'GG-combustor.json')
        near_radius, far_radius, axial_length = extract_laser_geometry(run_dir / 'GG-combustor.json')
        alpha = axial_length / (2 * near_radius)
        beta = near_radius / far_radius

        # LF length scale is 3.175 mm, convert axial length to mm
        axial_length *= 3.175

        # LF time scale is 11.375 us, convert fwhm to us
        laser_fwhm *= 11.375

        for run in run_dir.glob('*.npz'):
            sim_time = extract_sim_time_lf(run)
            rows.append({
                'run_path': run,
                'sim_time': sim_time,
                'laser_fwhm': laser_fwhm,
                'near_radius': near_radius,
                'far_radius': far_radius,
                'axial_length': axial_length,
                'alpha': alpha,
                'beta': beta
            })

    # Set index to run_dir
    df = pd.DataFrame(rows)
    df.set_index('run_path', inplace=True)
    return df
