from pathlib import Path

import numpy as np
import skimage.measure
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection


def write_slice_plot(vol: np.array, dx: float, outpath: Path, verbose: bool) -> None:
    assert len(vol.shape) == 3
    assert vol.shape[0] == vol.shape[1] == vol.shape[2]

    fig, axs = plt.subplots(1, 3, figsize=(15, 5))

    nx, ny, nz = vol.shape
    im = axs[0].imshow(vol[nx // 2, :, :])
    fig.colorbar(im, ax=axs[0])

    im = axs[1].imshow(vol[:, ny // 2, :])
    fig.colorbar(im, ax=axs[1])

    im = axs[2].imshow(vol[:, :, nz // 2])
    fig.colorbar(im, ax=axs[2])

    plt.tight_layout()

    if verbose:
        print(f"saving {outpath}")
    plt.savefig(outpath)


def write_isosurface_and_slice_plot(vol: np.array, dx: float, level, outpath: Path, title: str) -> None:
    assert len(vol.shape) == 3

    fig = plt.figure(figsize=(8, 8), dpi=200)
    grid = plt.GridSpec(2, 3, height_ratios=[2, 1])

    # Top row is 3D isosurface plot

    ax1 = fig.add_subplot(grid[0, :], projection="3d")

    ax1.set_xlim(0, vol.shape[0] * dx)
    ax1.set_ylim(0, vol.shape[1] * dx)
    ax1.set_zlim(0, vol.shape[2] * dx)

    verts, faces, normals, values = skimage.measure.marching_cubes(
        vol, level, spacing=(dx, dx, dx), allow_degenerate=False, method='lewiner'
    )

    mesh = Poly3DCollection(verts[faces])
    mesh.set_edgecolor("k")
    mesh.set_linewidth(0.05)
    mesh.set_alpha(0.9)

    ax1.plot_trisurf(verts[:, 0], verts[:, 1], np.zeros_like(verts[:, 2]), triangles=faces, color='gray', alpha=0.3)
    ax1.plot_trisurf(verts[:, 0], vol.shape[1] * np.ones_like(verts[:, 1]) * dx, verts[:, 2], triangles=faces, color='gray', alpha=0.3)
    ax1.plot_trisurf(np.zeros_like(verts[:, 0]), verts[:, 1], verts[:, 2], triangles=faces, color='gray', alpha=0.3)

    ax1.add_collection3d(mesh)
    ax1.set_aspect('equal')
    ax1.set_title(f'Isosurface at {level} [K]')

    # Bottom row is 3 orthogonal slices

    for i in range(3):
        ax = fig.add_subplot(grid[1, i])
        slice = np.take(vol, indices=vol.shape[i] // 2, axis=i)
        im = ax.imshow(slice, origin='lower', vmin=vol.min(), vmax=vol.max())
        fig.colorbar(im, ax=ax)
        ax.set_title(f'Slice {i} (index {vol.shape[i] // 2})')

    fig.suptitle(title)
    plt.tight_layout()
    plt.savefig(outpath)
    plt.close(fig)




def write_isosurface_plot_from_arr(vol: np.ndarray, outname: Path, level: float, verbose: bool, title: str = None) -> None:
    assert len(vol.shape) == 3

    fig = plt.figure(figsize=(6, 6), dpi=200)
    ax = fig.add_subplot(111, projection="3d")

    ax.set_xlim(0, vol.shape[0])
    ax.set_ylim(0, vol.shape[1])
    ax.set_zlim(0, vol.shape[2])

    if np.any(vol > level):
        verts, faces, normals, values = skimage.measure.marching_cubes(
            vol, level, spacing=(1, 1, 1), allow_degenerate=False, method='lewiner'
        )
        mesh = Poly3DCollection(verts[faces])
        mesh.set_edgecolor("k")
        mesh.set_linewidth(0.05)
        mesh.set_alpha(0.9)

        # Project the mesh onto each plane
        ax.plot_trisurf(verts[:, 0], verts[:, 1], np.zeros_like(verts[:, 2]), triangles=faces, color='gray', alpha=0.3)
        ax.plot_trisurf(verts[:, 0], vol.shape[1] * np.ones_like(verts[:, 1]), verts[:, 2], triangles=faces, color='gray', alpha=0.3)
        ax.plot_trisurf(np.zeros_like(verts[:, 0]), verts[:, 1], verts[:, 2], triangles=faces, color='gray', alpha=0.3)

        # Plot 3D vis
        ax.add_collection3d(mesh)

        ax.set_aspect('equal')

    else:
        pass

    if title is not None:
        ax.set_title(title)

    plt.tight_layout()

    if verbose:
        print(f"saving {outname}")
    plt.savefig(outname)
    plt.close(fig)


def write_isosurface_plot_with_spatial_coords(vol: np.ndarray, coords: np.ndarray, outname: Path, level: float, verbose: bool, title: str = None) -> None:
    # As above, but plot in physical space instead of mesh space

    assert len(vol.shape) == 3
    assert vol.shape == coords.shape[:3]
    assert coords.shape[3] == 3


def write_isosurface_mega_plot_from_arrs(temp_arrs, run_names, outpath, temperature_level, n, m):
    assert len(temp_arrs) == len(run_names)
    assert len(temp_arrs) <= n * m

    fig = plt.figure(figsize=(m * 4, n * 4), dpi=200)

    for i in range(n * m):
        ax = fig.add_subplot(n, m, i + 1, projection="3d")

        if i >= len(temp_arrs):
            continue

        temp_arr = temp_arrs[i]
        run_name = run_names[i]

        ax.set_title(run_name)
        ax.set_xlim(0, temp_arr.shape[0])
        ax.set_ylim(0, temp_arr.shape[1])
        ax.set_zlim(0, temp_arr.shape[2])

        if np.any(temp_arr > temperature_level):
            verts, faces, normals, values = skimage.measure.marching_cubes(
                temp_arr, temperature_level, spacing=(1, 1, 1), allow_degenerate=False, method='lewiner'
            )
            mesh = Poly3DCollection(verts[faces])
            mesh.set_edgecolor("k")
            mesh.set_linewidth(0.05)
            mesh.set_alpha(0.9)

            # Project the mesh onto each plane
            ax.plot_trisurf(verts[:, 0], verts[:, 1], np.zeros_like(verts[:, 2]), triangles=faces, color='gray', alpha=0.3)
            ax.plot_trisurf(verts[:, 0], temp_arr.shape[1] * np.ones_like(verts[:, 1]), verts[:, 2], triangles=faces, color='gray', alpha=0.3)
            ax.plot_trisurf(np.zeros_like(verts[:, 0]), verts[:, 1], verts[:, 2], triangles=faces, color='gray', alpha=0.3)

            ax.add_collection3d(mesh)
        else:
            pass

    plt.tight_layout()
    plt.savefig(outpath)
    print(f"Saved mega plot to {outpath}")
    plt.close(fig)

