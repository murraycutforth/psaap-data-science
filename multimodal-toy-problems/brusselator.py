import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Define the system of ODEs (Brusselator equations)
def brusselator(t, z, A, B):
    x, y = z
    dxdt = A - (B + 1) * x + x**2 * y
    dydt = B * x - x**2 * y
    return [dxdt, dydt]

# Parameters for the Brusselator (multistability case)
A = 1.0
B = 5  # B > A + 1 for multistability

# Initial conditions for multiple trajectories
initial_conditions = [
    [1.0, 1.0],  # Near one attractor
    [2.5, 0.5],  # Near another attractor
    [0.5, 3.0],  # Far from any attractor
]

# Time span for the simulation
t_span = (0, 30)
t_eval = np.linspace(t_span[0], t_span[1], 1000)

# Solve the ODE for each set of initial conditions
solutions = []
for ic in initial_conditions:
    sol = solve_ivp(brusselator, t_span, ic, args=(A, B), t_eval=t_eval, rtol=1e-6, atol=1e-8)
    solutions.append(sol)

# Plot the solutions
plt.figure(figsize=(12, 6))

# Plot x vs. t
plt.subplot(1, 2, 1)
for sol in solutions:
    plt.plot(sol.t, sol.y[0], label=f'Initial condition: {sol.y[:,0]}')
plt.title('Concentration of x over time')
plt.xlabel('Time')
plt.ylabel('x(t)')
plt.grid(True)
plt.legend()

# Plot y vs. t
plt.subplot(1, 2, 2)
for sol in solutions:
    plt.plot(sol.t, sol.y[1], label=f'Initial condition: {sol.y[:,1]}')
plt.title('Concentration of y over time')
plt.xlabel('Time')
plt.ylabel('y(t)')
plt.grid(True)
plt.legend()

plt.tight_layout()
plt.show()

# Phase plot (x vs y)
plt.figure(figsize=(6, 6))
for sol in solutions:
    plt.plot(sol.y[0], sol.y[1], label=f'Initial condition: {sol.y[:,0]}')
plt.title('Phase plot of Brusselator (x vs y)')
plt.xlabel('x')
plt.ylabel('y')
plt.grid(True)
plt.legend()
plt.show()
