"""
Surface reaction ODE

Governing equation:
    d rho / dt = alpha (1 - rho) - gamma rho - kappa rho (1 - rho)^2

We provide LF and HF functions to solve an initial value problem for this ODE system. The kappa parameter must
be set, while alpha and gamma are random variables which are sampled for each simulation. Choosing kappa close
to 10 will result in a bimodal distribution of the solution.

"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp


# Script-level constants
t_span = (0, 10)  # Time span for the simulation
t_eval = np.linspace(t_span[0], t_span[1], 100)  # Time points where solution is evaluated
rho_0 = 0.89  # Initial condition


def sample_lf_solution(kappa):
    # Use RK23 and high error tol

    xi1 = np.random.normal(0, 1)
    xi2 = np.random.normal(0, 1)
    alpha = alpha_xi(xi1)
    gamma = gamma_xi(xi2)

    sol_lf = solve_ivp(ode_system, t_span, [rho_0], args=(alpha, gamma, kappa), t_eval=t_eval, method='RK23', rtol=1e-3, atol=1e-3)

    return sol_lf.y[0]


def sample_hf_solution(kappa):
    # Use RK45 and low error tol

    xi1 = np.random.normal(0, 1)
    xi2 = np.random.normal(0, 1)
    alpha = alpha_xi(xi1)
    gamma = gamma_xi(xi2)

    sol_hf = solve_ivp(ode_system, t_span, [rho_0], args=(alpha, gamma, kappa), t_eval=t_eval, method='RK45', rtol=1e-6, atol=1e-6)

    return sol_hf.y[0]


def ode_system(t, rho, alpha, gamma, kappa):
    return alpha * (1 - rho) - gamma * rho - kappa * rho * (1 - rho) ** 2


def alpha_xi(xi1):
    return 0.1 + np.exp(0.025 * xi1)


def gamma_xi(xi2):
    return 0.001 + 0.01 * np.exp(0.025 * xi2)


if __name__ == '__main__':
    # Plot LF (dotted lines) and HF (solid lines) for a range of different kappa values (different colors)

    N_per_kappa = 25
    kappas = np.linspace(10, 11, 6)

    fig, axs = plt.subplots(1, len(kappas), figsize=(10, 2), dpi=200, sharex=True, sharey=True)

    for i, kappa in enumerate(kappas):
        ax = axs[i]
        lf_solutions = [sample_lf_solution(kappa) for _ in range(N_per_kappa)]
        hf_solutions = [sample_hf_solution(kappa) for _ in range(N_per_kappa)]

        for lf_sol in lf_solutions:
            ax.plot(t_eval, lf_sol, color='C1', alpha=0.2, linestyle='--')

        for hf_sol in hf_solutions:
            ax.plot(t_eval, hf_sol, color='C0', alpha=0.2)

        ax.set_title(f"$\kappa = {kappa}$")

    axs[0].plot([], [], color='C1', linestyle='--', label='LF')
    axs[0].plot([], [], color='C0', label='HF')
    axs[0].legend()
    fig.tight_layout()
    plt.show()

