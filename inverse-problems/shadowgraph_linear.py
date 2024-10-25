import unittest

import numpy as np
import einops


def ind_to_3d(i, j, k, Nx, Ny, Nz) -> int:
    """C-style ordering of 3D indices
    Equivalent to einops.rearrange(x, 'i j k -> (i j k)')
    """
    return i * Ny * Nz + j * Nz + k


def integrate_z_operator(Nx, Ny, Nz) -> np.array:
    """Construct the integration operator for the z axis
    """
    A = np.zeros((Nx * Ny, Nx * Ny * Nz))
    for i in range(Nx * Ny):
        for j in range(Nx * Ny * Nz):
            k = j // Nz
            A[i, j] = 1 if k == i else 0
    return A


def grad_2_x_operator(Nx, Ny, Nz, dx = 1.0) -> np.array:
    """Construct the second derivative operator for the x axis
    """
    assert Nx >= 3
    A = np.zeros((Nx * Ny * Nz, Nx * Ny * Nz))

    # i=0 BC, covers elements [0, Ny * Nz) in output vector
    for i in range(Ny * Nz):
        A[i, i] = -1
        A[i, i + Ny * Nz] = 1

    # i=Nx-1 BC, covers elements [(Nx - 1) * Ny * Nz, Nx * Ny * Nz) in output vector
    for i in range((Nx - 1) * Ny * Nz, Nx * Ny * Nz):
        A[i, i] = -1
        A[i, i - Ny * Nz] = 1

    # Interior points
    for i in range(Ny * Nz, (Nx - 1) * Ny * Nz):
        A[i, i - Ny * Nz] = 1
        A[i, i] = -2
        A[i, i + Ny * Nz] = 1

    return A / dx ** 2


def grad_2_y_operator(Nx, Ny, Nz, dy = 1.0) -> np.array:
    """Construct the second derivative operator for the y axis
    """
    assert Ny >= 3
    A = np.zeros((Nx * Ny * Nz, Nx * Ny * Nz))

    bc_inds = set()

    # j=0 BC, covers elements i * Nx * Nz + k for all i, k
    for i in range(Nx):
        for j in range(Nz):
            vec_ind = ind_to_3d(i, 0, j, Nx, Ny, Nz)
            bc_inds.add(vec_ind)
            A[vec_ind, vec_ind] = -1
            A[vec_ind, vec_ind + Nz] = 1

    # j=Ny-1 BC, covers elements i * Nx * Nz + k for all i, k
    for i in range(Nx):
        for j in range(Nz):
            vec_ind = ind_to_3d(i, Ny - 1, j, Nx, Ny, Nz)
            bc_inds.add(vec_ind)
            A[vec_ind, vec_ind] = -1
            A[vec_ind, vec_ind - Nz] = 1

    # Interior points
    for i in range(Nx * Ny * Nz):
        if i not in bc_inds:
            A[i, i - Nz] = 1
            A[i, i] = -2
            A[i, i + Nz] = 1

    return A / dy ** 2


class TestOperators(unittest.TestCase):
    """Lots and lots of AI generated tests to give some confidence in the operators above
    """
    def setUp(self):
        # Constant volume
        self.ones_vol = np.ones((2, 2, 2))
        self.ones_vec = einops.rearrange(self.ones_vol, 'i j k -> (i j k)')

        # Volume in which elements increase linearly in x direction
        self.N = 5
        self.x_linear_vol = np.zeros((self.N, self.N, self.N))
        for i in range(self.N):
            self.x_linear_vol[i, :, :] = i
        self.x_linear_vec = einops.rearrange(self.x_linear_vol, 'i j k -> (i j k)')

        # Volume in which elements increase as i**2 in x direction
        self.x_quad_vol = np.zeros((self.N, self.N, self.N))
        for i in range(self.N):
            self.x_quad_vol[i, :, :] = i ** 2
        self.x_quad_vec = einops.rearrange(self.x_quad_vol, 'i j k -> (i j k)')

        # Volume in which elements increase as j**2 in y direction
        self.y_quad_vol = np.zeros((self.N, self.N, self.N))
        for j in range(self.N):
            self.y_quad_vol[:, j, :] = j ** 2
        self.y_quad_vec = einops.rearrange(self.y_quad_vol, 'i j k -> (i j k)')

    def test_ind_to_3d(self):
        self.assertEqual(ind_to_3d(0, 0, 0, 10, 10, 10), 0)
        self.assertEqual(ind_to_3d(0, 0, 1, 10, 10, 10), 1)
        self.assertEqual(ind_to_3d(0, 1, 0, 10, 10, 10), 10)
        self.assertEqual(ind_to_3d(1, 0, 0, 10, 10, 10), 100)

    def test_integrate_z_operator_0(self):
        A = integrate_z_operator(2, 2, 2)
        self.assertEqual(A.shape, (4, 8))
        self.assertTrue(np.allclose(A.sum(axis=0), np.array([1, 1, 1, 1, 1, 1, 1, 1])))
        result = A @ self.ones_vec
        self.assertTrue(np.allclose(result, einops.rearrange(self.ones_vol.sum(axis=2), 'i j -> (i j)')))
        self.assertEqual(result.shape, (4,))

    def test_integrate_z_operator_1(self):
        A = integrate_z_operator(self.N, self.N, self.N)
        result = A @ self.x_linear_vec
        self.assertTrue(np.allclose(result, einops.rearrange(self.x_linear_vol.sum(axis=2), 'i j -> (i j)')))

    def test_integrate_z_operator_large(self):
        Nx, Ny, Nz = 4, 4, 4
        vol = np.ones((Nx, Ny, Nz))
        vec = einops.rearrange(vol, 'i j k -> (i j k)')
        A = integrate_z_operator(Nx, Ny, Nz)
        result = A @ vec
        self.assertTrue(np.allclose(result, einops.rearrange(vol.sum(axis=2), 'i j -> (i j)')))

    def test_integrate_z_operator_non_cubic(self):
        Nx, Ny, Nz = 3, 2, 4
        vol = np.ones((Nx, Ny, Nz))
        vec = einops.rearrange(vol, 'i j k -> (i j k)')
        A = integrate_z_operator(Nx, Ny, Nz)
        result = A @ vec
        self.assertTrue(np.allclose(result, einops.rearrange(vol.sum(axis=2), 'i j -> (i j)')))

    def test_integrate_z_operator_single_z(self):
        Nx, Ny, Nz = 3, 3, 1
        vol = np.ones((Nx, Ny, Nz))
        vec = einops.rearrange(vol, 'i j k -> (i j k)')
        A = integrate_z_operator(Nx, Ny, Nz)
        result = A @ vec
        self.assertTrue(np.allclose(result, einops.rearrange(vol.sum(axis=2), 'i j -> (i j)')))

    def test_grad_2_x_operator_0(self):
        A = grad_2_x_operator(3, 3, 3)
        self.assertEqual(A.shape, (27, 27))
        self.assertTrue(np.allclose(A.sum(axis=0), np.zeros((27,))))
        result = A @ np.ones((27,))
        self.assertTrue(np.allclose(result, np.zeros((27,))))

    def test_grad_2_x_operator_1(self):
        A = grad_2_x_operator(self.N, self.N, self.N)
        result = A @ self.x_linear_vec
        # First 25 elements should be 1, middle 0, last 25 -1
        self.assertTrue(np.allclose(result[:25], np.ones((25,))))
        self.assertTrue(np.allclose(result[25:-25], np.zeros((self.N * self.N * self.N - 50,))))
        self.assertTrue(np.allclose(result[-25:], -np.ones((25,))))

    def test_grad_2_x_operator_2(self):
        A = grad_2_x_operator(self.N, self.N, self.N)
        result = A @ self.x_quad_vec
        # First 25 elements should be 1, middle 2, last 25 -7
        self.assertTrue(np.allclose(result[:25], 1 * np.ones((25,))))
        self.assertTrue(np.allclose(result[25:-25], 2 * np.ones((self.N * self.N * self.N - 50,))))
        self.assertTrue(np.allclose(result[-25:], -7 * np.ones((25,))))

    def test_grad_2_x_operator_3(self):
        # Check that operator predicts zero for y_quad_vol
        A = grad_2_x_operator(self.N, self.N, self.N)
        result = A @ self.y_quad_vec
        self.assertTrue(np.allclose(result, np.zeros((self.N * self.N * self.N,))))

    def test_grad_2_y_operator_shape(self):
        A = grad_2_y_operator(self.N, self.N, self.N)
        self.assertEqual(A.shape, (self.N * self.N * self.N, self.N * self.N * self.N))

    def test_grad_2_y_operator_boundary_conditions(self):
        A = grad_2_y_operator(self.N, self.N, self.N)
        result = A @ np.ones((self.N * self.N * self.N,))
        self.assertTrue(np.allclose(result, np.zeros((self.N * self.N * self.N,))))

    def test_grad_2_y_operator_quadratic(self):
        A = grad_2_y_operator(self.N, self.N, self.N)
        result = A @ self.y_quad_vec
        # All elements should either be 2, -7, or 1
        unique = set(np.unique(result))
        self.assertEqual(len(unique), 3)
        self.assertTrue(np.allclose(sorted(unique), [-7, 1, 2]))

    def test_grad_2_y_operator_zero_for_x_quad(self):
        A = grad_2_y_operator(self.N, self.N, self.N)
        result = A @ self.x_quad_vec
        self.assertTrue(np.allclose(result, np.zeros((self.N * self.N * self.N,))))

