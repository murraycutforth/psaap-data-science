import numpy as np
from scipy.spatial.distance import directed_hausdorff


def compute_rmse(arr1, arr2) -> float:
    assert arr1.shape == arr2.shape
    return np.sqrt(np.linalg.norm(arr1.flatten() - arr2.flatten(), ord=2) ** 2 / arr1.size)


def compute_mae(arr1, arr2) -> float:
    assert arr1.shape == arr2.shape
    return np.linalg.norm(arr1.flatten() - arr2.flatten(), ord=1) / arr1.size


def compute_zncc(arr1, arr2) -> float:
    assert arr1.shape == arr2.shape
    arr1 = arr1 - arr1.mean()
    arr2 = arr2 - arr2.mean()
    sigma1 = np.std(arr1)
    sigma2 = np.std(arr2)
    n = arr1.size
    return np.sum(arr1 * arr2) / (n * sigma1 * sigma2)


def compute_dice(y_true: np.array, y_pred: np.array) -> float:
    """
    Compute the 1-Dice between two binary masks
    """
    assert y_true.shape == y_pred.shape
    assert y_true.dtype == y_pred.dtype == bool

    intersection = np.sum(y_true * y_pred)
    union = np.sum(y_true) + np.sum(y_pred)
    dice = 2 * intersection / union

    if np.isnan(dice):
        dice = 0.0

    assert 0 <= dice <= 1
    return 1.0 - dice  # Return the distance instead of the coefficient - so smaller is better, like other metrics


def create_cone_mask(shape):
    # Determine the center of the volume
    center_x, center_y, center_z = np.array(shape) // 2

    # Create a grid of coordinates
    x = np.arange(shape[0]) - center_x
    y = np.arange(shape[1]) - center_y
    z = np.arange(shape[2]) - center_z
    X, Y, Z = np.meshgrid(x, y, z, indexing='ij')

    # Calculate the distance from each point to the center
    distance = np.sqrt(X**2 + Z**2)

    # Create the cone mask
    cone_mask = (Y < 0) & (distance < -Y)

    return cone_mask


def compute_dice_cone_subset(y_true: np.array, y_pred: np.array):
    """Compute Dice coefficient on a subset of the data.
    We assume the input arrays cover the domain [-5, 5]^3
    We extract a cone-shaped region, starting from (0, 0, 0) and extending in negative y-direction
    """
    assert y_true.shape == y_pred.shape

    cone_mask = create_cone_mask(y_true.shape)

    y_true_subset = y_true[cone_mask]
    y_pred_subset = y_pred[cone_mask]

    return compute_dice(y_true_subset, y_pred_subset)


#def compute_weighted_dice(y_true: np.array, y_pred: np.array, weights: np.ndarray) -> float:
#    """
#    Compute the weighted Dice coefficient between two binary masks
#    """
#    assert y_true.shape == y_pred.shape
#    assert y_true.dtype == y_pred.dtype == bool
#    assert weights.shape == y_true.shape
#
#    intersection = np.sum(y_true * y_pred * weights)
#    union = np.sum(y_true * weights) + np.sum(y_pred * weights)
#    dice = 2 * intersection / union
#
#    assert 0 <= dice <= 1
#    return dice


def compute_hausdorff_distance(y_true: np.array, y_pred: np.array) -> float:
    """
    Compute the Hausdorff distance between two binary masks
    """

    gt_indices = np.argwhere(y_true)
    pred_indices = np.argwhere(y_pred)

    h_1 = directed_hausdorff(gt_indices, pred_indices)[0]
    h_2 = directed_hausdorff(pred_indices, gt_indices)[0]
    return max(h_1, h_2)
