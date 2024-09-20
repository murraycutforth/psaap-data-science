import itertools

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Define the modified Brusselator system with cubic nonlinearity
def modified_brusselator(t, z, A, B):
    x, y = z
    dxdt = A - (B + 1) * x + x**2 * y - (x-A)*(x-A)*(x-3)  # Cubic nonlinearity added to x equation
    dydt = B * x - x**2 * y
    return [dxdt, dydt]

# Parameters for the Brusselator (modification for multistability)
A = 0.8
B = 1.0  # Adjust B to tune multistability

# Initial conditions to explore multistability
x0 = np.linspace(0, 3, 10)
y0 = np.linspace(0, 3, 10)
initial_conditions = list(itertools.product(x0, y0))

# Time span for the simulation
t_span = (0, 50)
t_eval = np.linspace(t_span[0], t_span[1], 1000)

# Solve the ODE for each set of initial conditions
solutions = []
for ic in initial_conditions:
    sol = solve_ivp(modified_brusselator, t_span, ic, args=(A, B), t_eval=t_eval, rtol=1e-4, atol=1e-6)
    solutions.append(sol)

# Plot the solutions
plt.figure(figsize=(12, 6))

# Plot x vs. t
plt.subplot(1, 2, 1)
for sol in solutions:
    plt.plot(sol.t, sol.y[0], label=f'Initial condition: {sol.y[:,0]}')
plt.title('Concentration of x over time (Modified Brusselator)')
plt.xlabel('Time')
plt.ylabel('x(t)')
plt.grid(True)
#plt.legend()

# Plot y vs. t
plt.subplot(1, 2, 2)
for sol in solutions:
    plt.plot(sol.t, sol.y[1], label=f'Initial condition: {sol.y[:,1]}')
plt.title('Concentration of y over time (Modified Brusselator)')
plt.xlabel('Time')
plt.ylabel('y(t)')
plt.grid(True)
#plt.legend()

plt.tight_layout()
plt.show()

# Phase plot (x vs y)
plt.figure(figsize=(6, 6))
for sol in solutions:
    plt.plot(sol.y[0], sol.y[1], alpha=0.2, label=f'Initial condition: {sol.y[:,0]}')
plt.title('Phase plot of Modified Brusselator (x vs y)')
plt.xlabel('x')
plt.ylabel('y')
plt.grid(True)
plt.show()
