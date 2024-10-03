import unittest
import numpy as np
from laser_tuning.src.metrics.dice import (
    compute_rmse,
    compute_mae,
    compute_zncc,
    compute_dice,
    compute_dice_cone_subset,
    create_cone_mask,
    compute_hausdorff_distance
)


class TestMetrics(unittest.TestCase):

    def setUp(self):
        self.arr1 = np.array([1, 2, 3, 4, 5])
        self.arr2 = np.array([1, 2, 3, 4, 6])
        self.bool_arr1 = np.array([[[True, False], [False, True]], [[True, True], [False, False]]])
        self.bool_arr2 = np.array([[[True, True], [False, False]], [[True, False], [True, False]]])
        self.weights = np.array([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])

    def test_compute_rmse(self):
        expected_rmse = np.sqrt(1 / 5)
        self.assertAlmostEqual(compute_rmse(self.arr1, self.arr2), expected_rmse)

    def test_compute_mae(self):
        expected_mae = 1 / 5
        self.assertAlmostEqual(compute_mae(self.arr1, self.arr2), expected_mae)

    def test_compute_zncc(self):
        arr1 = np.array([1, 2, 3])
        arr2 = np.array([1, 2, 3])
        expected_zncc = 1.0
        self.assertAlmostEqual(compute_zncc(arr1, arr2), expected_zncc)

    def test_compute_dice(self):
        expected_dice = 4 / 8
        self.assertAlmostEqual(compute_dice(self.bool_arr1, self.bool_arr2), expected_dice)

    def test_compute_dice_cone_subset(self):
        expected_dice_cone = 0.0  # Adjust based on the specific cone mask and arrays
        self.assertAlmostEqual(compute_dice_cone_subset(self.bool_arr1, self.bool_arr2), expected_dice_cone)

    def test_cone_mask(self):
        cone_mask = create_cone_mask((4, 4, 4))
        self.assertEqual(np.sum(cone_mask), 10)

    def test_compute_hausdorff_distance(self):
        expected_hausdorff = 1.0  # Adjust based on the specific arrays
        self.assertAlmostEqual(compute_hausdorff_distance(self.bool_arr1, self.bool_arr2), expected_hausdorff)


if __name__ == '__main__':
    unittest.main()