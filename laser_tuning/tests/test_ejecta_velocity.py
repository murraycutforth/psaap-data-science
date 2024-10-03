import unittest
import numpy as np
from laser_tuning.src.utils.velocities import estimate_ejecta_velocity


class TestEstimateEjectaVelocity(unittest.TestCase):

    def test_estimate_ejecta_velocity(self):
        # Known times and positions
        times = np.array([0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) + 100  # us
        positions = [0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9]  # mm

        # 1 mm / us == 1000 m/s
        expected_velocity = 1000  # Example value, replace with actual expected value
        expected_upper = 1000    # Example value, replace with actual expected value
        expected_lower = 1000    # Example value, replace with actual expected value

        velocity, upper, lower = estimate_ejecta_velocity(times, positions)
        self.assertAlmostEqual(velocity, expected_velocity, places=2)
        self.assertAlmostEqual(upper, expected_upper, places=2)
        self.assertAlmostEqual(lower, expected_lower, places=2)


if __name__ == '__main__':
    unittest.main()