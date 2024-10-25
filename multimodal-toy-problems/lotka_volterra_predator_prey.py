"""Lotka-Volterra predator-prey ODE model

Following model and parameters from: https://www.frontiersin.org/journals/applied-mathematics-and-statistics/articles/10.3389/fams.2022.1077831/full

Note:
    The model in the paper above actually uses fractional order derivatives, using the Caputo derivative. However, for
    a first attempt, I have just used the standard first order derivative. The model doesn't seem to be multistable
    in this case.
"""
import itertools

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp


# Default param values used in the model, see Fig. 2 in the paper
r = 0.1
K = 5
m = 0.25
c = 0.5
n = 0.01
beta = 0.06
del_1 = 0.05
del_2 = 0.05
omega = 0.1
alpha = 0.9
h = 0.12


def lotka_volterra_ode(t, x, r, K, m, c, n, beta, del_1, del_2, omega, alpha, h):
    x, y, z = x
    dxdt = r * x * (1 - x / K) - m * x * z - h * x / (c + x)
    dydt = n * x * z - beta * y - del_1 * y - omega * y**2
    dzdt = beta * y - del_2 * z
    return [dxdt, dydt, dzdt]

# Time span for the simulation
t_span = (0, 100)
t_eval = np.linspace(t_span[0], t_span[1], 1000)

# Generate initial conditions: x in (0, 10), y and z in (0, 0.1)
num_initial_conditions = 5
x_initials = np.random.uniform(0, 10, num_initial_conditions)
y_initials = np.random.uniform(0, 0.1, num_initial_conditions)
z_initials = np.random.uniform(0, 0.1, num_initial_conditions)


# Solve the ODE system for each set of initial conditions
solutions = []
for x0, y0, z0 in itertools.product(x_initials, y_initials, z_initials):
    initial_conditions = [x0, y0, z0]
    sol = solve_ivp(lotka_volterra_ode, t_span, initial_conditions,
                    args=(r, K, m, c, n, beta, del_1, del_2, omega, alpha, h),
                    t_eval=t_eval, rtol=1e-6, atol=1e-8)
    solutions.append(sol)


# Plot the solutions for each variable x, y, z
fig, axs = plt.subplots(3, 1, figsize=(10, 12))

# Plot x (prey population) over time
axs[0].set_title('Prey Population (x) over Time')
for sol in solutions:
    axs[0].plot(sol.t, sol.y[0], label=f'Initial x={sol.y[0][0]:.2f}')
axs[0].set_xlabel('Time')
axs[0].set_ylabel('Prey Population (x)')

# Plot y (predator population) over time
axs[1].set_title('Predator Population (y) over Time')
for sol in solutions:
    axs[1].plot(sol.t, sol.y[1], label=f'Initial y={sol.y[1][0]:.2f}')
axs[1].set_xlabel('Time')
axs[1].set_ylabel('Predator Population (y)')

# Plot z (second predator population) over time
axs[2].set_title('Secondary Predator Population (z) over Time')
for sol in solutions:
    axs[2].plot(sol.t, sol.y[2], label=f'Initial z={sol.y[2][0]:.2f}')
axs[2].set_xlabel('Time')
axs[2].set_ylabel('Secondary Predator Population (z)')

plt.tight_layout()
plt.show()



# Plot the phase portraits for prey (x) vs predator (y), and x vs z
fig, ax = plt.subplots(1, 2, figsize=(14, 6))

# Phase portrait: y (predator) vs x (prey)
ax[0].set_title('Phase Portrait: Predator (y) vs Prey (x)')
for sol in solutions:
    ax[0].plot(sol.y[0], sol.y[1], label=f'Initial x={sol.y[0][0]:.2f}, y={sol.y[1][0]:.2f}')
ax[0].set_xlabel('Prey Population (x)')
ax[0].set_ylabel('Predator Population (y)')
ax[0].grid(True)

# Phase portrait: z (second predator) vs x (prey)
ax[1].set_title('Phase Portrait: Secondary Predator (z) vs Prey (x)')
for sol in solutions:
    ax[1].plot(sol.y[0], sol.y[2], label=f'Initial x={sol.y[0][0]:.2f}, z={sol.y[2][0]:.2f}')
ax[1].set_xlabel('Prey Population (x)')
ax[1].set_ylabel('Secondary Predator Population (z)')
ax[1].grid(True)

plt.tight_layout()
plt.show()