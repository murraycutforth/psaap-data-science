"""
Stochastic Logistic Growth ODE

Governing equation:
    d rho / dt = r_1 rho (1 - rho / K_1) + r_2 rho (1 - rho / K_2) + sigma rho dW / dt
"""

import numpy as np
import matplotlib.pyplot as plt

# Script-level constants
T = 100  # Time horizon
K = 10  # Carrying capacity (towards +\- this)


def sample_hf_solution(r, sigma, mu):
    t = np.linspace(0, T, 1000)
    rho = np.zeros_like(t)
    rho[0] = 0.0

    # Euler-Maruyama method to integrate the SDE
    for i in range(1, len(t)):
        dW = np.random.normal(mu, np.sqrt(t[1] - t[0]))
        d_rho = r * rho[i - 1] * (1 - np.abs(rho[i - 1]) / K) * (t[1] - t[0]) + \
                sigma * dW
        rho[i] = rho[i - 1] + d_rho

    return t[::10], rho[::10]


def sample_lf_solution(r, sigma, mu):
    t = np.linspace(0, T, 100)
    rho = np.zeros_like(t)
    rho[0] = 0.0

    # Euler-Maruyama method to integrate the SDE
    for i in range(1, len(t)):
        dW = np.random.normal(mu, np.sqrt(t[1] - t[0]))
        d_rho = r * rho[i - 1] * (1 - np.abs(rho[i - 1]) / K) * (t[1] - t[0]) + \
                sigma * dW
        rho[i] = rho[i - 1] + d_rho

    return t, rho


if __name__ == '__main__':
    # TODO: Sample and plot solutions for different param values

    fig, axs = plt.subplots(3, 3, figsize=(6, 5), dpi=200, sharex=True, sharey=True)
    N_samples = 25

    for i, r in enumerate([0.1, 0.5, 1.0]):
        for j, sigma in enumerate([0.05, 0.1, 0.5]):
            for _ in range(N_samples):
                t, rho_hf = sample_hf_solution(r, sigma, 0.0)
                axs[i, j].plot(t, rho_hf, color='C0', alpha=0.2)
            for _ in range(N_samples):
                t, rho_lf = sample_lf_solution(r, sigma, 0.0)
                axs[i, j].plot(t, rho_lf, color='C1', alpha=0.2, linestyle='--')
            axs[i, j].set_title(f"$r$={r}, $\\sigma$={sigma}, $\\mu=0$")

    axs[-1, -1].plot([], [], color='C0', alpha=0.2, label='HF')
    axs[-1, -1].plot([], [], color='C1', alpha=0.2, linestyle='--', label='LF')
    axs[-1, -1].legend()

    fig.tight_layout()
    plt.show()




