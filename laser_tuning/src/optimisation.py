from collections import defaultdict

import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
from scipy.interpolate._ndgriddata import LinearNDInterpolator
from scipy.optimize import minimize
from scipy.stats import gaussian_kde


# TODO: visualise optimisation landscape for each metric
# search space is 4D, visualise with 6 orthogonal 2D slices with contours of error
# for each metric, plot the optimal value against the error

def visualise_optimisation_landscape(lf_data, hf_data, metric_to_distance_matrix):
    x0 = np.zeros(4)
    bounds = [(-1, 1), (-1, 1), (-1, 1), (-1e-2, 1e-2)]  # alpha, beta, L, fwhm in SI units
    ind_to_param_str = {0: 'alpha', 1: 'beta', 2: 'L', 3: 'fwhm'}
    lf_params = np.array([data['params'] for data in lf_data])
    metric_to_interps = {
        metric: [LinearNDInterpolator(points=lf_params, values=distance_matrix[:, j], fill_value=np.max(distance_matrix), rescale=True) for j in range(len(hf_data))]
        for metric, distance_matrix in metric_to_distance_matrix.items()
    }

    for metric, distances in metric_to_distance_matrix.items():

        print(f'Visualising optimisation landscape for {metric}')
        interps = metric_to_interps[metric]

        fig, axs = plt.subplots(2, 3, figsize=(8, 4), dpi=200)
        for i, (x, y) in enumerate([(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]):

            print(f'Plotting axes {x},{y} or {ind_to_param_str[x]} vs {ind_to_param_str[y]}')

            x_vals = np.linspace(bounds[x][0], bounds[x][1], 25)
            y_vals = np.linspace(bounds[y][0], bounds[y][1], 25)

            print(f'x limits: {bounds[x]}')
            print(f'y limits: {bounds[y]}')

            X, Y = np.meshgrid(x_vals, y_vals)
            Z = np.zeros_like(X)

            for x_ind in range(len(x_vals)):
                for y_ind in range(len(y_vals)):
                    theta = x0.copy()
                    theta[x] = x_vals[x_ind]
                    theta[y] = y_vals[y_ind]

                    Z[x_ind, y_ind] = constant_offset_model_error(theta, interps, hf_data)

            print(f'Z has mean {np.mean(Z)}, min {np.min(Z)}, max {np.max(Z)}')

            ax = axs[i // 3, i % 3]
            im = ax.contourf(X, Y, Z, levels=20)
            fig.colorbar(im, ax=ax)
            ax.set_xlabel(f'{ind_to_param_str[x]}')
            ax.set_ylabel(f'{ind_to_param_str[y]}')

        fig.suptitle(metric)
        fig.tight_layout()
        fig.savefig(f'/Volumes/My Passport for Mac/laser_tuning/plots/optimisation_landscape_{metric}.png')
        plt.close()


def constant_offset_model_error(theta: np.ndarray,
                                interps: list[LinearNDInterpolator],
                                hf_data: np.array,
                                ) -> float:
    assert theta.shape == (4,)

    all_errs = []

    def d(hf_ind, x):
        interp = interps[hf_ind]
        return interp(x)

    for j in range(len(hf_data)):
        x = np.array([hf_data[j]['params'][0], hf_data[j]['params'][1]])  # alpha, beta
        L_hf = 1.25  # mm
        fwhm_hf = 1e-2  # us
        y = np.array([x[0] + theta[0], x[1] + theta[1], L_hf + theta[2], fwhm_hf + theta[3]])  # alpha, beta, L, fwhm
        all_errs.append(d(j, y))

    for x in all_errs:
        assert not np.isnan(x)

    return np.mean(all_errs)


def constant_offset_model_optimisation(lf_data, hf_data, metric_to_distance_matrix):
    bounds = [(-1, 1), (-1, 1), (-1, 1), (-1e-2, 1e-2)]  # alpha, beta, L [mm], fwhm [us]
    ub = np.array([bounds[i][1] for i in range(4)])
    lb = np.array([bounds[i][0] for i in range(4)])

    N_reps = 200
    results = {k: [] for k in metric_to_distance_matrix.keys()}
    errors = defaultdict(list)

    lf_params = np.array([data['params'] for data in lf_data])
    metric_to_interps = {
        metric: [LinearNDInterpolator(points=lf_params, values=distance_matrix[:, j], fill_value=np.max(distance_matrix), rescale=True) for j in range(len(hf_data))]
        for metric, distance_matrix in metric_to_distance_matrix.items()
    }

    def run_single_optimisation(metric, tol):
        x0 = np.random.uniform(0, 1, 4) * (ub - lb) + lb
        interps = metric_to_interps[metric]
        res = minimize(constant_offset_model_error, x0,
                       args=(interps, hf_data),
                       bounds=bounds,
                       method='Nelder-Mead',
                       tol=tol)
        assert res.success
        results[metric].append({'alpha': res.x[0], 'beta': res.x[1], 'L': res.x[2], 'fwhm': res.x[3]})
        errors[metric].append(res.fun)

    for i in range(N_reps):
        run_single_optimisation('Ejecta Velocity (1000K)', 1e-2)
        run_single_optimisation('Dice (Ejecta 500K)', 1e-3)
        #run_single_optimisation('Dice (Ejecta 1000K)', 1e-3)
        run_single_optimisation('RMSE', 1e-2)
        run_single_optimisation('Dice (1000K)', 1e-3)

    # Prepare data for DataFrame
    data = {}
    for metric, res_list in results.items():
        for i, res in enumerate(res_list):
            for param, value in res.items():
                data[(metric, param, i)] = value
        for i, err in enumerate(errors[metric]):
            data[(metric, 'error', i)] = err

    # Create MultiIndex for columns
    index = pd.MultiIndex.from_tuples(data.keys(), names=['Metric', 'Parameter', 'Iteration'])

    # Create DataFrame
    df = pd.DataFrame(data, index=[0]).T.unstack(level=2)
    df.to_csv('/Volumes/My Passport for Mac/laser_tuning/plots/constant_offset_optimisation_results.csv')
    print(df)

    # Plot histogram of values for each row of table - one axis per parameter
    fig, ax = plt.subplots(1, 5, figsize=(12, 3), dpi=200)

    for i, param in enumerate(['alpha', 'beta', 'L', 'fwhm']):
        for metric in results:
            yvals = df.loc[(metric, param)].values
            errs = df.loc[(metric, 'error')].values
            max_err = np.max(errs)
            min_err = np.min(errs)
            err_threshold = min_err + 0.1 * (max_err - min_err)
            yvals = yvals[errs < err_threshold]  # Only plot values where error is below average error

            # KDE plot with matplotlib
            kde = gaussian_kde(yvals)
            x = np.linspace(bounds[i][0], bounds[i][1], 100)
            ax[i].plot(x, kde(x), label=metric)

            #ax[i].hist(yvals, bins=20, range=(bounds[i][0], bounds[i][1]), alpha=0.5, label=metric)

            ax[i].set_title(f'{param}')
            ax[i].set_xlabel('Optimal value')
            ax[i].set_ylabel('Density')
            ax[i].spines['top'].set_visible(False)
            ax[i].spines['right'].set_visible(False)

    # Put axis in place of 5th axis
    ax[-1].axis('off')
    for metric in results:
        ax[-1].plot([], [], label=metric)
    ax[-1].legend()

    fig.tight_layout()
    fig.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/constant_offset_optimisation_values.png')
    plt.close()


    # Now create a big plot where for each parameter, we scatter the optimal value against the error
    fig, ax = plt.subplots(1, 5, figsize=(12, 3), dpi=200, sharey=True)

    for i, param in enumerate(['alpha', 'beta', 'L', 'fwhm']):
        for metric in results:
            yvals = df.loc[(metric, 'error')].values
            yvals_normalised = (yvals - np.min(yvals)) / (np.max(yvals) - np.min(yvals))
            ax[i].scatter(df.loc[(metric, param)].values, yvals_normalised, label=metric, alpha=0.25)
            ax[i].set_xlabel(f'Optimal {param}')
            ax[i].set_ylabel('Normalised Error [a.u.]')
            ax[i].spines['top'].set_visible(False)
            ax[i].spines['right'].set_visible(False)

    # Put axis in place of 5th axis
    ax[-1].axis('off')
    for metric in results:
        ax[-1].scatter([], [], label=metric, alpha=0.25)
    ax[-1].legend()

    fig.tight_layout()
    fig.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/constant_offset_optimisation_scatter.png')
    plt.close()

    # Plot histogram of errors for each metric
    fig, ax = plt.subplots(1, 4, figsize=(12, 3), dpi=200)

    for i, (metric_name, errs) in enumerate(errors.items()):
        ax[i].hist(errs, bins=10)
        ax[i].set_title(f'{metric_name}')
        ax[i].set_xlabel('Error')
        ax[i].set_ylabel('Frequency')
        ax[i].spines['top'].set_visible(False)
        ax[i].spines['right'].set_visible(False)

    fig.tight_layout()
    fig.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/constant_offset_optimisation_errors.png')
    plt.close()

    # For each metric, take the top-3 results and plot as a line plot on [0, 1, 2, 3] with fwhm scaled up by 10^2 and y axis from -1 to 1
    fig, ax = plt.subplots(1, 1, figsize=(6, 4), dpi=200)

    for k, metric in enumerate(errors.keys()):

        metric_df = df.loc[metric]
        errs = metric_df.loc['error'].values
        top_inds = np.argsort(errs)[:3]  # These are the column inds of the top 3 results

        for i in range(3):
            alpha = metric_df.loc['alpha', (0, top_inds[i])]
            beta = metric_df.loc['beta', (0, top_inds[i])]
            L = metric_df.loc['L', (0, top_inds[i])]
            fwhm = metric_df.loc['fwhm', (0, top_inds[i])]

            yvals = np.array([alpha, beta, L, fwhm])

            yvals[3] *= 1e2
            ax.plot(np.arange(4), yvals, c=f'C{k}', alpha=0.5)

    for i, metric in enumerate(errors.keys()):
        ax.plot([], [], label=metric, c=f'C{i}', alpha=0.5)
    ax.legend()

    ax.set_ylim(-1, 1)
    ax.set_xticks(np.arange(4))
    ax.set_xticklabels(['alpha', 'beta', 'L [m]', 'fwhm [us / 100]'])
    ax.grid(True)  # Enable gridlines
    ax.grid(which='both', linestyle='--', linewidth=0.5)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)

    fig.tight_layout()
    fig.savefig('/Volumes/My Passport for Mac/laser_tuning/plots/constant_offset_optimisation_top3.png')
    plt.show()
    plt.close()

