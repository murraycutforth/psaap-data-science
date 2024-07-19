"""In this file we plot a quick visualisation of various interpolation methods using a bunch of small sets of
random points in 2D as the control points.
"""

import numpy as np
import matplotlib.pyplot as plt
import torch

from nurbs import b_spline_curve, nurbs_curve, Nip
from neural_nurbs import NeuralBspline, NeuralNURBs
from scipy.interpolate import BSpline

from spline_wrappers import MyBSpline, NeuralBsplineWrapper, NeuralNURBSWrapper




def visualise_b_spline_curves_random_2d_points():
    # Visualise the B-spline interpolation of random 2D points
    degree = 2
    num_ctrl_pts = 6
    knot_vector = np.linspace(0, 1, num_ctrl_pts + degree + 1 - 2 * (degree))
    knot_vector = np.concatenate([np.zeros(degree), knot_vector, np.ones(degree)])  # Interpolate the start and end exactly

    fig, axs = plt.subplots(4, 4, figsize=(6, 6), dpi=200)

    np.random.seed(0)

    for i in range(15):
        points = np.random.rand(num_ctrl_pts, 2)
        bspline = MyBSpline(points, knot_vector, degree)
        neuralspine = NeuralBsplineWrapper(num_ctrl_pts, 3, 32, points)
        #neuralnurbs = NeuralNURBSWrapper(num_ctrl_pts, 3, 32, points, np.ones(num_ctrl_pts))

        ys = bspline(np.linspace(0, 1, 100))
        ys_neural = neuralspine(np.linspace(0, 1, 100))
        #ys_neural_nurbs = neuralnurbs(np.linspace(0, 1, 100))

        ax = axs[i // 4, i % 4]
        ax.plot(ys[:, 0], ys[:, 1], label='B-Spline')
        ax.plot(ys_neural[:, 0], ys_neural[:, 1], label='Neural Spline')
        #ax.plot(ys_neural_nurbs[:, 0], ys_neural_nurbs[:, 1], label='Neural NURBS')
        ax.scatter([p[0] for p in points], [p[1] for p in points], color='r')

    # Legend in place of bottom right plot
    ax = axs[3, 3]
    ax.axis('off')
    ax.plot([], [], label='B-Spline')
    ax.plot([], [], label='Neural Spline')
    ax.legend(loc='center', bbox_to_anchor=(0.5, 0.5))

    fig.tight_layout()
    plt.show()


def main():
    visualise_b_spline_curves_random_2d_points()


if __name__ == "__main__":
    main()

