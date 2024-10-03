# Prepare the LF data for prediction of temperature field from input parameters
# Store dataset in the form of .npz files, where each file contains params, times, reference scales, and all temp.snapshots

import pathlib

import numpy as np

from laser_tuning.src.utils.utils_gg_combustor import extract_laser_fwhm, extract_laser_geometry


def main():
    base_dir = pathlib.Path('/Volumes/My Passport for Mac/laser_tuning/LF/hyperCubeSampling')
    out_dir = pathlib.Path('/Volumes/My Passport for Mac/laser_tuning/lf_neural_operator_dataset')
    out_dir.mkdir(exist_ok=True)

    run_dirs = list(base_dir.glob('[0-9][0-9]'))

    for run_dir in run_dirs:
        print(f'Processing {run_dir}')

        params_path = run_dir / 'GG-combustor.json'
        assert params_path.exists()

        iteration_data = []
        temp_arr_data = []
        sim_time_data = []

        # Extract the input params (beta, alpha, L, fwhm)
        laser_fwhm = extract_laser_fwhm(run_dir / 'GG-combustor.json')
        near_radius, far_radius, axial_length = extract_laser_geometry(run_dir / 'GG-combustor.json')
        alpha = axial_length / (2 * near_radius)
        beta = near_radius / far_radius
        params = {'alpha': alpha, 'beta': beta, 'L': axial_length, 'fwhm': laser_fwhm}

        data_volume_paths = list(run_dir.glob('data_*.npz'))

        for vol_path in data_volume_paths:
            data_volume = np.load(vol_path)
            temperature = data_volume['temperature'] * 300  # Convert to units of [K]
            sim_time = data_volume['simTime'] * 11.375  # Convert to units of [us]
            iteration = int(vol_path.stem.split('_')[-1])

            iteration_data.append(iteration)
            temp_arr_data.append(temperature)
            sim_time_data.append(sim_time)

        np.savez_compressed(out_dir / f'{run_dir.stem}.npz',
                            times=np.array(sim_time_data),
                            temperature_snapshots=np.array(temp_arr_data),
                            iteration=np.array(iteration_data),
                            **params)

        print(f'Saved {out_dir / f"{run_dir.stem}.npz"}')


if __name__ == '__main__':
    main()