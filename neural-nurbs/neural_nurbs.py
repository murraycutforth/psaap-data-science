import torch
from matplotlib import pyplot as plt

"""
We experiment with the idea of using a MLP to approximate Nip(t) in B-splines/NURBS curves.

The curve is parametrised as s(t) = sum_i r_i(t) p_i, r_i = (n_i(t) w_i) / (sum_i n_i(t) w_i)

Some points to note:
 - As with NURBs, we want sum_i Nip(t) = 1. This could be done naively using an output layer of size N, and applying a softmax.
 alternatively, i could be used as a network input.
 - We can compute the curvature of s(t) very easily, since MLPs are differentiable:
    kappa = | s'(t) x s''(t) | / | s'(t) ^3 |
 - The degree p is no longer relevant
 - This formulation will scale well to high dimensional surfaces? s(t, v, w, ...). 
"""



class NeuralBspline(torch.nn.Module):
    def __init__(self, num_ctrl_pts, nn_depth, nn_width):
        super().__init__()
        self.num_ctrl_pts = num_ctrl_pts
        self.nn = torch.nn.Sequential(
            *[torch.nn.Linear(1, nn_width), torch.nn.ReLU()],
            *[torch.nn.Linear(nn_width, nn_width), torch.nn.ReLU()] * nn_depth,
            *[torch.nn.Linear(nn_width, num_ctrl_pts), torch.nn.Softmax(dim=1)]
        )

    def forward(self, t, yt):
        assert yt.shape[0] == self.num_ctrl_pts
        assert yt.shape[1] >= 1
        assert t.shape[0] >= 1
        assert t.shape[1] == 1

        n_i = self.nn(t)  # Shape (num_t, num_ctrl_pts)
        s_t = torch.sum(n_i.unsqueeze(-1) * yt.unsqueeze(0), dim=1)  # Shape (num_t, dim)
        return s_t

    def visualise_neural_basis_fns(self):
        num_t = 100
        ts = torch.linspace(0, 1, num_t).unsqueeze(1)
        n_i = self.nn(ts).detach().numpy()
        plt.figure()
        for i in range(self.num_ctrl_pts):
            plt.plot(ts, n_i[:, i], label=f'N_{i}')
        plt.legend()
        plt.show()

    def compute_curvature(self, t, control_points):
        assert len(t.shape) == 2
        assert len(control_points.shape) == 2
        assert t.shape[1] == 1  # shape (batch, 1)
        assert control_points.shape[1] == 2  # shape (num_ctrl_pts, 2) assuming we're in 2D

        t.requires_grad = True
        s_t = self(t, control_points)  # shape (batch, 2)
        x_t = s_t[:, 0]
        y_t = s_t[:, 1]

        # TODO: is there a neater implementation than computing the gradient component-wise?
        grad_s_x = torch.autograd.grad(x_t, t, grad_outputs=torch.ones_like(x_t), create_graph=True, retain_graph=True)[0]
        grad_s_y = torch.autograd.grad(y_t, t, grad_outputs=torch.ones_like(y_t), create_graph=True, retain_graph=True)[0]

        grad_2_s_x = torch.autograd.grad(grad_s_x, t, grad_outputs=torch.ones_like(grad_s_x), create_graph=True, retain_graph=True)[0]
        grad_2_s_y = torch.autograd.grad(grad_s_y, t, grad_outputs=torch.ones_like(grad_s_y), create_graph=True, retain_graph=True)[0]

        curvature = torch.abs(grad_s_x * grad_2_s_y - grad_s_y * grad_2_s_x) / (grad_s_x ** 2 + grad_s_y ** 2) ** 1.5

        return curvature

    def compute_tangent(self, t, control_points):
        s_t = self(t, control_points)
        x_t = s_t[:, 0]
        y_t = s_t[:, 1]

        grad_s_x = torch.autograd.grad(x_t, t, grad_outputs=torch.ones_like(x_t), create_graph=True)[0]
        grad_s_y = torch.autograd.grad(y_t, t, grad_outputs=torch.ones_like(y_t), create_graph=True)[0]
        grad_s = torch.stack([grad_s_x, grad_s_y], dim=1)

        return grad_s


    def loss(self, t, y_t):
        """TODO: add to this. Start with just MSE loss on the control points
        """
        s_t = self(t, y_t)

        #alpha = 1e-4
        #num_r_eval_points = 100
        #ts = torch.linspace(0, 1, num_r_eval_points).unsqueeze(1)
        #rs = self.compute_curvature(ts, y_t)

        loss = torch.mean((s_t - y_t) ** 2) #+ alpha * torch.linalg.vector_norm(rs, ord=3)

        return loss

    def fit(self, t, y_t, num_epochs=1000, lr=1e-3):
        """Full batch gradient descent to fit the neural interpolant to the data
        """
        optimizer = torch.optim.Adam(self.parameters(), lr=lr, weight_decay=0)
        for epoch in range(num_epochs):
            optimizer.zero_grad()
            loss = self.loss(t, y_t)
            loss.backward()
            optimizer.step()
            if epoch % 100 == 0:
                print(f'Epoch {epoch}, loss {loss.item()}')
        print(f'Final loss {loss.item()}')

        self.visualise_neural_basis_fns()


class NeuralNURBs(NeuralBspline):
    def __init__(self, num_ctrl_pts, nn_depth, nn_width, weights):
        super().__init__(num_ctrl_pts, nn_depth, nn_width)
        self.weights = torch.nn.Parameter(torch.tensor(weights, dtype=torch.float32))
        assert self.weights.shape[0] == self.num_ctrl_pts
        assert len(self.weights.shape) == 1

    def forward(self, t, yt):
        assert yt.shape[0] == self.num_ctrl_pts
        assert yt.shape[1] >= 1
        assert t.shape[0] >= 1
        assert t.shape[1] == 1

        n_i = self.nn(t)  # Shape (num_t, num_ctrl_pts)
        r_i = n_i * self.weights.unsqueeze(0) / torch.sum(n_i * self.weights.unsqueeze(0), dim=1, keepdim=True)  # Shape (num_t, num_ctrl_pts)
        s_t = torch.sum(r_i.unsqueeze(-1) * yt.unsqueeze(0), dim=1)  # Shape (num_t, dim)
        return s_t





