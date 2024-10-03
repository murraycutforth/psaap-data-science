import numpy as np
from scipy.interpolate import griddata


def resample_point_cloud_to_regular_grid_2d(xyz: np.ndarray,
                                            v: np.ndarray,
                                            new_shape: tuple | np.ndarray,
                                            side_lengths: tuple | np.ndarray,
                                            #hull,
                                            origin_coords,
                                            method='nearest'):
    """Resample point cloud data to a regular grid.

    Args:
        xyz: Point cloud coordinates
        v: Point cloud data
        new_shape: Number of new cells in x, y, z directions
        L_x: Length in x-direction
        L_y: Length in y-direction
        L_z: Length in z-direction
        hull: Convex hull of the point cloud
        origin_coords: Origin of the new regular grid
    """
    assert xyz.shape[0] == v.shape[0]
    assert xyz.shape[1] == 3
    assert v.ndim == 1
    assert origin_coords.ndim == 1
    assert origin_coords.shape[0] == 3

    nx, ny, nz = new_shape
    L_x, L_y, L_z = side_lengths

    assert nx > 1
    assert ny > 1
    assert nz > 1
    assert L_x > 0
    assert L_y > 0
    assert L_z > 0

    # Create regular 3D grid in local coordinates
    x = np.linspace(0.0 + origin_coords[0], L_x + origin_coords[0], nx)
    y = np.linspace(0.0 + origin_coords[1], L_y + origin_coords[1], ny)
    z = np.linspace(0.0 + origin_coords[2], L_z + origin_coords[2], nz)
    grid_x, grid_y, grid_z = np.meshgrid(x, y, z, indexing='ij')

    # Transform point cloud data to local coordinates
    #patch_origin = np.min(xyz, axis=0)
    #xyz[:, 0] = xyz[:, 0] - patch_origin[0]
    #xyz[:, 1] = xyz[:, 1] - patch_origin[1]
    #xyz[:, 2] = xyz[:, 2] - patch_origin[2]

    # Undo the transformation of xyz
    #xyz[:, 0] = xyz[:, 0] + patch_origin[0]
    #xyz[:, 1] = xyz[:, 1] + patch_origin[1]
    #xyz[:, 2] = xyz[:, 2] + patch_origin[2]

    v_resampled = griddata(xyz, v, (grid_x, grid_y, grid_z), method=method)

    # Set values outside the convex hull to zero
    #grid_coords = np.stack((grid_x, grid_y, grid_z), axis=-1).reshape(-1, 3)
    #if nx != 1:
    #    grid_coords[:, 0] = grid_coords[:, 0] + patch_origin[0]
    #    grid_coords[:, 2] = grid_coords[:, 2] + patch_origin[2]

    #inside = is_point_in_hull_vectorised(hull, grid_coords)
    #v_resampled = v_resampled.reshape(-1)
    #v_resampled[~inside] = 0.0

    v_resampled = v_resampled.reshape(nx, ny, nz)

    return v_resampled


def is_point_in_hull_vectorised(hull, points):
    """Check inside/outside of convex hull for multiple points."""
    inside = np.ones(points.shape[0], dtype=bool)
    for eq in hull.equations:
        inside_this_line = np.einsum('i,ki->k', eq[:-1], points) + eq[-1] <= 0
        inside = inside & inside_this_line
    return inside
