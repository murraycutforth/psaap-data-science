import jax
import numpyro
from jax import numpy as np, random as random
from jax._src.scipy.linalg import cholesky, solve_triangular
from numpyro import distributions as dist
from numpyro.infer import NUTS, MCMC


class MultiFidelityGPClassifier:
    def __init__(self, kernel):
        self.kernel = kernel

    def model(self, X_L, X_H, y):
        """We implement a bi-fidelity model where we assume the following relationship:

        f_H = rho * f_L + delta(x)
        """
        N_L, d = X_L.shape
        N_H = len(X_H)

        # Priors on the kernel parameters
        var_L = numpyro.sample("var_L", dist.LogNormal(0, 1), sample_shape=(1,))
        length_L = numpyro.sample("length_L", dist.LogNormal(0, 1), sample_shape=(d,))
        theta_L = np.concatenate([var_L, length_L])

        var_H = numpyro.sample("var_H", dist.LogNormal(0, 1), sample_shape=(1,))
        length_H = numpyro.sample("length_H", dist.LogNormal(0, 1), sample_shape=(d,))
        theta_H = np.concatenate([var_H, length_H])

        rho = numpyro.sample('rho', dist.Normal(0, 10), sample_shape=(1,))

        # Compute covariance matrix
        K_LL = self.kernel(X_L, X_L, theta_L) + np.eye(N_L) * 1e-6
        K_LH = rho * self.kernel(X_L, X_H, theta_L)
        K_HH = rho ** 2 * self.kernel(X_H, X_H, theta_L) + \
               self.kernel(X_H, X_H, theta_H) + np.eye(N_H) * 1e-6
        K = np.vstack((np.hstack((K_LL, K_LH)),
                       np.hstack((K_LH.T, K_HH))))

        L = cholesky(K, lower=True)

        # Generate latent function
        beta_L = numpyro.sample('beta_L', dist.Normal(0.0, 1.0))
        beta_H = numpyro.sample('beta_H', dist.Normal(0.0, 1.0))
        eta_L = numpyro.sample('eta_L', dist.Normal(0.0, 1.0), sample_shape=(N_L,))
        eta_H = numpyro.sample('eta_H', dist.Normal(0.0, 1.0), sample_shape=(N_H,))
        beta = np.concatenate([beta_L * np.ones(N_L), beta_H * np.ones(N_H)])
        eta = np.concatenate([eta_L, eta_H])
        f = np.matmul(L, eta) + beta

        # Bernoulli likelihood
        numpyro.sample('y', dist.Bernoulli(logits=f), obs=y)  # y is the LF and HF observations concatenated

    def posterior_sample(self, X, X_star, sample, rng_key):
        pass  # TODO






class GPClassifier:
    def __init__(self, kernel):
        self.kernel = kernel

    def model(self, X, y):
        """In this function we specify the model used by our GPC. This function uses the `numpyro` library to
        specify the model. The model is a GP for the latent function f with priors on the kernel parameters, and a Bernoulli
        likelihood for the observed binary labels y.
        """
        N, d = X.shape

        # Priors on the kernel parameters
        var = numpyro.sample("var", dist.LogNormal(0, 1), sample_shape=(1,))
        length = numpyro.sample("length", dist.LogNormal(0, 1), sample_shape=(d,))
        theta = np.concatenate([var, length])

        # The latent function values
        K = self.kernel(X, X, theta) + 1e-6 * np.eye(N)
        L = cholesky(K, lower=True)
        beta = numpyro.sample("beta", dist.Normal(0.0, 1.0))
        eta = numpyro.sample("eta", dist.Normal(0.0, 1.0), sample_shape=(N,))  # Bias term
        f = np.matmul(L, eta) + beta  # L*eta gives a multivariate gaussian with mean 0 and covariance K

        # Bernoulli likelihood for the binary baselines task
        numpyro.sample("y", dist.Bernoulli(logits=f), obs=y)

    def latent_negative_log_likelihood(self, theta):
        """The negative log likelihood of the latent function given kernel parameters theta, or -log(P(f|X, theta))
        """
        K = self.kernel(self.X_train, self.X_train, theta)
        L = cholesky(K, lower=True)
        alpha = solve_triangular(L.T, solve_triangular(L, self.Y_train, lower=True))
        return 0.5 * np.dot(self.Y_train, alpha) + np.sum(np.log(np.diag(L))) + 0.5 * len(self.Y_train) * np.log(2 * np.pi)

    def latent_nll_value_and_grad(self, theta):
        """The value and gradient of the negative log likelihood of the latent function given kernel parameters theta
        """
        fn = lambda theta: self.latent_negative_log_likelihood(theta)
        grad_fn = jax.grad(fn)
        grads = grad_fn(theta)
        return fn(theta), grads

        #primals, f_vjp = jax.vjp(fn, theta)
        #grads = f_vjp(np.ones_like(primals))[0]
        #return primals, grads

    def get_mcmc_samples_of_model(self, X, y, rng_key, num_samples=1000, num_warmup=1000, num_chains=1):
        """This function performs MCMC sampling to obtain samples from the posterior distribution of the model, given
        the data X and y. The posterior distribution is over the kernel parameters given the data, because we
        marginalise out the latent function values: P(theta|X, y) = \int P(theta, f|X, y) df.
        """
        kernel = NUTS(self.model, target_accept_prob=0.8)
        mcmc = MCMC(kernel, num_warmup=num_warmup, num_samples=num_samples, num_chains=num_chains,
                    progress_bar=True)
        mcmc.run(rng_key, X, y)
        return mcmc

    def posterior_sample(self, X, X_star, sample, rng_key):
        """This function computes the posterior distribution of the latent function values at the test points X_star,
        given the training data X and y. The posterior distribution is over the latent function values, and is
        marginalised over the kernel parameters: P(f*|X*, X, y) = \int P(f*|X*, theta) P(theta|X, y) dtheta.

        Note that is function is not explicitly a function of y, because the 'sample' parameter contains samples
        from the posterior distribution of the kernel parameters, which are conditioned on the data y.
        """
        var = sample["var"]
        length = sample["length"]
        theta = np.concatenate([var, length])
        beta = sample["beta"]
        eta = sample["eta"]

        K_xx = self.kernel(X, X, theta) + 1e-6 * np.eye(X.shape[0])
        K_xstar_x = self.kernel(X_star, X, theta)
        K_xstar_xstar = self.kernel(X_star, X_star, theta) + 1e-6 * np.eye(X_star.shape[0])
        L = cholesky(K_xx, lower=True)
        f = np.matmul(L, eta) + beta

        # Now compute the conditional probability P(f*|X*, X, y, theta), which is analytically tractable because
        # f and f* are jointly normally distributed, so we use the expression for the conditional distribution of
        # a multivariate normal distribution.
        mu_star = np.matmul(K_xstar_x, solve_triangular(L.T, solve_triangular(L, f, lower=True)))
        temp = solve_triangular(L.T, solve_triangular(L, K_xstar_x.T, lower=True))
        cov_star = K_xstar_xstar - np.matmul(K_xstar_x, temp)  # Shape (N_star, N_star)
        std_star = np.sqrt(np.clip(np.diag(cov_star), a_min=0.0))  # clip is numerically necessary

        samples = mu_star + random.normal(rng_key, mu_star.shape) * std_star

        return mu_star, std_star, samples
