import logging
import numpy as np
from scipy.optimize import least_squares
import matplotlib.pyplot as plt
from logistic_classifier_experimental_data.utils import load_all_data, normalise_data

logger = logging.getLogger(__name__)


def main():
    X_train, Y_train, time_train, X_test, Y_test, time_test = load_all_data()

    # print original min, max, mean of features
    print('X_train min:', np.min(X_train, axis=0))
    print('X_train max:', np.max(X_train, axis=0))
    print('X_train mean:', np.mean(X_train, axis=0))
    print('X_train var:', np.std(X_train, axis=0)**2)

    X_test_norm, X_train_norm, time_test, time_train = normalise_data(X_test, X_train, time_test, time_train)

    sanity_check_sigmoid_fit()
    sanity_check_data(time_train, Y_train)

    Y_test_sigmoid, Y_train_sigmoid = fit_all_sigmoids(Y_test, Y_train, time_test, time_train)

    plot_fits(Y_test_sigmoid, Y_train_sigmoid, time_test, time_train)

    dataset = {
        "X_train": X_train,
        "Y_train": Y_train_sigmoid,
        "time_train": time_train,
        "X_test": X_test,
        "Y_test": Y_test_sigmoid,
        "time_test": time_test,
    }

    np.savez("processed_dataset_unnormalised.npz", **dataset)


def plot_fits(Y_test_sigmoid, Y_train_sigmoid, time_test, time_train):
    # Show distribution of parameter values
    fig, axs = plt.subplots(2, 3, figsize=(15, 10))
    axs[0, 0].hist(Y_train_sigmoid[:, 0], bins=20)
    axs[0, 0].set_title("x0 train")
    axs[0, 1].hist(Y_train_sigmoid[:, 1], bins=20)
    axs[0, 1].set_title("k train")
    axs[0, 2].hist(Y_train_sigmoid[:, 2], bins=20)
    axs[0, 2].set_title("A train")
    axs[1, 0].hist(Y_test_sigmoid[:, 0], bins=20)
    axs[1, 0].set_title("x0 test")
    axs[1, 1].hist(Y_test_sigmoid[:, 1], bins=20)
    axs[1, 1].set_title("k test")
    axs[1, 2].hist(Y_test_sigmoid[:, 2], bins=20)
    axs[1, 2].set_title("A test")
    plt.show()
    # Show all the sigmoid fits
    fig, axs = plt.subplots(2, 1, figsize=(15, 10))
    for params in Y_train_sigmoid:
        axs[0].plot(time_train, sigmoid(time_train, *params))
    for params in Y_test_sigmoid:
        axs[1].plot(time_test, sigmoid(time_test, *params))
    plt.show()


def sanity_check_data(time, Y):
    for y in Y:
        assert y.shape == time.shape
        plt.plot(time, y)
    plt.show()


def fit_sigmoid_to_pressure_trace(pressure_trace: np.ndarray, times: np.ndarray) -> tuple[float, float, float]:
    """
    Fit a sigmoid to the pressure trace and return the parameters of the sigmoid.
    """
    assert len(times) == len(pressure_trace)

    def sigmoid_residuals(params):
        x0, k, A = params
        return pressure_trace - sigmoid(times, x0, k, A)

    # Initial guess for the parameters
    params_initial_guess = [0.5, 1, 1]

    res = least_squares(sigmoid_residuals, params_initial_guess, bounds=([0, 0, 0], [1, 100, 1]))
    x0, k, A = res.x

    assert res.success, f"Least squares failed to converge with status {res.status} and message {res.message}"
    logger.info(f"Least squares final cost: {res.cost}")

    return x0, k, A


def sigmoid(x, x0, k, A):
    """
    x: array-like
        The independent variable.
    x0: float
        The x-value of the sigmoid's midpoint.
    k: float
        The steepness of the sigmoid.
    A: float
        The maximum value of the sigmoid.
    """
    return A / (1 + np.exp(-k * (x - x0)))


def sanity_check_sigmoid_fit():
    # Check the fitting process using analytic data
    times_verify = np.linspace(0, 1, 100)
    trace_verify_exact = sigmoid(times_verify, 0.1, 10, 1)
    x0, k, A = fit_sigmoid_to_pressure_trace(trace_verify_exact, times_verify)
    assert np.isclose(x0, 0.1, atol=1e-6)
    assert np.isclose(k, 10, atol=1e-6)
    assert np.isclose(A, 1, atol=1e-6)

    # Check the fitting process using noisy data
    np.random.seed(0)
    trace_verify_exact = sigmoid(times_verify, 0.5, 6, 0.8)
    trace_verify_noisy = trace_verify_exact + np.random.normal(scale=0.01, size=times_verify.shape)
    x0, k, A = fit_sigmoid_to_pressure_trace(trace_verify_noisy, times_verify)
    assert np.isclose(x0, 0.5, atol=1e-1), f"x0={x0}"
    assert np.isclose(k, 6, atol=1e0), f"k={k}"
    assert np.isclose(A, 0.8, atol=1e-1), f"A={A}"


def fit_all_sigmoids(Y_test, Y_train, time_test, time_train):
    Y_train_sigmoid = []
    for y in Y_train:
        assert y.shape == time_train.shape
        x0, k, A = fit_sigmoid_to_pressure_trace(y, time_train)

        if A < 0.5:  # Manually set params for all non-ignition traces
            x0 = 0.5
            k = 1

        Y_train_sigmoid.append([x0, k, A])

    Y_test_sigmoid = []
    for y in Y_test:
        assert y.shape == time_test.shape
        x0, k, A = fit_sigmoid_to_pressure_trace(y, time_test)

        if A < 0.5:  # Manually set params for all non-ignition traces
            x0 = 0.5
            k = 1

        Y_test_sigmoid.append([x0, k, A])

    Y_train_sigmoid = np.array(Y_train_sigmoid)
    Y_test_sigmoid = np.array(Y_test_sigmoid)

    return Y_test_sigmoid, Y_train_sigmoid


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    main()
