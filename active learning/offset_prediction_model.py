from pathlib import Path
from typing import Any
import logging

import numpy as np
import pandas as pd
import torch
import lightning as pl
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt

from synthetic_data_generation import prepare_numpy_experimental_offset_dataset

logger = logging.getLogger(__name__)


class LightningOffsetPredictionModel(pl.LightningModule):
    """This class defines a PyTorch Lightning module for the 3 parameter prediction task
    """
    def __init__(self):
        super(LightningOffsetPredictionModel, self).__init__()

        #self.model = LinearParamModel()
        self.model = MLPParamModel()
        self.loss = NegLLLoss()
        self.fixed_sigma = False

    def forward(self, x):
        return self.model(x)

    def training_step(self, batch, batch_idx):
        x, y = batch
        pred_params = self.model(x)  # x is nominal location
        mu_pred = pred_params[:, :, :2]
        sigma_pred = pred_params[:, :, 2]
        if self.fixed_sigma:
            sigma_pred[...] = 0.2
        loss = self.loss(mu_pred, sigma_pred, y)  # y is error
        self.log('train_loss', loss)  # Log training loss
        return loss

    def validation_step(self, batch, batch_idx):
        x, y = batch
        pred_params = self.model(x)
        mu_pred = pred_params[:, :, :2]
        sigma_pred = pred_params[:, :, 2]
        if self.fixed_sigma:
            sigma_pred[...] = 0.2
        loss = self.loss(mu_pred, sigma_pred, y)
        self.log('val_loss', loss)  # Log validation loss
        return loss

    def predict_step(self, xs) -> Any:
        pred_params = self.model(xs)
        mu_pred = pred_params[:, :, :2]
        sigma_pred = pred_params[:, :, 2]
        if self.fixed_sigma:
            sigma_pred[...] = 0.2
        return mu_pred, sigma_pred

    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters(), lr=1e-3, weight_decay=0)


class LinearParamModel(torch.nn.Module):
    """This class defines a simple linear model which predicts 3 parameters, given a 2D nominal position input
    """
    def __init__(self):
        super(LinearParamModel, self).__init__()

        input_dim = 2
        output_dim = 3
        self.linear = torch.nn.Linear(input_dim, output_dim)

    def forward(self, x):
        return self.linear(x)


class MLPParamModel(torch.nn.Module):
    """This class defines a simple MLP model which predicts 3 parameters, given a 2D nominal position input
    """
    def __init__(self):
        super(MLPParamModel, self).__init__()

        input_dim = 2
        output_dim = 3
        hidden_dim = 32
        self.mlp = torch.nn.Sequential(
            torch.nn.Linear(input_dim, hidden_dim),
            torch.nn.ReLU(),
            torch.nn.Linear(hidden_dim, hidden_dim),
            torch.nn.ReLU(),
            torch.nn.Linear(hidden_dim, hidden_dim),
            torch.nn.ReLU(),
            torch.nn.Linear(hidden_dim, output_dim)
        )

    def forward(self, x):
        x = x / 10.  # Hacky normalisation, since input scale is O(10).
        return self.mlp(x)


class NegLLLoss(torch.nn.Module):
    """This class defines a negative log likelihood loss function for the 3 parameter prediction task
    """
    def __init__(self):
        super(NegLLLoss, self).__init__()

    def forward(self, mu_pred, sigma_pred, y_true):
        """Calculates the negative log likelihood loss

        Args:
            mu_pred (torch.Tensor): The predicted mean values (B, 1, 2)
            sigma_pred (torch.Tensor): The predicted standard deviation values (B, 1) or (B, 1, 1)
            y_true (torch.Tensor): The true values (B, 1, 2)

        Returns:
            torch.Tensor: The negative log likelihood loss
        """
        return torch.mean(torch.log(sigma_pred**2) + 0.5 * torch.bmm(y_true - mu_pred, (y_true - mu_pred).transpose(1, 2)) / sigma_pred**2)


def plot_latest_loss_curves():
    # Plot latest set of metrics.csv files
    all_metrics_filenames = list(Path('lightning_logs').rglob('metrics.csv'))
    latest_metrics_filename = max(all_metrics_filenames, key=lambda x: x.stat().st_mtime)
    print(latest_metrics_filename)
    latest_metrics = pd.read_csv(latest_metrics_filename)
    train_losses = latest_metrics[['epoch', 'train_loss']].dropna()
    val_losses = latest_metrics[['epoch', 'val_loss']].dropna()
    plt.plot(train_losses['epoch'], train_losses['train_loss'], label='train_loss')
    plt.plot(val_losses['epoch'], val_losses['val_loss'], label='val_loss')
    plt.legend()
    plt.xlabel('Epoch')
    plt.ylabel('Loss')
    plt.show()


def plot_model_predictions(model, trainer):
    # Create grid of xs
    xmin = -0.1
    xmax = 1.1
    ymin = -0.1
    ymax = 1.1
    x = torch.linspace(xmin, xmax, 10)
    y = torch.linspace(ymin, ymax, 10)
    xs = torch.stack(torch.meshgrid(x, y), dim=-1).reshape(-1, 1, 2)

    prediction_dl = torch.utils.data.DataLoader(xs, batch_size=256, shuffle=False, num_workers=1, persistent_workers=True)

    preds = trainer.predict(model, prediction_dl)

    mu_pred_list = [x[0] for x in preds]
    sigma_pred_list = [x[1] for x in preds]
    mu_pred = torch.cat(mu_pred_list, dim=0).numpy().squeeze()
    sigma_pred = torch.cat(sigma_pred_list, dim=0).numpy()

    print('Average sigma pred:', sigma_pred.mean())

    # Plot a scatter of sigma pred, colored by sigma pred with a colorbar
    plt.figure()
    plt.scatter(xs[:, 0, 0], xs[:, 0, 1], c=sigma_pred, cmap='viridis', s=40)
    plt.colorbar()
    plt.xlabel('Spark X Location [mm]')
    plt.ylabel('Spark Z Location [mm]')
    plt.title('Predicted spark position uncertainty')
    plt.show()

    # Plot quiver plot of each x, y position, with arrow for mu pred
    # also plot a circle with radius sigma_pred on the endof the arrow
    plt.figure()
    plt.scatter(xs[:, 0, 0], xs[:, 0, 1], marker='x')
    plt.quiver(xs[:, 0, 0], xs[:, 0, 1], mu_pred[:, 0], mu_pred[:, 1], scale=1, scale_units='xy')

    for i in range(xs.shape[0]):
        plt.gca().add_artist(plt.Circle((xs[i, 0, 0] + mu_pred[i, 0], xs[i, 0, 1] + mu_pred[i, 1]),
                                        sigma_pred[i], fill=True, alpha=0.4, color='orange'))
        plt.gca().add_artist(plt.Circle((xs[i, 0, 0] + mu_pred[i, 0], xs[i, 0, 1] + mu_pred[i, 1]),
                                        2 * sigma_pred[i], fill=True, alpha=0.2, color='orange'))

    plt.gca().set_aspect('equal', adjustable='box')
    plt.xlim(xmin - 0.1, xmax + 0.1)
    plt.ylim(ymin - 0.1, ymax + 0.1)
    plt.xlabel('Spark X Location [mm]')
    plt.ylabel('Spark Z Location [mm]')
    plt.title('Predicted spark position offset and uncertainty')

    plt.show()


def get_saved_model_name():
    return 'offset_prediction_model.pth'


def load_pretrained_model():
    model = LightningOffsetPredictionModel()

    pretrained_model_path = Path(get_saved_model_name())
    assert pretrained_model_path.exists()

    model.load_state_dict(torch.load(pretrained_model_path))
    return model


def predict_measured_locations(xs: np.ndarray, num_repeats_per_sample) -> np.ndarray:
    """Given an array of nominal locations, return sampled actual locations using pretrained model
    """
    assert xs.ndim == 2
    assert xs.shape[1] == 2

    model = load_pretrained_model()

    xs_tensor = torch.tensor(xs, dtype=torch.float32)

    model.eval()

    with torch.no_grad():
        pred_params = model(xs_tensor[:, None, :])

    mu_pred = pred_params[:, :, :2].numpy().squeeze()
    sigma_pred = pred_params[:, :, 2].numpy().squeeze()

    assert len(mu_pred) == len(sigma_pred) == len(xs)

    # For each x, sample from a normal distribution with mu_pred and sigma_pred
    sampled_offsets = []
    gen = np.random.default_rng(42)
    for mu, sigma in zip(mu_pred, sigma_pred):
        sampled_offsets.append(gen.multivariate_normal(mu, sigma**2 * np.eye(2), size=num_repeats_per_sample))

    sampled_offsets = np.array(sampled_offsets)
    assert sampled_offsets.shape == (len(xs), num_repeats_per_sample, 2)

    measured_locs = xs[:, None, :] + sampled_offsets
    assert measured_locs.shape == (len(xs), num_repeats_per_sample, 2)

    return measured_locs








def main():
    """Train and save out an offset prediction model
    """
    nominal, error = prepare_numpy_experimental_offset_dataset()

    X_train, X_test, y_train, y_test = train_test_split(nominal, error, test_size=0.2, random_state=42)

    trainer = pl.Trainer(max_epochs=10000, enable_progress_bar=True, log_every_n_steps=100, check_val_every_n_epoch=100)

    model = LightningOffsetPredictionModel()
    train_dataset = torch.utils.data.TensorDataset(torch.tensor(X_train[:, None, :], dtype=torch.float32), torch.tensor(y_train[:, None, :], dtype=torch.float32))
    val_dataset = torch.utils.data.TensorDataset(torch.tensor(X_test[:, None, :], dtype=torch.float32), torch.tensor(y_test[:, None, :], dtype=torch.float32))
    train_dl = torch.utils.data.DataLoader(train_dataset, batch_size=1000, shuffle=True, num_workers=1, persistent_workers=True)
    val_dl = torch.utils.data.DataLoader(val_dataset, batch_size=1000, shuffle=False, num_workers=1, persistent_workers=True)

    trainer.fit(model, train_dataloaders=train_dl, val_dataloaders=val_dl)

    # Save the model
    torch.save(model.state_dict(), get_saved_model_name())
    logger.info(f'Saved model to {get_saved_model_name()}')

    plot_latest_loss_curves()

    plot_model_predictions(model, trainer)


if __name__ == '__main__':
    main()
