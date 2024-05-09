from abc import ABC, abstractmethod
import logging
from dataclasses import dataclass, field

import numpy as np
import sklearn.base
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.model_selection import cross_validate, train_test_split
import matplotlib.pyplot as plt
import pandas as pd

from synthetic_data_generation import get_training_set, get_pool_set_coords, get_test_set, sample_bernoulli_outcome
from offset_prediction_model import predict_measured_locations

logger = logging.getLogger(__name__)


class ActiveLearningBase(ABC):
    """This abstract base class defines the interface for active learning approaches. There is just a single
    abstract method which must be overridden: select_batch().
    """
    def __init__(self, model: sklearn.base.BaseEstimator, num_eval_repeats: int, num_samples: int, num_repeats_per_sample: int):
        super().__init__()
        self.model = model
        self.num_eval_repeats = num_eval_repeats
        self.num_samples = num_samples
        self.num_repeats_per_sample = num_repeats_per_sample
        self.training_set = get_training_set()
        self.test_set = get_test_set()
        self.pool_set_coords = get_pool_set_coords()

    @abstractmethod
    def select_batch(self) -> list[int]:
        """Returns a list of indices of the pool set to be selected for labelling in the next iteration
        """
        pass

    def _sanity_check_batch_selection(self, batch_inds):
        assert len(batch_inds) == self.num_samples, 'Number of samples in batch must match num_samples'
        assert all([0 <= i < len(self.pool_set_coords) for i in batch_inds]), 'Batch indices must be valid'

    def evaluate_al_approach(self):
        results = ActiveLearningResults()

        all_batch_nominal_locations = []
        all_batch_locations = []
        all_predictions = []

        for i in range(self.num_eval_repeats):
            # First train and evaluate on training set
            x_train, y_train = self.training_set
            self.model.set_params(random_state=i)
            self.model.fit(x_train, y_train)
            baseline_score = self._evaluate_model(self.model, self.test_set)

            logger.info(f'Completed first model fit. Baseline accuracy: {baseline_score["accuracy"]:.2f}')

            # Now repeat on union of training and batch
            batch_inds = self.select_batch()
            self._sanity_check_batch_selection(batch_inds)
            logger.info('Selected batch inds for labelling')

            x_batch_nominal = self.pool_set_coords[batch_inds]

            # Now we have to sample from the offset prediction model to get the measured positions
            x_batch = predict_measured_locations(x_batch_nominal, self.num_repeats_per_sample)  # Shape (num_samples, num_repeats, 2)

            x_batch_nominal = np.repeat(x_batch_nominal, self.num_repeats_per_sample, axis=0)
            x_batch = x_batch.reshape(-1, 2)
            assert x_batch.shape == x_batch_nominal.shape

            all_batch_nominal_locations.append(x_batch_nominal)
            all_batch_locations.append(x_batch)

            # And then we need to sample from the Bernoulli distribution to get the labels at these coords
            y_batch = sample_bernoulli_outcome(x_batch)

            x_train_new = np.vstack([x_train, x_batch])
            y_train_new = np.hstack([y_train, y_batch])
            self.model.fit(x_train_new, y_train_new)

            al_score = self._evaluate_model(self.model, self.test_set)

            all_predictions.append(al_score['y_pred'])

            logger.info(f'Completed active learning model fit. AL accuracy: {al_score["accuracy"]:.2f}')

            # Record results
            results.baseline_accuracy.append(baseline_score['accuracy'])
            results.delta_accuracy.append(al_score['accuracy'] - baseline_score['accuracy'])
            results.baseline_f1.append(baseline_score['f1'])
            results.delta_f1.append(al_score['f1'] - baseline_score['f1'])
            results.baseline_precision.append(baseline_score['precision'])
            results.delta_precision.append(al_score['precision'] - baseline_score['precision'])
            results.baseline_recall.append(baseline_score['recall'])
            results.delta_recall.append(al_score['recall'] - baseline_score['recall'])

        self._plot_batch_locations(all_batch_nominal_locations, all_batch_locations)
        # self._plot_predictions(all_predictions)

        results_name = f'output/results_{self.__class__.__name__}_{self.model.__class__.__name__}_{self.num_samples}.csv'
        results.write_results_csv(results_name)

        plot_name = f'output/results_{self.__class__.__name__}_{self.model.__class__.__name__}_{self.num_samples}.png'
        plot_title = f'Active learning results for {self.__class__.__name__} with {self.model.__class__.__name__}'
        results.plot_results(plot_name, plot_title)

    def _plot_predictions(self, all_predictions):
        num_axes = len(all_predictions) + 1
        n_cols = 4
        n_rows = num_axes // n_cols

        test_set_coords = self.test_set[0]

        fig, axs = plt.subplots(n_rows, n_cols, figsize=(12, 12))

        for i, y_pred in enumerate(all_predictions):
            ax = axs[i // n_cols, i % n_cols]
            ax.scatter(test_set_coords[:, 0], test_set_coords[:, 1], c=y_pred, cmap='viridis')

        fig.savefig(f'output/predictions_{self.__class__.__name__}_{self.model.__class__.__name__}_{self.num_samples}.png')
        logger.info(f'Saved predictions plot to predictions_{self.__class__.__name__}_{self.model.__class__.__name__}_{self.num_samples}.png')

    def _plot_batch_locations(self, all_x_batch_nominal, all_x_batch):
        assert len(all_x_batch_nominal) == len(all_x_batch)

        if len(all_x_batch_nominal) == 1:
            fig, ax = plt.subplots(figsize=(6, 6))
            ax.scatter(all_x_batch_nominal[0][:, 0], all_x_batch_nominal[0][:, 1], label='Active learning batch (nominal)')
            ax.scatter(all_x_batch[0][:, 0], all_x_batch[0][:, 1], label='Active learning batch (measured)')
            ax.scatter(self.training_set[0][:, 0], self.training_set[0][:, 1], label='Training set')
            ax.quiver(all_x_batch_nominal[0][:, 0], all_x_batch_nominal[0][:, 1], all_x_batch[0][:, 0] - all_x_batch_nominal[0][:, 0], all_x_batch[0][:, 1] - all_x_batch_nominal[0][:, 1], scale=1, scale_units='xy', angles='xy', color='black', alpha=0.4)
            ax.set_aspect('equal')
            ax.set_xlim(-0.2, 1.2)
            ax.set_ylim(-0.2, 1.2)

        else:
            num_axes = len(all_x_batch_nominal) + 1
            n_cols = 4
            n_rows = num_axes // n_cols + 1

            fig, axs = plt.subplots(n_rows, n_cols, figsize=(12, 12))

            for i, (x_batch_nominal, x_batch) in enumerate(zip(all_x_batch_nominal, all_x_batch)):
                ax = axs[i // n_cols, i % n_cols]

                offsets = x_batch - x_batch_nominal

                ax.scatter(x_batch_nominal[:, 0], x_batch_nominal[:, 1], label='Active learning batch (nominal)')
                ax.scatter(x_batch[:, 0], x_batch[:, 1], label='Active learning batch (measured)')
                ax.scatter(self.training_set[0][:, 0], self.training_set[0][:, 1], label='Training set')
                ax.quiver(x_batch_nominal[:, 0], x_batch_nominal[:, 1], offsets[:, 0], offsets[:, 1], scale=1, scale_units='xy', angles='xy', color='black', alpha=0.4)
                ax.set_aspect('equal')
                ax.set_xlim(-0.2, 1.2)
                ax.set_ylim(-0.2, 1.2)

            # Hide axes of remaining plots
            for i in range(len(all_x_batch_nominal), n_cols * n_rows):
                ax = axs[i // n_cols, i % n_cols]
                ax.axis('off')

        model_class_name = self.model.__class__.__name__
        al_class_name = self.__class__.__name__
        fig.suptitle(f'Batch locations for {model_class_name} with {al_class_name}')
        fig.tight_layout()
        fig.savefig(f'output/batch_locations_{model_class_name}_{al_class_name}.png')
        logger.info(f'Saved batch locations plot to batch_locations_{model_class_name}_{al_class_name}.png')


    def _evaluate_model(self, model, test_set):
        x_test, y_test = test_set
        y_pred = model.predict(x_test)
        accuracy = accuracy_score(y_test, y_pred)
        f1 = f1_score(y_test, y_pred)
        precision = precision_score(y_test, y_pred)
        recall = recall_score(y_test, y_pred)
        return {'accuracy': accuracy, 'f1': f1, 'precision': precision, 'recall': recall, 'y_pred': y_pred}


@dataclass
class ActiveLearningResults:
    baseline_accuracy: list = field(default_factory=list)
    delta_accuracy: list = field(default_factory=list)
    baseline_f1: list = field(default_factory=list)
    delta_f1: list = field(default_factory=list)
    baseline_precision: list = field(default_factory=list)
    delta_precision: list = field(default_factory=list)
    baseline_recall: list = field(default_factory=list)
    delta_recall: list = field(default_factory=list)

    def write_results_csv(self, results_name):
        df = pd.DataFrame(self.__dict__)
        df.to_csv(results_name)
        logger.info(f'Wrote results to {results_name}')

    def plot_results(self, plot_name, plot_title):
        fig, axs = plt.subplots(1, 4, figsize=(12, 3))

        axs[0].hist(self.baseline_accuracy, bins=np.linspace(0.8, 1.0, 20), alpha=0.5, label='Baseline Accuracy')
        axs[0].hist(np.array(self.baseline_accuracy) + np.array(self.delta_accuracy), bins=np.linspace(0.8, 1.0, 20), alpha=0.5, label='AL Accuracy')
        axs[0].legend()
        axs[1].hist(self.delta_accuracy, bins=10, alpha=0.5, label='Delta Accuracy')
        axs[2].hist(self.baseline_f1, bins=np.linspace(0.8, 1.0, 20), alpha=0.5, label='Baseline F1')
        axs[2].hist(np.array(self.baseline_f1) + np.array(self.delta_f1), bins=np.linspace(0.8, 1.0, 20), alpha=0.5, label='AL F1')
        axs[2].legend()
        axs[3].hist(self.delta_f1, bins=10, alpha=0.5, label='Delta F1')

        axs[0].set_title('Accuracy')
        axs[1].set_title('Delta Accuracy')
        axs[2].set_title('F1')
        axs[3].set_title('Delta F1')

        fig.suptitle(plot_title)
        fig.tight_layout()
        fig.savefig(plot_name)
        logger.info(f'Wrote plot to {plot_name}')
