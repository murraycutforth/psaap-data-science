import numpy as np
import matplotlib.pyplot as plt


def cc1d(x0, x1, t):
    """Utility function for computing convex combination of two points."""
    assert 0 <= t <= 1
    return (1 - t) * x0 + t * x1


def de_castaljau(points, t):
    """De Casteljau algorithm for computing Bezier curve at a particular parameter value t
    """
    assert len(points) > 1
    assert 0 <= t <= 1

    if len(points) == 2:
        return cc1d(points[0], points[1], t)
    else:
        new_points = [cc1d(points[i], points[i + 1], t) for i in range(len(points) - 1)]
        return de_castaljau(new_points, t)


def bezier_curve(points, N: int = 100):
    """Compute Bezier curve given control points, using N evaluation points.
    """
    ts = np.linspace(0, 1, N)
    ys = np.array([de_castaljau(points, t) for t in ts])
    return ys


def Nip(i, p, knots, t):
    """
    Compute N_{i,p}(u) for B-spline curve according to Cox-de Boor recursion formula.

    Code translated from p74, "The NURBS book" by Piegl and Tiller.

    Parameters:
    i : int
        Current control point index
    p : int
        The piecewise polynomial degree
    knots : list of float
        The knot vector
    u : float
        The value of the current curve point. Valid range from 0 <= u <= 1

    Returns:
    float
        N_{i,p}(u)
    """
    N = [0.0] * (p + 1)
    m = len(knots) - 1

    if (i == 0 and t == knots[0]) or (i == (m - p - 1) and t == knots[m]):
        return 1.0

    if t < knots[i] or t >= knots[i + p + 1]:
        return 0.0

    for j in range(p + 1):
        if knots[i + j] <= t < knots[i + j + 1]:
            N[j] = 1.0
        else:
            N[j] = 0.0

    for k in range(1, p + 1):
        if N[0] == 0.0:
            saved = 0.0
        else:
            saved = ((t - knots[i]) * N[0]) / (knots[i + k] - knots[i])

        for j in range(p - k + 1):
            Uleft = knots[i + j + 1]
            Uright = knots[i + j + k + 1]

            if N[j + 1] == 0.0:
                N[j] = saved
                saved = 0.0
            else:
                temp = N[j + 1] / (Uright - Uleft)
                N[j] = saved + (Uright - t) * temp
                saved = (t - Uleft) * temp

    return N[0]


def b_spline_curve(knots, points, degree, N: int = 100):
    """Compute B-spline curve given knots, control points, and degree, using N evaluation points.
    """
    ts = np.linspace(knots[0], knots[-1], N)
    Ni_ps = np.array([[Nip(i, degree, knots, t) for i in range(len(points))] for t in ts])
    ys = np.array([np.dot(Ni_ps[i], points) for i in range(N)])
    return ys


def nurbs_curve(knots, points, weights, degree, N: int = 100):
    """Compute NURBS curve given knots, control points, weights, and degree, using N evaluation points.
    """
    assert len(weights) == len(points)

    ts = np.linspace(knots[0], knots[-1], N)
    Ni_ps = np.array([[Nip(i, degree, knots, t) for i in range(len(points))] for t in ts])
    Ri_ps = Ni_ps * weights / np.dot(Ni_ps, weights)[..., np.newaxis]
    ys = np.array([np.dot(Ri_ps[i], points) for i in range(N)])

    return ys




# Some visual sanity checks of my implementations below

if __name__ == '__main__':

    def test_bezier_2():
        p0 = np.array([0, 0])
        p1 = np.array([3, 1])
        p2 = np.array([2, 0])

        ys = bezier_curve([p0, p1, p2], N=100)

        plt.plot(ys[:, 0], ys[:, 1])
        plt.show()


    def test_bezier_6():
        p0 = np.array([0, 0])
        p1 = np.array([1, 1])
        p2 = np.array([2, 1])
        p3 = np.array([3, 0])
        p4 = np.array([2, -3])
        p5 = np.array([0, 1])

        ys = bezier_curve([p0, p1, p2, p3, p4, p5], N=100)

        plt.plot(ys[:, 0], ys[:, 1])
        plt.show()


    def test_b_spline_2():
        knots = [0, 0, 0, 1, 1, 1]  # This should result in equivalence to bezier
        p0 = np.array([0, 0])
        p1 = np.array([3, 1])
        p2 = np.array([2, 0])
        points = [p0, p1, p2]
        degree = 2

        ys = b_spline_curve(knots, points, degree, N=10)
        ys_bezier = bezier_curve(points, N=10)

        plt.plot(ys[:, 0], ys[:, 1])
        plt.plot(ys_bezier[:, 0], ys_bezier[:, 1], ls=':')
        plt.show()

    def test_b_spline_2_longer_curve():
        points = [np.array([0, 0]), np.array([1, 1]), np.array([2, 1]), np.array([3, 0]), np.array([2, -3]), np.array([0, 1])]
        knots = [0, 0, 0, 0.7, 0.8, 0.9, 1, 1, 1]
        degree = 2
        ys = b_spline_curve(knots, points, degree, N=100)
        plt.plot(ys[:, 0], ys[:, 1])

        points = [np.array([0, 0]), np.array([1, 1]), np.array([2, 1]), np.array([3, 0]), np.array([2, -3]), np.array([0, 1])]
        knots = [0, 0, 0, 0.3, 0.3, 0.3, 1, 1, 1]
        degree = 2
        ys = b_spline_curve(knots, points, degree, N=100)
        plt.plot(ys[:, 0], ys[:, 1])
        plt.scatter([p[0] for p in points], [p[1] for p in points], color='r')

        plt.show()

    def test_quadratic_nurbs_equivalence():
        # In this test we check that with weights set to 1, the NURBS curve is equivalent to the B-spline curve
        points = [np.array([0, 0]), np.array([1, 1]), np.array([2, 1])]
        weights = [1, 1, 1]
        knots = [0, 0, 0, 1, 1, 1]
        degree = 2
        ys = b_spline_curve(knots, points, degree, N=100)
        ys_nurbs = nurbs_curve(knots, points, weights, degree, N=100)

        plt.title('Quadratic B-spline and NURBS curves - should be overlain')
        plt.plot(ys[:, 0], ys[:, 1], label='B-spline')
        plt.plot(ys_nurbs[:, 0], ys_nurbs[:, 1], ls=':', label='NURBS')
        plt.legend()
        plt.show()


    def test_cubic_nurbs_circle():
        # Test the representation of unit circle using NURBS
        points = [np.array([1, 0]), np.array([1, 1]), np.array([0, 1]), np.array([-1, 1]), np.array([-1, 0]), np.array([-1, -1]), np.array([0, -1]), np.array([1, -1]), np.array([1, 0])]
        weights = [1, np.sqrt(2) / 2, 1, np.sqrt(2) / 2, 1, np.sqrt(2) / 2, 1, np.sqrt(2) / 2, 1]
        knots = [0, 0, 0, .25, .25, .5, .5, .75, .75, 1, 1, 1]
        degree = 2

        ys = ys_nurbs = nurbs_curve(knots, points, weights, degree, N=100)

        plt.title('Cubic NURBS circle')
        plt.plot(ys[:, 0], ys[:, 1], label='NURBS circle')

        points_circle = np.array([[np.cos(2 * np.pi * i / 100), np.sin(2 * np.pi * i / 100)] for i in range(100)])
        plt.plot(points_circle[:, 0], points_circle[:, 1], ls=':', color='r', label='Exact circle')

        plt.legend()
        plt.show()

    #test_bezier_2()
    #test_bezier_6()
    #test_b_spline_2()
    #test_b_spline_2_longer_curve()
    #test_quadratic_nurbs_equivalence()
    test_cubic_nurbs_circle()