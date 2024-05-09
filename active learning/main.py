"""
This is the main entry point for the active learning experiments
"""
import logging

from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
from sklearn.gaussian_process import GaussianProcessClassifier

from active_learning_methods import RandomSampling, TopKSampling, CardosoRankedBatchMode, al_performance_summary_plot


def main():
    models = [
        #LogisticRegression(),
        #SVC(),
        #RandomForestClassifier(),
        GaussianProcessClassifier()
    ]

    num_eval_repeats = 1
    num_samples = 20
    num_repeat_per_sample = 5

    for model in models:

        RandomSampling(model, num_eval_repeats, num_samples, num_repeat_per_sample).evaluate_al_approach()
        TopKSampling(model, num_eval_repeats, num_samples, num_repeat_per_sample).evaluate_al_approach()
        CardosoRankedBatchMode(model, num_eval_repeats, num_samples, num_repeat_per_sample, alpha=1).evaluate_al_approach()
        CardosoRankedBatchMode(model, num_eval_repeats, num_samples, num_repeat_per_sample, alpha=0.9).evaluate_al_approach()
        CardosoRankedBatchMode(model, num_eval_repeats, num_samples, num_repeat_per_sample, alpha=0.8).evaluate_al_approach()

    al_performance_summary_plot()


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    main()