"""
This script performs a simulation of flow past a cylinder using the Navier-Stokes equations
in a 2D domain, implemented with GMSH and DOLFINx. The simulation includes time-stepping
and boundary conditions for inflow, outflow, no-slip walls, and a circular obstacle.

Setup:
- Install conda environment for FEniCSx from https://anaconda.org/conda-forge/fenics-dolfinx
- Run 'pip install gmsh' to install the GMSH Python package

Usage:
- Run the script with the desired Reynolds number as a command-line argument.
  Example:
      mpirun -n 4 python3 flow_past_cylinder.py --Re 100
  
- The simulation will save velocity and pressure data as `.npy` files for each time step
  in a folder organized by the Reynolds number value.
  Example output folder: `output/Re100.000/`

- The drag and lift coefficients, as well as pressure differences, will be saved as `.png` 
  files in a `figures/Re{Reynolds}` folder.

Expected Behavior:
- The script generates a mesh for the flow domain (a rectangle with a circular obstacle),
  applies boundary conditions, and solves the incompressible Navier-Stokes equations.
- It saves the simulation results (velocity and pressure fields) for each time step as `.npy` files.
- At the final time step, it calculates and saves figures of physical quantities (drag, lift, pressure difference).
"""

import argparse
import os
from pathlib import Path

import gmsh
import matplotlib.pyplot as plt
import numpy as np
import tqdm.autonotebook
from mpi4py import MPI
from petsc4py import PETSc

from basix.ufl import element
from dolfinx.cpp.mesh import to_type, cell_entity_type
from dolfinx.fem import (Constant, Function, functionspace, assemble_scalar, dirichletbc,
                         form, locate_dofs_topological, set_bc)
from dolfinx.fem.petsc import (apply_lifting, assemble_matrix, assemble_vector, create_matrix,
                               create_vector, set_bc)
from dolfinx.geometry import bb_tree, compute_collisions_points, compute_colliding_cells
from dolfinx.graph import adjacencylist
from dolfinx.io import VTXWriter, gmshio
from dolfinx.mesh import create_mesh, meshtags_from_entities
from ufl import (FacetNormal, Measure, TestFunction, TrialFunction, as_vector, div, dot, dx, grad,
                 inner, lhs, nabla_grad, rhs)

# Parse command-line arguments
parser = argparse.ArgumentParser(description="Flow past a cylinder simulation")
parser.add_argument('--Re', type=float, required=True, help='Reynolds number')
args = parser.parse_args()
Re = args.Re

def get_save_path(Re):
    return Path("output") / f"Re{Re:.3f}"

# Check for a pre-existing simulation, and skip if found
save_path = get_save_path(Re)
if save_path.exists():
    print(f"Simulation for Re={Re} already exists. Skipping.")
    exit()

# Initialize GMSH
gmsh.initialize()

# Geometry parameters
L = 2.2
H = 0.41
c_x = c_y = 0.2
r = 0.05
gdim = 2
mesh_comm = MPI.COMM_WORLD
model_rank = 0

if mesh_comm.rank == model_rank:
    # Create geometry: rectangle and obstacle
    rectangle = gmsh.model.occ.addRectangle(0, 0, 0, L, H, tag=1)
    obstacle = gmsh.model.occ.addDisk(c_x, c_y, 0, r, r)
    # Subtract obstacle from rectangle
    gmsh.model.occ.cut([(gdim, rectangle)], [(gdim, obstacle)], removeObject=True, removeTool=True)
    gmsh.model.occ.synchronize()

    # Add physical groups
    fluid_marker = 1
    volumes = gmsh.model.getEntities(dim=gdim)
    gmsh.model.addPhysicalGroup(volumes[0][0], [volumes[0][1]], fluid_marker)
    gmsh.model.setPhysicalName(volumes[0][0], fluid_marker, "Fluid")

    # Define boundary markers
    inlet_marker, outlet_marker, wall_marker, obstacle_marker = 2, 3, 4, 5
    inflow, outflow, walls, obstacle_entities = [], [], [], []

    boundaries = gmsh.model.getBoundary(volumes, oriented=False)
    for boundary in boundaries:
        center_of_mass = gmsh.model.occ.getCenterOfMass(boundary[0], boundary[1])
        if np.allclose(center_of_mass, [0, H / 2, 0]):
            inflow.append(boundary[1])
        elif np.allclose(center_of_mass, [L, H / 2, 0]):
            outflow.append(boundary[1])
        elif np.isclose(center_of_mass[1], H) or np.isclose(center_of_mass[1], 0):
            walls.append(boundary[1])
        else:
            obstacle_entities.append(boundary[1])

    gmsh.model.addPhysicalGroup(1, inflow, inlet_marker)
    gmsh.model.setPhysicalName(1, inlet_marker, "Inlet")
    gmsh.model.addPhysicalGroup(1, outflow, outlet_marker)
    gmsh.model.setPhysicalName(1, outlet_marker, "Outlet")
    gmsh.model.addPhysicalGroup(1, walls, wall_marker)
    gmsh.model.setPhysicalName(1, wall_marker, "Walls")
    gmsh.model.addPhysicalGroup(1, obstacle_entities, obstacle_marker)
    gmsh.model.setPhysicalName(1, obstacle_marker, "Obstacle")

    # Mesh size settings
    res_min = r / 3
    distance_field = gmsh.model.mesh.field.add("Distance")
    gmsh.model.mesh.field.setNumbers(distance_field, "EdgesList", obstacle_entities)
    threshold_field = gmsh.model.mesh.field.add("Threshold")
    gmsh.model.mesh.field.setNumber(threshold_field, "IField", distance_field)
    gmsh.model.mesh.field.setNumber(threshold_field, "LcMin", res_min)
    gmsh.model.mesh.field.setNumber(threshold_field, "LcMax", 0.25 * H)
    gmsh.model.mesh.field.setNumber(threshold_field, "DistMin", r)
    gmsh.model.mesh.field.setNumber(threshold_field, "DistMax", 2 * H)
    min_field = gmsh.model.mesh.field.add("Min")
    gmsh.model.mesh.field.setNumbers(min_field, "FieldsList", [threshold_field])
    gmsh.model.mesh.field.setAsBackgroundMesh(min_field)

    # Generate mesh
    gmsh.option.setNumber("Mesh.Algorithm", 8)
    gmsh.option.setNumber("Mesh.RecombinationAlgorithm", 2)
    gmsh.option.setNumber("Mesh.RecombineAll", 1)
    gmsh.option.setNumber("Mesh.SubdivisionAlgorithm", 1)
    gmsh.model.mesh.generate(gdim)
    gmsh.model.mesh.setOrder(2)
    gmsh.model.mesh.optimize("Netgen")

# Load mesh and markers into DOLFINx
mesh, _, ft = gmshio.model_to_mesh(gmsh.model, mesh_comm, model_rank, gdim=gdim)
ft.name = "Facet markers"
gmsh.finalize()

# Physical and discretization parameters
t = 0
T = 5                       # Final time (reduced for quicker execution)
dt = 1 / 1000               # Time step size
num_steps = int(T / dt)
k = Constant(mesh, PETSc.ScalarType(dt))
mu = Constant(mesh, PETSc.ScalarType(1 / Re))  # Dynamic viscosity
rho = Constant(mesh, PETSc.ScalarType(1))     # Density

# Function spaces
v_cg2 = element("Lagrange", mesh.topology.cell_name(), 2, shape=(mesh.geometry.dim,))
s_cg1 = element("Lagrange", mesh.topology.cell_name(), 1)
V = functionspace(mesh, v_cg2)
Q = functionspace(mesh, s_cg1)

fdim = mesh.topology.dim - 1

# Define boundary conditions
class InletVelocity():
    def __init__(self, t):
        self.t = t

    def __call__(self, x):
        values = np.zeros((gdim, x.shape[1]), dtype=PETSc.ScalarType)
        values[0] = 4 * 1.5 * np.sin(self.t * np.pi / 8) * x[1] * (0.41 - x[1]) / (0.41**2)
        return values

# Inlet
u_inlet = Function(V)
inlet_velocity = InletVelocity(t)
u_inlet.interpolate(inlet_velocity)
bcu_inflow = dirichletbc(u_inlet, locate_dofs_topological(V, fdim, ft.find(2)))
# Walls
u_noslip = np.array((0,) * mesh.geometry.dim, dtype=PETSc.ScalarType)
bcu_walls = dirichletbc(u_noslip, locate_dofs_topological(V, fdim, ft.find(4)), V)
# Obstacle
bcu_obstacle = dirichletbc(u_noslip, locate_dofs_topological(V, fdim, ft.find(5)), V)
bcu = [bcu_inflow, bcu_walls, bcu_obstacle]
# Outlet
bcp_outlet = dirichletbc(PETSc.ScalarType(0), locate_dofs_topological(Q, fdim, ft.find(3)), Q)
bcp = [bcp_outlet]

# Variational forms
u = TrialFunction(V)
v = TestFunction(V)
u_ = Function(V)
u_.name = "u"
u_s = Function(V)
u_n = Function(V)
u_n1 = Function(V)
p = TrialFunction(Q)
q = TestFunction(Q)
p_ = Function(Q)
p_.name = "p"
phi = Function(Q)

f = Constant(mesh, PETSc.ScalarType((0, 0)))
F1 = rho / k * dot(u - u_n, v) * dx
F1 += inner(dot(1.5 * u_n - 0.5 * u_n1, 0.5 * nabla_grad(u + u_n)), v) * dx
F1 += 0.5 * mu * inner(grad(u + u_n), grad(v)) * dx - dot(p_, div(v)) * dx
F1 += dot(f, v) * dx
a1 = form(lhs(F1))
L1 = form(rhs(F1))
A1 = create_matrix(a1)
b1 = create_vector(L1)

a2 = form(dot(grad(p), grad(q)) * dx)
L2 = form(-rho / k * dot(div(u_s), q) * dx)
A2 = assemble_matrix(a2, bcs=bcp)
A2.assemble()
b2 = create_vector(L2)

a3 = form(rho * dot(u, v) * dx)
L3 = form(rho * dot(u_s, v) * dx - k * dot(nabla_grad(phi), v) * dx)
A3 = assemble_matrix(a3)
A3.assemble()
b3 = create_vector(L3)

# Solvers
solver1 = PETSc.KSP().create(mesh.comm)
solver1.setOperators(A1)
solver1.setType(PETSc.KSP.Type.BCGS)
pc1 = solver1.getPC()
pc1.setType(PETSc.PC.Type.JACOBI)

solver2 = PETSc.KSP().create(mesh.comm)
solver2.setOperators(A2)
solver2.setType(PETSc.KSP.Type.MINRES)
pc2 = solver2.getPC()
pc2.setType(PETSc.PC.Type.HYPRE)
pc2.setHYPREType("boomeramg")

solver3 = PETSc.KSP().create(mesh.comm)
solver3.setOperators(A3)
solver3.setType(PETSc.KSP.Type.CG)
pc3 = solver3.getPC()
pc3.setType(PETSc.PC.Type.SOR)

# Functions to save data and figures
from pathlib import Path
import numpy as np
import os
import matplotlib.pyplot as plt
from scipy.interpolate import griddata

def save_simulation_data(u_, p_, t, Re, mesh):
    # Create the directory with the Reynolds number as the folder name
    save_path = get_save_path(Re)
    save_path.mkdir(exist_ok=False, parents=True)
    
    # Get the DoF coordinates and function values for u_
    V = u_.function_space
    u_dof_coords = V.tabulate_dof_coordinates()
    u_values = u_.x.array.reshape((-1, mesh.geometry.dim))
    
    # Keep only x and y coordinates
    u_dof_coords = u_dof_coords[:, :2]
    
    # Get the DoF coordinates and function values for p_
    Q = p_.function_space
    p_dof_coords = Q.tabulate_dof_coordinates()
    p_values = p_.x.array
    
    # Keep only x and y coordinates
    p_dof_coords = p_dof_coords[:, :2]
    
    # Define your grid
    nx, ny = 220, 41  # Number of points in x and y
    x_min, y_min = 0.0, 0.0
    x_max, y_max = L, H
    x_grid = np.linspace(x_min, x_max, nx)
    y_grid = np.linspace(y_min, y_max, ny)
    X_grid, Y_grid = np.meshgrid(x_grid, y_grid, indexing='ij')
    grid_points = np.column_stack([X_grid.ravel(), Y_grid.ravel()])
    
    # Interpolate u_x
    u_x_values = u_values[:, 0]
    u_x_grid = griddata(u_dof_coords, u_x_values, grid_points, method='linear', fill_value=np.nan)
    
    # Interpolate u_y
    u_y_values = u_values[:, 1]
    u_y_grid = griddata(u_dof_coords, u_y_values, grid_points, method='linear', fill_value=np.nan)
    
    # Interpolate p
    p_grid = griddata(p_dof_coords, p_values, grid_points, method='linear', fill_value=np.nan)
    
    # Reshape the data to grid shape
    u_x_grid = u_x_grid.reshape((nx, ny))
    u_y_grid = u_y_grid.reshape((nx, ny))
    p_grid = p_grid.reshape((nx, ny))
    
    # Create the data tensor
    data_tensor = np.stack([u_x_grid, u_y_grid, p_grid], axis=-1)  # Shape: (nx, ny, 3)
    
    # Save the tensor with the time in the filename
    np.savez_compressed(save_path / f"simulation_data_t{t:.3f}.npy", data=data_tensor.astype(np.float16))



def save_figures(t_u, C_D, C_L, p_diff, num_velocity_dofs, num_pressure_dofs, Re):
    figures_folder = Path("figures") / f"Re{Re:.3f}"
    figures_folder.mkdir(exist_ok=True, parents=True)

    # Plot and save drag coefficient
    plt.figure(figsize=(10, 6))
    plt.plot(t_u, C_D, label=f"FEniCSx ({num_velocity_dofs + num_pressure_dofs} dofs)")
    plt.title("Drag Coefficient")
    plt.xlabel("Time")
    plt.ylabel("C_D")
    plt.grid()
    plt.legend()
    plt.savefig(figures_folder / "drag_coefficient.png")
    plt.close()

    # Plot and save lift coefficient
    plt.figure(figsize=(10, 6))
    plt.plot(t_u, C_L, label=f"FEniCSx ({num_velocity_dofs + num_pressure_dofs} dofs)")
    plt.title("Lift Coefficient")
    plt.xlabel("Time")
    plt.ylabel("C_L")
    plt.grid()
    plt.legend()
    plt.savefig(figures_folder / "lift_coefficient.png")
    plt.close()

    # Plot and save pressure difference
    plt.figure(figsize=(10, 6))
    plt.plot(t_u, p_diff, label=f"FEniCSx ({num_velocity_dofs + num_pressure_dofs} dofs)")
    plt.title("Pressure Difference")
    plt.xlabel("Time")
    plt.ylabel("Pressure Difference")
    plt.grid()
    plt.legend()
    plt.savefig(figures_folder / "pressure_difference.png")
    plt.close()

# Time-stepping
n = -FacetNormal(mesh)
dObs = Measure("ds", domain=mesh, subdomain_data=ft, subdomain_id=5)
u_t = inner(as_vector((n[1], -n[0])), u_)
drag = form(2 / 0.1 * (mu / rho * inner(grad(u_t), n) * n[1] - p_ * n[0]) * dObs)
lift = form(-2 / 0.1 * (mu / rho * inner(grad(u_t), n) * n[0] + p_ * n[1]) * dObs)
if mesh.comm.rank == 0:
    C_D = np.zeros(num_steps, dtype=PETSc.ScalarType)
    C_L = np.zeros(num_steps, dtype=PETSc.ScalarType)
    t_u = np.zeros(num_steps, dtype=np.float64)
    t_p = np.zeros(num_steps, dtype=np.float64)

tree = bb_tree(mesh, mesh.geometry.dim)
points = np.array([[0.15, 0.2, 0], [0.25, 0.2, 0]])
cell_candidates = compute_collisions_points(tree, points)
colliding_cells = compute_colliding_cells(mesh, cell_candidates, points)
front_cells = colliding_cells.links(0)
back_cells = colliding_cells.links(1)
if mesh.comm.rank == 0:
    p_diff = np.zeros(num_steps, dtype=PETSc.ScalarType)

# Directory for results
folder = Path("results")
folder.mkdir(exist_ok=True, parents=True)

progress = tqdm.autonotebook.tqdm(desc="Solving PDE", total=num_steps)
for i in range(num_steps):
    progress.update(1)
    t += dt
    inlet_velocity.t = t
    u_inlet.interpolate(inlet_velocity)

    # Step 1: Tentative velocity step
    A1.zeroEntries()
    assemble_matrix(A1, a1, bcs=bcu)
    A1.assemble()
    with b1.localForm() as loc:
        loc.set(0)
    assemble_vector(b1, L1)
    apply_lifting(b1, [a1], [bcu])
    b1.ghostUpdate(addv=PETSc.InsertMode.ADD_VALUES, mode=PETSc.ScatterMode.REVERSE)
    set_bc(b1, bcu)
    solver1.solve(b1, u_s.x.petsc_vec)
    u_s.x.scatter_forward()

    # Step 2: Pressure correction step
    with b2.localForm() as loc:
        loc.set(0)
    assemble_vector(b2, L2)
    apply_lifting(b2, [a2], [bcp])
    b2.ghostUpdate(addv=PETSc.InsertMode.ADD_VALUES, mode=PETSc.ScatterMode.REVERSE)
    set_bc(b2, bcp)
    solver2.solve(b2, phi.x.petsc_vec)
    phi.x.scatter_forward()

    p_.x.petsc_vec.axpy(1, phi.x.petsc_vec)
    p_.x.scatter_forward()

    # Step 3: Velocity correction step
    with b3.localForm() as loc:
        loc.set(0)
    assemble_vector(b3, L3)
    b3.ghostUpdate(addv=PETSc.InsertMode.ADD_VALUES, mode=PETSc.ScatterMode.REVERSE)
    solver3.solve(b3, u_.x.petsc_vec)
    u_.x.scatter_forward()

    # Update variables from the current time step
    with u_.x.petsc_vec.localForm() as loc_, u_n.x.petsc_vec.localForm() as loc_n, \
            u_n1.x.petsc_vec.localForm() as loc_n1:
        loc_n.copy(loc_n1)
        loc_.copy(loc_n)

    # Save the simulation data for the current time step
    save_simulation_data(u_, p_, t, Re, mesh)

    # Compute physical quantities
    drag_coeff = mesh.comm.gather(assemble_scalar(drag), root=0)
    lift_coeff = mesh.comm.gather(assemble_scalar(lift), root=0)
    p_front = None
    if len(front_cells) > 0:
        p_front = p_.eval(points[0], front_cells[:1])
    p_front = mesh.comm.gather(p_front, root=0)
    p_back = None
    if len(back_cells) > 0:
        p_back = p_.eval(points[1], back_cells[:1])
    p_back = mesh.comm.gather(p_back, root=0)

    if mesh.comm.rank == 0:
        t_u[i] = t
        t_p[i] = t - dt / 2
        C_D[i] = sum(drag_coeff)
        C_L[i] = sum(lift_coeff)
        # Pressure difference
        for pressure in p_front:
            if pressure is not None:
                p_diff[i] = pressure[0]
                break
        for pressure in p_back:
            if pressure is not None:
                p_diff[i] -= pressure[0]
                break

    # Save figures at the last time step
    if i == num_steps - 1 and mesh.comm.rank == 0:
        num_velocity_dofs = V.dofmap.index_map_bs * V.dofmap.index_map.size_global
        num_pressure_dofs = Q.dofmap.index_map_bs * Q.dofmap.index_map.size_global
        save_figures(t_u, C_D, C_L, p_diff, num_velocity_dofs, num_pressure_dofs, Re)

progress.close()
