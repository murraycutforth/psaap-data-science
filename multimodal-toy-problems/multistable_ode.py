import itertools

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp


def system(t, z, A, B, C):
    x, y = z
    dxdt = x * (A - x - C * y)
    dydt = y * (B - x - y)
    return [dxdt, dydt]

# Time span for the simulation
t_span = (0, 10)
t_eval = np.linspace(t_span[0], t_span[1], 1000)

# Initial conditions for multiple trajectories
x0 = np.linspace(0, 3, 10)
y0 = np.linspace(0, 3, 10)
initial_conditions = list(itertools.product(x0, y0))

# Params
A = 3
B = 2
C = 1

# Solve the ODE for each set of initial conditions
solutions = []
for ic in initial_conditions:
    sol = solve_ivp(system, t_span, ic, args=(A, B, C), t_eval=t_eval, rtol=1e-6, atol=1e-8)
    solutions.append(sol)

# Plot the solutions (x(t) and y(t))
plt.figure(figsize=(12, 6))

# Plot x vs. t
plt.subplot(1, 2, 1)
for sol in solutions:
    plt.plot(sol.t, sol.y[0], label=f'Initial x={sol.y[0][0]}, y={sol.y[1][0]}')
plt.title('x over time')
plt.xlabel('Time')
plt.ylabel('x(t)')
plt.grid(True)

# Plot y vs. t
plt.subplot(1, 2, 2)
for sol in solutions:
    plt.plot(sol.t, sol.y[1], label=f'Initial x={sol.y[0][0]}, y={sol.y[1][0]}')
plt.title('y over time')
plt.xlabel('Time')
plt.ylabel('y(t)')
plt.grid(True)

plt.tight_layout()
plt.show()

# Phase plot (x vs y)
plt.figure(figsize=(6, 6))
for sol in solutions:
    plt.plot(sol.y[0], sol.y[1], alpha=0.3, label=f'Initial x={sol.y[0][0]}, y={sol.y[1][0]}')
plt.title('Phase plot (x vs y)')
plt.xlabel('x')
plt.ylabel('y')
plt.grid(True)
plt.show()
