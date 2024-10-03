import warnings

import numpy as np


def estimate_ejecta_velocity(times, positions):
    # First filter to values between 100 and 200 us
    print(f'Estimating ejecta velocity from data points: {times}, {positions}')
    times = np.array(times)
    positions = np.array(positions)

    assert len(times) == len(positions), "Times and positions must have the same length"

    mask = (times > 70) & (times < 200)
    times = times[mask]

    assert len(times) > 0, "No data points in the range 100-200 us"

    positions = positions[mask]

    # Convert to SI units
    times *= 1e-6
    positions *= 1e-3

    #ejecta_v, upper, lower = fit_slope_with_confidence_intervals(times, positions)
    ejecta_v = fit_slope(times, positions)
    print(f'Estimated ejecta velocity: {ejecta_v:.2f} m/s')

    return ejecta_v


def fit_slope(x, y):
    p = np.polyfit(x, y, 1)
    return p[0]


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

        # Catch RankWarning from polyfit
        with warnings.catch_warnings():
            warnings.simplefilter('error', np.RankWarning)

            try:
                p_sample = np.polyfit(x_sample, y_sample, 1)
                slopes.append(p_sample[0])
            except np.RankWarning:
                continue

    # Calculate confidence intervals
    lower_bound = np.percentile(slopes, (1 - confidence_level) / 2 * 100)
    upper_bound = np.percentile(slopes, (1 + confidence_level) / 2 * 100)

    return slope, lower_bound, upper_bound
