"""
This script solves the 1D steady Burgers' equation with slightly asymmetric Dirichlet BCs.
"""

from dolfinx import mesh, fem, log
from dolfinx.nls.petsc import NewtonSolver
from dolfinx.fem.petsc import NonlinearProblem
import ufl
from mpi4py import MPI
import numpy as np
import matplotlib.pyplot as plt


gen = np.random.default_rng()


def sample_hf_solution(nu: float):
    domain = mesh.create_unit_interval(MPI.COMM_WORLD, 128)
    return solve_steady_1D_burgers(domain, nu)


def sample_lf_solution(nu: float):
    domain = mesh.create_unit_interval(MPI.COMM_WORLD, 128)
    return solve_steady_1D_burgers(domain, nu + 3e-2)


def solve_steady_1D_burgers(domain, nu):
    bc_offset = 1e-2 * gen.normal()

    V = fem.functionspace(domain, ("Lagrange", 1))
    u = fem.Function(V)
    v = ufl.TestFunction(V)

    # Boundary conditions
    u_BC = fem.Function(V)
    u_BC.interpolate(lambda x: 1.0 + bc_offset - 2.0 * x[0] + bc_offset)

    def boundary_marker(x):
        return np.isclose(x[0], 0.0) | np.isclose(x[0], 1.0)

    fdim = domain.topology.dim - 1
    boundary_facets = mesh.locate_entities_boundary(domain, fdim, boundary_marker)
    bc = fem.dirichletbc(u_BC, fem.locate_dofs_topological(V, fdim, boundary_facets))

    F = \
        (nu * ufl.inner(ufl.grad(u), ufl.grad(v))
         + ufl.inner(u * u.dx(0), v)
         ) * ufl.dx

    problem = NonlinearProblem(F, u, bcs=[bc])
    solver = NewtonSolver(MPI.COMM_WORLD, problem)
    solver.convergence_criterion = "incremental"
    solver.rtol = 1e-6
    solver.report = True
    log.set_log_level(log.LogLevel.WARNING)

    n, converged = solver.solve(u)
    assert converged

    xs = V.tabulate_dof_coordinates()[:, 0]
    vertex_u = u.x.array

    return vertex_u, xs


if __name__ == '__main__':
    nus = np.linspace(0.02, 0.2, 6)

    fig, axs = plt.subplots(1, 6, figsize=(10, 2), dpi=200, sharex=True, sharey=True)

    for i, nu in enumerate(nus):
        for _ in range(100):
            xs, vertex_u = sample_hf_solution(nu)
            axs[i].plot(xs, vertex_u, color='C0', alpha=0.2)
            xs, vertex_u = sample_lf_solution(nu)
            axs[i].plot(xs, vertex_u, color='C1', alpha=0.2, linestyle='--')
        axs[i].set_title(f"$\\nu$={nu:.2g}")

    axs[-1].plot([], [], color='C0', alpha=0.2, label='HF')
    axs[-1].plot([], [], color='C1', alpha=0.2, linestyle='--', label='LF')
    axs[-1].legend()

    plt.show()


