"""
Pitchfork bifurcation ODE

Governing equation:
    dx / dt = r * x - x^3

We provide LF and HF functions to solve an initial value problem for this ODE system.
The bifurcation parameter r must be positive for a bimodal distribution of the solution.
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Script-level constants
t_span = (0, 5)
t_eval = np.linspace(t_span[0], t_span[1], 1000)
gen = np.random.default_rng(42)
y0_magnitude = 0.001


def pitchfork_ode(t, x, r):
    dxdt = r * x - x**3
    return dxdt


def sample_hf_solution(r):
    # Use RK45 and low error tol
    sign = gen.choice([-1, 1])
    y0 = sign * y0_magnitude
    #y0 = gen.normal(loc=0.0, scale=y0_sigma)
    sol_hf = solve_ivp(pitchfork_ode, t_span, [y0], args=(r,), t_eval=t_eval, method='RK45',
                          rtol=1e-6, atol=1e-6)
    return sol_hf


def sample_lf_solution(r):
    # Use RK23 and high error tol
    #y0 = gen.normal(loc=0.0, scale=y0_sigma)
    sign = gen.choice([-1, 1])
    y0 = sign * y0_magnitude
    sol_lf = solve_ivp(pitchfork_ode, t_span, [y0], args=(r,), t_eval=t_eval, method='RK23',
                          rtol=1e-2, atol=1e-2)
    return sol_lf


if __name__ == '__main__':
    # Plot LF (dotted) and HF for a range of different r values

    rs = np.linspace(-1, 5, 5)
    N_per_r = 50

    fig, axs = plt.subplots(1, len(rs), figsize=(2 * len(rs), 2), dpi=200, sharex=True, sharey=True)

    for i, r in enumerate(rs):
        ax = axs[i]
        lf_solutions = [sample_lf_solution(r) for _ in range(N_per_r)]
        hf_solutions = [sample_hf_solution(r) for _ in range(N_per_r)]

        for sol in lf_solutions:
            ax.plot(sol.t, sol.y[0], c='C1', alpha=0.2, ls='--')

        for sol in hf_solutions:
            ax.plot(sol.t, sol.y[0], c='C0', alpha=0.2)

        ax.set_title(f'r = {r:.2f}')

    axs[0].plot([], [], c='C1', ls='--', label='LF')
    axs[0].plot([], [], c='C0', label='HF')
    axs[0].legend()
    fig.tight_layout()
    plt.show()
