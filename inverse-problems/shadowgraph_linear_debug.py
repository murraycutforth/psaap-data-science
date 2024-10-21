# In this script, we play around with a linear forward model for shadowgraphy

import numpy as np
import matplotlib.pyplot as plt
from scipy.ndimage import gaussian_filter

from plotting_utils import vol_and_im_plot

def main():

    I_0 = 1
    c = -1
    dx = 2 / 100
    dy = 2 / 100
    dz = 2 / 100

    arr = construct_psaap_density_example()
    I = forward_model(I_0, c, arr, dx, dy, dz)

    vol_and_im_plot(arr, I)

    assert 0
    plt.imshow(I[2:, 20:140], cmap='gray')
    plt.colorbar()
    plt.show()

    arr = construct_n_circular_shock(100, 100, 100, 0.5, 0.9, 1.1)
    I = forward_model(I_0, c, arr, dx, dy, dz)

    plt.imshow(I)
    plt.colorbar()
    plt.show()

    arr = construct_n_gaussian(100, 100, 100, 0.1, 0.1, 1)
    I = forward_model(I_0, c, arr, dx, dy, dz)

    plt.imshow(I)
    plt.colorbar()
    plt.show()


def forward_model(I_0, c, n_arr, dx, dy, dz):
    """Linear forward model for shadowgraphy
    """
    grad_2_x_n = grad_2_x(n_arr, dx)
    grad_2_y_n = grad_2_y(n_arr, dy)
    return I_0 + c * int_z(grad_2_x_n + grad_2_y_n, dz)


def grad_2_x(arr, dx):
    """Compute the second derivative of arr with respect to x
    """
    arr_padded = np.pad(arr, pad_width=((1, 1), (0, 0), (0, 0)), mode='edge')  # Edge gives zero gradient on the boundaries
    grad_2_x_arr = (arr_padded[:-2, :, :] - 2 * arr_padded[1:-1, :, :] + arr_padded[2:, :, :]) / dx ** 2
    assert grad_2_x_arr.shape == arr.shape
    return grad_2_x_arr


def grad_2_y(arr, dy):
    """Compute the second derivative of arr with respect to y
    """
    arr_padded = np.pad(arr, ((0, 0), (1, 1), (0, 0)), mode='edge')
    grad_2_y_arr = (arr_padded[:, :-2, :] - 2 * arr_padded[:, 1:-1, :] + arr_padded[:, 2:, :]) / dy ** 2
    assert grad_2_y_arr.shape == arr.shape
    return grad_2_y_arr


def int_z(arr, dz):
    """Estimate integral over z axis using trapezium rule
    """
    return 0.5 * dz * (np.sum(arr[:, :, 1:], axis=2) + np.sum(arr[:, :, :-1], axis=2))
    #return np.trapz(arr, dx=dz, axis=2)


def construct_n_gaussian(Nx, Ny, Nz, std, A, B):
    """Construct a 3D Gaussian with standard deviation std
    """
    x = np.linspace(-1, 1, Nx)
    y = np.linspace(-1, 1, Ny)
    z = np.linspace(-1, 1, Nz)
    X, Y, Z = np.meshgrid(x, y, z, indexing='ij')
    arr = B + A * np.exp(-(X ** 2 + Y ** 2 + Z ** 2) / (2 * std ** 2))
    return arr


def construct_n_circular_shock(Nx, Ny, Nz, R, n_inside, n_outside):
    """Construct a 3D circular shock with radius R, constant in z direction
    """
    x = np.linspace(-1, 1, Nx)
    y = np.linspace(-1, 1, Ny)
    z = np.linspace(-1, 1, Nz)
    X, Y, Z = np.meshgrid(x, y, z, indexing='ij')
    arr = n_outside + n_inside * (np.sqrt(X ** 2 + Y ** 2) < R)
    return arr


def construct_spherical_shock(Nx, Ny, Nz, R, n_inside, n_outside, smoothed: bool = False):
    """Construct a 3D spherical shock with radius R
    """
    x = np.linspace(-1, 1, Nx)
    y = np.linspace(-1, 1, Ny)
    z = np.linspace(-1, 1, Nz)
    X, Y, Z = np.meshgrid(x, y, z, indexing='ij')
    arr = n_outside + n_inside * (np.sqrt(X ** 2 + Y ** 2 + Z ** 2) < R)

    if smoothed:
        # Apply a 3D Gaussian smoothing kernel
        arr = gaussian_filter(arr, sigma=1)

    return arr


def construct_psaap_density_example():
    rho_path = '/Users/murray/Projects/density_generative_model/output/3d_fixed_subdomain_data/72_0.npz'
    rho = np.load(rho_path)['rho']
    return rho


# TODO: assemble matrix A s.t. forward model is given by A @ u

if __name__ == '__main__':
    main()