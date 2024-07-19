# This file is for some simple experiments with autograd in PyTorch, to help my understanding


import torch


def test_autograd_scalar():
    # First, we create a pair of scalars. These are so-called leaf nodes in the computation graph.
    x = torch.tensor(2.0, requires_grad=True)
    y = torch.tensor(3.0, requires_grad=True)

    # Next, we perform a simple operation on these scalars. This creates a new node in the computation graph.
    # Analytically, dz/dx = y = 3, and dz/dy = x = 2.
    z = x * y

    # Analytically, dz1/dx = 2 * y * x = 12, and dz1/dx^2 = 2 * y = 6.
    z1 = z * x

    # There are two ways to compute the derivative dz/dx. The first is to call z.backward(). This will automatically fill
    # in the .grad attributes of all leaf nodes in the computation graph. This can't be used for higher order derivatives though.
    z.backward(retain_graph=True)
    print(x.grad)

    # The second way is to call torch.autograd.grad. This is useful if you want to compute the derivative of a non-leaf
    # node in the computation graph. If you want higher order derivatives, you need to set create_graph=True.
    dz1_dx = torch.autograd.grad(z1, x, create_graph=True, retain_graph=True)[0]
    print(dz1_dx)

    dz1_dx2 = torch.autograd.grad(dz1_dx, x)[0]
    print(dz1_dx2)


def test_autograd_vector_wrt_scalar():
    # Again, first create vector valued leaf node
    x = torch.tensor([2.0, 3.0], requires_grad=True)
    y = torch.tensor([4.0], requires_grad=True)
    z = x * y
    print(z)

    # Now, we can compute the derivative of z with respect to x. This will be a vector of the same shape as x.
    # Analytically, dz/dx = y = [4, 4]
    # The grad_outputs argument is used to specify the gradient of the output with respect to z. This is useful if you
    # want to compute the derivative of a non-scalar function.
    dz_dx = torch.autograd.grad(z, x, grad_outputs=torch.tensor([[1.0, 0.0], [0, 1]]))
    print(dz_dx)


def test_autograd_vector_wrt_vector_batched():
    # Now, we will compute the derivative of a vector with respect to a vector. This is a bit more complicated, because
    # we need to specify the gradient of the output with respect to the input. This is useful if you want to compute the
    # derivative of a non-scalar function.
    x = torch.tensor([[2.0], [4.0]], requires_grad=True)
    y = torch.tensor([[6.0, 7], [8.0, 9]], requires_grad=True)
    z = x * y
    print(z.shape, z)
    print(x.shape)

    # Now, we can compute the derivative of z with respect to x. This will be a vector of the same shape as x.
    # Analytically, dz/dx = y = [[6, 6], [8, 8]]
    # The grad_outputs argument is used to specify the gradient of the output with respect to z. This is useful if you
    # want to compute the derivative of a non-scalar function.
    dz_dx_0 = torch.autograd.grad(z, x, retain_graph=True, grad_outputs=torch.tensor([[1, 0]] * 2))[0]
    dz_dx_1 = torch.autograd.grad(z, x, grad_outputs=torch.tensor([[0, 1]] * 2))[0]
    print(dz_dx_0.shape)
    print(dz_dx_0)



#test_autograd_scalar()
#test_autograd_vector_wrt_scalar()
test_autograd_vector_wrt_vector_batched()