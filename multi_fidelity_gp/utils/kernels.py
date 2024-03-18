import jax
from jax import numpy as np


@jax.jit
def matern_kernel_52(X1, X2, theta):
    """The Matern kernel function. This function computes the covariance matrix between the data points in X1 and X2,
    given the kernel parameters theta. The Matern kernel is a generalisation of the RBF kernel, and has an additional
    parameter nu, which controls the smoothness of the function. When nu=0.5, the Matern kernel is equivalent to the
    RBF kernel.
    """
    var = theta[0]
    length = theta[1:]
    diffs = np.expand_dims(X1 / length, 1) - np.expand_dims(X2 / length, 0)
    r2 = np.sum(diffs**2 + 1e-9, axis=2)
    return var * (1.0 + np.sqrt(5.0*r2) + 5.0*r2/3.0) * np.exp(-np.sqrt(5.0*r2))
