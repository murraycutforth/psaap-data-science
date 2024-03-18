import logging

from tqdm import tqdm
import jax.numpy as np
import jax.random as random
import matplotlib.pyplot as plt
import arviz as az

from multi_fidelity_gp.utils.gp_models import GPClassifier
from multi_fidelity_gp.utils.kernels import matern_kernel_52


def low_fidelity(X):
    return (0.45 + np.sin(2.2*X[:,0]*np.pi)/2.5 - X[:,1]) > 0


def plot_data(X, Y):
    plt.scatter(X[Y, 0], X[Y, 1], c="r", label="Y=1")
    plt.scatter(X[~Y, 0], X[~Y, 1], c="b", label="Y=0")
    plt.title("Training data")
    plt.legend()
    plt.show()


def main():
    rng_key = random.PRNGKey(0)
    X_train = random.uniform(rng_key, (100, 2))
    Y_train = low_fidelity(X_train)

    plot_data(X_train, Y_train)

    gpc = GPClassifier(kernel=matern_kernel_52)

    ns = 500  # Number of MCMC samples
    mcmc = gpc.get_mcmc_samples_of_model(X_train, Y_train, rng_key,
                                         num_samples=ns, num_warmup=500, num_chains=1)

    # Plot the trace of the MCMC samples
    az.plot_trace(az.from_numpyro(mcmc), compact=True, figsize=(10, 20))
    plt.show()

    # Create test locations
    X_star = random.uniform(rng_key, (1000, 2))

    means, stds = [], []
    samples = mcmc.get_samples()
    keys = random.split(rng_key, ns)  # These are used in the posterior to generate a sample from the posterior (not used here)

    def get_ith_sample(i, samples):
        sample = {}
        for key in samples.keys():
            sample[key] = samples[key][i]
        return sample

    for i in tqdm(range(ns), desc="Sampling latent function predictive posterior"):
        mu, std, _ = gpc.posterior_sample(X_train, X_star, get_ith_sample(i, samples), keys[i])
        means.append(mu)
        stds.append(std)

    # Compute empirical mean and variance of our parameters for f*
    mu_star = np.mean(np.array(means), axis=0)
    std_star = np.mean(np.array(stds), axis=0)

    # Convert mu_star to a probability
    p_star = 1 / (1 + np.exp(-mu_star))

    # Plot the latent function mean
    plt.scatter(X_star[:, 0], X_star[:, 1], c=mu_star, cmap="coolwarm", s=10)
    plt.colorbar()
    plt.title("Posterior predictive latent function mean")
    plt.show()

    # Plot the predicted probabilities
    plt.scatter(X_star[:, 0], X_star[:, 1], c=p_star, cmap="coolwarm", s=10)
    plt.colorbar()
    plt.title("Posterior predictive probability mean")
    plt.show()

    # Plot the uncertainty in the latent function
    plt.scatter(X_star[:, 0], X_star[:, 1], c=std_star, cmap="coolwarm", s=10)
    plt.colorbar()
    plt.title("Posterior predictive latent standard deviation")
    plt.show()




if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    main()
