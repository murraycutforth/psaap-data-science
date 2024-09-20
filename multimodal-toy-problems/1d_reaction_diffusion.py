import dolfinx
print(f"DOLFINx version: {dolfinx.__version__} based on GIT commit: {dolfinx.git_commit_hash} of https://github.com/FEniCS/dolfinx/")

from dolfinx import mesh, fem, log
from dolfinx.nls.petsc import NewtonSolver
from dolfinx.fem.petsc import NonlinearProblem
from petsc4py import PETSc
import ufl
from mpi4py import MPI
import numpy as np


def solve_reaction_diffusion(bif: float):

    domain = mesh.create_unit_interval(MPI.COMM_WORLD, 1000)

    # Define parameters
    D = fem.Constant(domain, PETSc.ScalarType(1))  # Diffusion coefficient
    a = fem.Constant(domain, PETSc.ScalarType(1))  # Reaction rate parameter

    # Define bifurcation parameter
    bif_parameter = fem.Constant(domain, PETSc.ScalarType(bif))  # You can change this value to explore bifurcation

    V = fem.functionspace(domain, ("Lagrange", 1))
    u = fem.Function(V)
    v = ufl.TestFunction(V)

    # Boundary conditions
    u_BC = fem.Function(V)
    x = ufl.SpatialCoordinate(domain)
    u_bc = 1 + x[0]*x[0]
    u_BC.interpolate(u_bc)
    def boundary_marker(x):
        return np.isclose(x[0], 0.0) | np.isclose(x[0], 1.0)
    fdim = domain.topology.dim - 1
    boundary_facets = mesh.locate_entities_boundary(domain, fdim, boundary_marker)
    bc = fem.dirichletbc(u_BC, fem.locate_dofs_topological(V, fdim, boundary_facets))

    # Define initial condition
    u_n = fem.Function(V)
    u_n.interpolate(fem.Constant(domain, PETSc.ScalarType(0)), V)  # Initial condition at t = 0


    assert 0



    # F = \
    #   ( nu * ufl.inner ( ufl.grad ( u ), ufl.grad ( v ) )
    #   + ufl.inner ( u * u.dx(0), v )
    #   ) * ufl.dx

    # problem = NonlinearProblem(F, u, bcs=[bc])

    # solver = NewtonSolver(MPI.COMM_WORLD, problem)
    # solver.convergence_criterion = "incremental"
    # solver.rtol = 1e-6
    # solver.report = True

    # log.set_log_level(log.LogLevel.WARNING)
    # n, converged = solver.solve(u)
    # assert (converged)

    # xs = V.tabulate_dof_coordinates()[:, 0]
    # vertex_u = u.x.array

    # return xs, vertex_u


gen = np.random.default_rng()
bifs = gen.normal(size=100) * 1e-2

results = list(map(solve_reaction_diffusion, bifs))
