import logging

import numpy as np
from sklearn.preprocessing import StandardScaler

logger = logging.getLogger(__name__)


def _load_one_data_split(filename):
    np_data = np.load(filename)
    try:
        return np_data["X"], np_data["Y"], np_data["time"]
    except KeyError:
        return np_data["Xtest"], np_data["Ytest"], np_data["time"]


def load_all_data():
    X_train, Y_train, time_train = _load_one_data_split("TrainData.npz")
    X_test, Y_test, time_test = _load_one_data_split("TestData.npz")

    logger.info(f"Loaded training data with shape {X_train.shape}, {Y_train.shape} and time shape {time_train.shape}")
    logger.info(f"Loaded test data with shape {X_test.shape}, {Y_test.shape} and time shape {time_test.shape}")

    return X_train, Y_train, time_train, X_test, Y_test, time_test


def normalise_data(X_test, X_train, time_test, time_train):
    # Normalise the data - rescale time to [0, 1] and whiten (zero mean, unit variance) the input data
    time_train = time_train / time_train.max()
    time_test = time_test / time_test.max()
    scaler = StandardScaler()
    X_train = scaler.fit_transform(X_train)
    X_test = scaler.transform(X_test)

    return X_test, X_train, time_test, time_train
