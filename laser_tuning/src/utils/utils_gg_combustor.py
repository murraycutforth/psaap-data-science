import json
from pathlib import Path

import numpy as np


def read_gg_combustor_file(filepath: Path) -> dict:
    with open(filepath, 'r') as f:
        data = json.load(f)
    return data


def extract_iter_to_simtime(filepath: Path) -> dict:
    data = read_gg_combustor_file(filepath)
    iter_to_simtime = {int(row['iter']): row['sim time'] for row in data}
    return iter_to_simtime


def extract_laser_fwhm(filepath: Path) -> float:
    data = read_gg_combustor_file(filepath)
    return data['Flow']['laser']['pulseFWHM']


def extract_laser_geometry(filepath: Path) -> tuple:
    data = read_gg_combustor_file(filepath)
    near_radius = data['Flow']['laser']['nearRadius']
    far_radius = data['Flow']['laser']['farRadius']
    axial_length = data['Flow']['laser']['axialLength']
    return near_radius, far_radius, axial_length


def extract_laser_focal_location(filepath: Path) -> np.ndarray:
    data = read_gg_combustor_file(filepath)
    coords = data['Flow']['laser']['focalLocation']
    return np.array(coords)