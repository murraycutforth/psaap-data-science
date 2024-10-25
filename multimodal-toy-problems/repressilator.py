import itertools

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Define the repressilator ODE system
def repressilator(t, z, alpha_1, alpha_2, alpha_3, beta, n, gamma_m, gamma_p):
    m1, m2, m3, P1, P2, P3 = z
    dm1dt = -m1 + alpha_1 / (1 + P3**n) - gamma_m * m1
    dm2dt = -m2 + alpha_2 / (1 + P1**n) - gamma_m * m2
    dm3dt = -m3 + alpha_3 / (1 + P2**n) - gamma_m * m3
    dP1dt = beta * m1 - gamma_p * P1
    dP2dt = beta * m2 - gamma_p * P2
    dP3dt = beta * m3 - gamma_p * P3
    return [dm1dt, dm2dt, dm3dt, dP1dt, dP2dt, dP3dt]

# Parameters
alpha_1 = 5.0  # mRNA production rate
alpha_2 = 1.0
alpha_3 = 2.0
beta = 10   # Protein degradation rate
n = 1        # Hill coefficient (steepness of repression)
gamma_m = 1
gamma_p = 1

# Time span for simulation
t_span = (0, 100)
t_eval = np.linspace(t_span[0], t_span[1], 1000)

# Different initial conditions to explore the system's dynamics

m1_0 = 0.5
m2_0 = 0.5
m3_0 = 0.5

P1_0s = np.linspace(0, 30, 10)
P2_0s = np.linspace(0, 30, 10)
P3_0s = np.linspace(0, 30, 10)

initial_conditions = []
for P1_0, P2_0, P3_0 in itertools.product(P1_0s, P2_0s, P3_0s):
    initial_conditions.append([m1_0, m2_0, m3_0, P1_0, P2_0, P3_0])


# Solve the ODE system for each set of initial conditions
solutions = []
for ic in initial_conditions:
    sol = solve_ivp(repressilator, t_span, ic, args=(alpha_1, alpha_2, alpha_3, beta, n, gamma_m, gamma_p), t_eval=t_eval, rtol=1e-6, atol=1e-8)
    solutions.append(sol)

# Plot the solutions (Protein concentrations P1, P2, P3 over time)
plt.figure(figsize=(12, 6))

# Plot each solution for P1, P2, P3
for i, sol in enumerate(solutions):
    plt.plot(sol.t, sol.y[3], label='P1')
    plt.plot(sol.t, sol.y[4], label='P2')
    plt.plot(sol.t, sol.y[5], label='P3')
    plt.xlabel('Time')
    plt.ylabel('Protein concentration')
    plt.grid(True)

plt.tight_layout()
plt.show()

# Phase plot (P1 vs P2 vs P3 for each solution)
fig = plt.figure(figsize=(8, 8))
ax = fig.add_subplot(111, projection='3d')
for sol in solutions:
    ax.plot(sol.y[3], sol.y[4], sol.y[5], alpha=0.3,)
ax.set_xlabel('P1')
ax.set_ylabel('P2')
ax.set_zlabel('P3')
plt.show()
