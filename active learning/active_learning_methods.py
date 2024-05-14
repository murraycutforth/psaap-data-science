import os

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from scipy.interpolate import griddata, Rbf


from active_learning_base import ActiveLearningBase
from shapley_utils.shapley_engine import ShapEngine


class RandomSampling(ActiveLearningBase):
    """This is a first baseline to compare against. It randomly selects a batch of samples from the pool set.
    """
    def select_batch(self) -> list[int]:
        return np.random.choice(len(self.pool_set_coords), self.num_samples, replace=False)


class TopKSampling(ActiveLearningBase):
    """This is the second baseline. It selects the top K samples from the pool set according to the model's uncertainty.
    """
    def select_batch(self) -> list[int]:
        y_pred = self.model.predict_proba(self.pool_set_coords)
        uncertainty = np.abs(y_pred[:, 0] - 0.5)
        return np.argsort(uncertainty)[:self.num_samples]


class CardosoRankedBatchMode(ActiveLearningBase):
    """This is the Cardoso ranked batch mode active learning approach. It selects the batch of samples from the pool set
    which balances classifier uncertainty with sample similarity.

    With alpha=0, this is equivalent to TopKSampling, and alpha=1 is equivalent to pure exploration.

    In the paper, alpha is varied dynamically, according to the following formula:

    N_pool / (N_pool + N_train)

    Which is roughly equal to 0.9 in our case.

    See: https://www.sciencedirect.com/science/article/pii/S0020025516313949
    """
    def __init__(self, *args, alpha: float = 0.9):
        super().__init__(*args)
        self.alpha = alpha
        print(f'Initialised CardosoRankedBatchMode with alpha={alpha}')
        self.__class__.__name__ = f'CardosoRankedBatchMode_alpha{alpha}'

    def select_batch(self) -> list[int]:
        y_pred = self.model.predict_proba(self.pool_set_coords)
        uncertainty = 1.0 - 2.0 * np.abs(y_pred[:, 0] - 0.5)  # Factor of 2 scales range to [0, 1]

        selected_instances = np.zeros(len(self.pool_set_coords), dtype=bool)

        while sum(selected_instances) < self.num_samples:
            next_instance = self.select_instance(selected_instances, uncertainty)
            selected_instances[next_instance] = True

        return np.where(selected_instances)[0]

    def compute_distance(self, x, coord_set):
        """Return the smallest euclidean distance between x and members of coord set
        """
        return np.min(np.linalg.norm(coord_set - x, axis=1))

    def select_instance(self, selected_instances, uncertainty):
        """Select the next instance to add to the batch
        """
        D_proposed = np.concatenate([self.training_set[0], self.pool_set_coords[selected_instances]], axis=0)

        distances = np.zeros(len(self.pool_set_coords[~selected_instances]))  # TODO: this is an inefficient implementation
        for i, x in enumerate(self.pool_set_coords[~selected_instances]):
            distances[i] = self.compute_distance(x, D_proposed)

        # Debug - scatter plot proposals
        #plt.scatter(self.pool_set_coords[~selected_instances][:, 0], self.pool_set_coords[~selected_instances][:, 1], c=uncertainty[~selected_instances], marker='o')
        #plt.scatter(D_proposed[:, 0], D_proposed[:, 1], c='red', marker='x')
        #plt.colorbar()
        #plt.show()

        scores = self.alpha * distances + (1.0 - self.alpha) * uncertainty[~selected_instances]

        return np.where(~selected_instances)[0][np.argmax(scores)]

class Shapley(ActiveLearningBase):
    """This is a Shapley value-based active learning approach. It computes the Shapley values for each sample in the training set, interpolate them onto the pool set, and selects the batch of samples with the highest estimated Shapley values.
    """
    def __init__(self, *args, val_ratio: float = 0.2, interpolation_method: str = 'rbf'):
        super().__init__(*args)
        self.val_ratio = val_ratio
        self.interpolation_method = interpolation_method
        print(f'Initialised Shapley with validation ratio={val_ratio} and interpolation method={interpolation_method}')
        self.__class__.__name__ = f'Shapley_valratio_{val_ratio}_interpolation_{interpolation_method}'
        
    def select_batch(self) -> list[int]:
        estimated_shapley_values = self.estimate_shapley_values()
        return np.argsort(estimated_shapley_values)[-self.num_samples:]
    
    def estimate_shapley_values(self) -> np.ndarray:
        # Load and split data
        random_state = 63        
        X_train, y_train = self.training_set
        X_test, y_test = self.test_set
        X, X_val, y, y_val = train_test_split(X_train, y_train, test_size=self.val_ratio, random_state=random_state)
        
        # Compute Shapley values on (1-val_size) of the training set
        ## GR_threshold (Gelman-Rubin statistic) is a criterion to check the convergence of MCMC, reference: https://arxiv.org/pdf/1812.09384.pdf
        # GR_threshold = 1.0005
        GR_threshold = 1.1 # for fast convergence of MCMC
        shap_engine = ShapEngine(X=X, y=y, X_val=X_val, y_val=y_val, 
                        problem='classification', metric='accuracy', GR_threshold=GR_threshold, model=self.model)
        
        ## weights_list holds a list of (alpha, beta) parameters for the Beta distributions in computing Beta-Shapley values. Beta(1,1) weights subsets of all sizes equally and the computation reduces to the original data Shapley values. Larger alpha values assigns higher weights to subsets of smaller sizes.
        weights_list = [(1,1)] 
        shap_engine.run(weights_list=weights_list)
        key = list(shap_engine.results.keys())[0]
        shapley_values = shap_engine.results[key]
        return self.interpolate_shapley_values(X, shapley_values, self.interpolation_method)
    
    def interpolate_shapley_values(self, X, shapley_values, interpolation_method='rbf'):
        """
        Interpolates Shapley values over a predefined pool of coordinates based on the selected interpolation method.
        
        Args:
            X (array): The x-coordinates at which Shapley values are known.
            shapley_values (array): The Shapley values at each of the x-coordinates.
            interpolation_method (str): The method of interpolation ('cubic', 'linear', 'nearest', 'quadratic').

        Returns:
            array: The interpolated values at the pool set coordinates.
        """
        # Check that X and shapley_values are compatible
        assert X.shape[0] == len(shapley_values), "X and shapley_values must have the same number of entries"
        
        # Choose the interpolation method
        if interpolation_method in ['linear', 'cubic', 'nearest']:
            # griddata handles unstructured N-dimensional data.
            interpolated_values = griddata(X, shapley_values, self.pool_set_coords, method=interpolation_method)
        elif interpolation_method == 'rbf':
            # Radial basis function interpolator instance
            rbf = Rbf(X[:, 0], X[:, 1], shapley_values, function='multiquadric')
            interpolated_values = rbf(self.pool_set_coords[:, 0], self.pool_set_coords[:, 1])
        else:
            raise ValueError(f"Unsupported interpolation method: {interpolation_method}")

        return interpolated_values


def al_performance_summary_plot():
    """Plotting function which generates a summary plot comparing all active learning methods
    """
    results = []
    filenames = []
    for file in os.listdir('output'):
        if file.endswith('.csv'):
            results.append(pd.read_csv(os.path.join('output', file), index_col=0, header=0))
            filenames.append(file)

    # Extract method names from each file
    method_names = ['_'.join(filename.split('_')[1:-2]) for filename in filenames]

    fig = plt.figure(dpi=200)
    ax = fig.add_subplot(111)

    delta_accs = []
    delta_f1s = []

    for result in results:
        delta_accs.append(result['delta_accuracy'][0])
        delta_f1s.append(result['delta_f1'][0])

    width = 0.4  # this can be adjusted to your preference

    # create an array with the positions of the bars on the x axis
    bar_positions = np.arange(len(method_names))
    ax.bar(bar_positions - width / 2, delta_accs, width, label='Delta Accuracy')
    ax.bar(bar_positions + width / 2, delta_f1s, width, label='Delta F1')

    # replace the x-ticks with the method names
    ax.set_xticks(bar_positions)
    ax.set_xticklabels(method_names, rotation=60)

    ax.set_title('Active learning performance summary after a single batch acquisition')
    ax.legend()
    plt.subplots_adjust(bottom=0.45)  # adjust the bottom margin
    fig.savefig('output/summary_plot.png')
    plt.close(fig)
