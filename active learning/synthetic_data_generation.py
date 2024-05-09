from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
import pandas as pd


def latent_function(x):
    assert x.shape[-1] == 2

    # Define a hyperplane with normal vector [1, 1] and offset sqrt(2)
    n_hat = np.array([2, 1]) / np.sqrt(5)
    offset = np.sqrt(2) / 2

    f = np.dot(n_hat, x) - offset

    # Add a sinusoidal perturbation
    f -= 0.15 * np.sin(2 * np.pi * x[0]) * np.sin(2 * np.pi * (x[1] + 0.2))

    f = 1 - 1 / (1 + np.exp(-30 * f))

    return f


def visualise_latent_functions(f, title):
    # Contour plot of latent
    x = np.linspace(-0.1, 1.1, 100)
    y = np.linspace(-0.1, 1.1, 100)
    X, Y = np.meshgrid(x, y)
    Z = np.zeros_like(X)
    for i in range(X.shape[0]):
        for j in range(X.shape[1]):
            Z[i, j] = f(np.array([X[i, j], Y[i, j]]))

    fig = plt.figure()
    ax = fig.add_subplot(111)
    im = ax.contourf(X, Y, Z, 20, cmap='RdGy')

    # Add line at f=0 contour
    ax.contour(X, Y, Z, levels=[0], colors='black')

    fig.colorbar(im)
    ax.set_title(title)
    fig.savefig(f'output/synthetic_data_{title}.png')


def sample_bernoulli_outcome(xs: np.ndarray) -> np.ndarray:
    outcomes = []
    gen = np.random.default_rng(42)

    for x in xs:
        outcomes.append(gen.binomial(1, latent_function(x)))

    return np.array(outcomes)


def plot_ignition_samples(xs, outcomes):
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.scatter(xs[:, 0], xs[:, 1], c=outcomes, cmap='viridis')
    ax.set_title('High-fidelity samples')
    fig.savefig('output/synthetic_data_samples.png')


def prepare_numpy_experimental_offset_dataset() -> tuple[np.ndarray, np.ndarray]:
    """Prepare numpy arrays of shape (N, 2) for nominal and error coordinates, used to train the offset prediction model
    """
    test_spreadsheet_path = Path('../data/exp/Test Summary Sheet 20211220 original.xlsx')
    assert test_spreadsheet_path.exists()

    df = pd.read_excel(test_spreadsheet_path, engine='openpyxl')

    nominal = df[['Spark X Location [mm]', 'Spark Z Location [mm]']].values
    measured = df[['Spark X Measured [mm]', 'Spark Z Measured [mm]']].values

    scaler = get_scaler()
    nominal = scaler.transform(nominal)
    measured = scaler.transform(measured)

    error = measured - nominal

    return nominal, error


def get_scaler():
    scaler = MinMaxScaler()
    measured = get_test_spreadsheet_measured_df()
    scaler.fit(measured)
    return scaler


def get_test_spreadsheet_measured_df():
    test_spreadsheet_path = Path('../data/exp/Test Summary Sheet 20211220 original.xlsx')
    assert test_spreadsheet_path.exists()
    df = pd.read_excel(test_spreadsheet_path, engine='openpyxl')
    measured = df[['Spark X Measured [mm]', 'Spark Z Measured [mm]']].values
    return measured


def get_training_set():
    """The training set coordinates are taken from the real experimental data
    """
    measured = get_test_spreadsheet_measured_df()
    scaler = get_scaler()
    measured_normalised = scaler.transform(measured)
    assert np.all(measured_normalised >= 0) and np.all(measured_normalised <= 1)

    synthetic_outcomes = sample_bernoulli_outcome(measured_normalised)

    assert measured_normalised.shape[0] == synthetic_outcomes.shape[0]
    assert np.sum(synthetic_outcomes) > 0
    assert np.sum(synthetic_outcomes) < synthetic_outcomes.shape[0]

    return measured_normalised, synthetic_outcomes



def get_test_set():
    # Uniformly sample from the latent function
    gen = np.random.default_rng(42)
    xs = gen.uniform(-0.1, 1.1, size=(10000, 2))
    outcomes = sample_bernoulli_outcome(xs)
    return xs, outcomes


def get_pool_set_coords():
    # Uniformly sample from the latent function
    gen = np.random.default_rng(123)
    xs = gen.uniform(-0.1,1.1, size=(1000, 2))
    return xs


def main():
    visualise_latent_functions(latent_function, 'Latent function')
    xs = np.random.uniform(0, 1, size=(1000, 2))

    x_train, y_train = get_training_set()
    plot_ignition_samples(x_train, y_train)


if __name__ == '__main__':
    main()