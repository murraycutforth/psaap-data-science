import numpy as np
import matplotlib.pyplot as plt
from skimage.restoration import denoise_tv_chambolle
from sklearn.datasets import fetch_openml
import torch
import torch.optim as optim

# Load MNIST dataset
mnist = fetch_openml('mnist_784', version=1)
images = mnist.data.values.reshape(-1, 28, 28) / 255.0
image = images[0]  # Take the first image

# Corrupt the image by masking random pixels
np.random.seed(42)
mask = np.random.rand(*image.shape) > 0.5
corrupted_image = image * mask


# Define the inpainting using energy minimization
class InpaintingModel(torch.nn.Module):
    def __init__(self, corrupted_image, mask):
        super(InpaintingModel, self).__init__()
        self.image = torch.nn.Parameter(torch.tensor(corrupted_image, dtype=torch.float32))
        self.mask = torch.tensor(mask, dtype=torch.float32)

    def forward(self):
        return self.image

# TV Regularization function
def tv_loss(image):
    # Total variation regularization
    diff_x = image[:, 1:] - image[:, :-1]
    diff_y = image[1:, :] - image[:-1, :]
    return torch.sum(torch.abs(diff_x)) + torch.sum(torch.abs(diff_y))

# Initialize model
model = InpaintingModel(corrupted_image, mask)
optimizer = optim.Adam([model.image], lr=0.1)
lambda_tv = 0.1  # Regularization weight

# Optimization loop
n_iterations = 500
for i in range(n_iterations):
    optimizer.zero_grad()

    # Predicted image
    output = model()

    # Data fidelity loss (difference between corrupted and current estimate on known pixels)
    data_loss = torch.sum(((output * model.mask) - torch.tensor(corrupted_image))**2)

    # TV regularization loss
    reg_loss = tv_loss(output)

    # Total loss
    loss = data_loss + lambda_tv * reg_loss
    loss.backward()
    optimizer.step()

    # Print loss every iteration
    print(f"Iteration {i}, Loss: {loss.item()}")

# Get the final inpainted image
inpainted_image = model.image.detach().numpy()

# Display the original and corrupted and inpainted images side by side

plt.figure(figsize=(12, 4))
plt.subplot(1, 3, 1)
plt.title("Original Image")
plt.imshow(image, cmap='gray')
plt.axis('off')

plt.subplot(1, 3, 2)
plt.title("Corrupted Image")
plt.imshow(corrupted_image, cmap='gray')
plt.axis('off')

plt.subplot(1, 3, 3)
plt.title("Inpainted Image")
plt.imshow(inpainted_image, cmap='gray')
plt.axis('off')
plt.show()
