"""This file just defines wrapper classes for different approximation methods, so that we have a consistent
interface for evaluating the parametrised curve s(t)
"""

import torch
import numpy as np

from nurbs import b_spline_curve, nurbs_curve, Nip
from neural_nurbs import NeuralBspline, NeuralNURBs
from scipy.interpolate import BSpline


class MyBSpline():
    def __init__(self, ctrl_pts, knot_vector, degree):
        self.ctrl_pts = ctrl_pts
        self.knot_vector = knot_vector
        self.degree = degree

    def __call__(self, ts):
        Ni_ps = np.array([[Nip(i, self.degree, self.knot_vector, t) for i in range(len(self.ctrl_pts))] for t in ts])
        ys = np.array([np.dot(Ni_ps[j], self.ctrl_pts) for j in range(len(ts))])
        return ys


class ScipyBspline():
    """Sanity check my own implementation by comparing to scipy
    """
    def __init__(self, ctrl_pts, knot_vector, degree):
        self.ctrl_pts = ctrl_pts
        self.knot_vector = knot_vector
        self.degree = degree
        self.bspline = BSpline(knot_vector, ctrl_pts, degree)

    def __call__(self, ts):
        return self.bspline(ts)


class NeuralBsplineWrapper():
    def __init__(self, num_ctrl_pts, nn_depth, nn_width, ctrl_pts):
        self.nnbspline = NeuralBspline(num_ctrl_pts, nn_depth, nn_width)
        self.ctrl_pts = torch.tensor(ctrl_pts, dtype=torch.float32)

        t_training = torch.linspace(0, 1, num_ctrl_pts).unsqueeze(1)
        self.nnbspline.fit(t_training, self.ctrl_pts)

    def __call__(self, ts):
        ts = torch.tensor(ts, dtype=torch.float32).unsqueeze(1)
        return self.nnbspline(ts, self.ctrl_pts).detach().numpy()



class NeuralNURBSWrapper():
    def __init__(self, num_ctrl_pts, nn_depth, nn_width, ctrl_pts, weights):
        self.nnbspline = NeuralNURBs(num_ctrl_pts, nn_depth, nn_width, weights)
        self.ctrl_pts = torch.tensor(ctrl_pts, dtype=torch.float32)

        t_training = torch.linspace(0, 1, num_ctrl_pts).unsqueeze(1)
        self.nnbspline.fit(t_training, self.ctrl_pts)

    def __call__(self, ts):
        ts = torch.tensor(ts, dtype=torch.float32).unsqueeze(1)
        return self.nnbspline(ts, self.ctrl_pts).detach().numpy()
