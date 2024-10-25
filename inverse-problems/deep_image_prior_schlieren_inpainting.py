# Copy the simple implementation at https://github.com/safwankdb/Deep-Image-Prior/blob/master/dip_inpainting.py

# -*- coding: utf-8 -*-

import torch
import torch.nn.functional as F
import torch.nn as nn
import torch.optim as optim
import torchvision as tv
import numpy as np
from PIL import Image
from matplotlib import pyplot as plt
import imageio


class Hourglass(nn.Module):
    def __init__(self):
        super(Hourglass, self).__init__()

        self.leaky_relu = nn.LeakyReLU()

        self.d_conv_1 = nn.Conv2d(2, 8, 5, stride=2, padding=2)
        self.d_bn_1 = nn.BatchNorm2d(8)

        self.d_conv_2 = nn.Conv2d(8, 16, 5, stride=2, padding=2)
        self.d_bn_2 = nn.BatchNorm2d(16)

        self.d_conv_3 = nn.Conv2d(16, 32, 5, stride=2, padding=2)
        self.d_bn_3 = nn.BatchNorm2d(32)
        self.s_conv_3 = nn.Conv2d(32, 4, 5, stride=1, padding=2)

        self.d_conv_4 = nn.Conv2d(32, 64, 5, stride=2, padding=2)
        self.d_bn_4 = nn.BatchNorm2d(64)
        self.s_conv_4 = nn.Conv2d(64, 4, 5, stride=1, padding=2)

        self.d_conv_5 = nn.Conv2d(64, 128, 5, stride=2, padding=2)
        self.d_bn_5 = nn.BatchNorm2d(128)
        self.s_conv_5 = nn.Conv2d(128, 4, 5, stride=1, padding=2)

        self.d_conv_6 = nn.Conv2d(128, 256, 5, stride=2, padding=2)
        self.d_bn_6 = nn.BatchNorm2d(256)

        self.u_deconv_5 = nn.ConvTranspose2d(256, 124, 4, stride=2, padding=1)
        self.u_bn_5 = nn.BatchNorm2d(128)

        self.u_deconv_4 = nn.ConvTranspose2d(128, 60, 4, stride=2, padding=1)
        self.u_bn_4 = nn.BatchNorm2d(64)

        self.u_deconv_3 = nn.ConvTranspose2d(64, 28, 4, stride=2, padding=1)
        self.u_bn_3 = nn.BatchNorm2d(32)

        self.u_deconv_2 = nn.ConvTranspose2d(32, 16, 4, stride=2, padding=1)
        self.u_bn_2 = nn.BatchNorm2d(16)

        self.u_deconv_1 = nn.ConvTranspose2d(16, 8, 4, stride=2, padding=1)
        self.u_bn_1 = nn.BatchNorm2d(8)

        self.out_deconv = nn.ConvTranspose2d(8, 1, 4, stride=2, padding=1)
        self.out_bn = nn.BatchNorm2d(1)

    def forward(self, noise):
        down_1 = self.d_conv_1(noise)
        down_1 = self.d_bn_1(down_1)
        down_1 = self.leaky_relu(down_1)

        down_2 = self.d_conv_2(down_1)
        down_2 = self.d_bn_2(down_2)
        down_2 = self.leaky_relu(down_2)

        down_3 = self.d_conv_3(down_2)
        down_3 = self.d_bn_3(down_3)
        down_3 = self.leaky_relu(down_3)
        skip_3 = self.s_conv_3(down_3)

        down_4 = self.d_conv_4(down_3)
        down_4 = self.d_bn_4(down_4)
        down_4 = self.leaky_relu(down_4)
        skip_4 = self.s_conv_4(down_4)

        down_5 = self.d_conv_5(down_4)
        down_5 = self.d_bn_5(down_5)
        down_5 = self.leaky_relu(down_5)
        skip_5 = self.s_conv_5(down_5)

        down_6 = self.d_conv_6(down_5)
        down_6 = self.d_bn_6(down_6)
        down_6 = self.leaky_relu(down_6)

        up_5 = self.u_deconv_5(down_6)
        skip_5 = F.interpolate(skip_5, size=up_5.shape[2:], mode='bilinear', align_corners=False)
        up_5 = torch.cat([up_5, skip_5], 1)
        up_5 = self.u_bn_5(up_5)
        up_5 = self.leaky_relu(up_5)

        up_4 = self.u_deconv_4(up_5)
        skip_4 = F.interpolate(skip_4, size=up_4.shape[2:], mode='bilinear', align_corners=False)
        up_4 = torch.cat([up_4, skip_4], 1)
        up_4 = self.u_bn_4(up_4)
        up_4 = self.leaky_relu(up_4)

        up_3 = self.u_deconv_3(up_4)
        skip_3 = F.interpolate(skip_3, size=up_3.shape[2:], mode='bilinear', align_corners=False)
        up_3 = torch.cat([up_3, skip_3], 1)
        up_3 = self.u_bn_3(up_3)
        up_3 = self.leaky_relu(up_3)

        up_2 = self.u_deconv_2(up_3)
        up_2 = F.interpolate(up_2, size=down_2.shape[2:], mode='bilinear', align_corners=False)
        up_2 = self.u_bn_2(up_2)
        up_2 = self.leaky_relu(up_2)

        up_1 = self.u_deconv_1(up_2)
        up_1 = self.u_bn_1(up_1)
        up_1 = self.leaky_relu(up_1)

        out = self.out_deconv(up_1)
        out = F.interpolate(out, size=noise.shape[2:], mode='bilinear', align_corners=False)
        out = self.out_bn(out)
        out = nn.Sigmoid()(out)

        return out


def pixel_thanos(img, p=0.5):
    assert p > 0 and p < 1, 'The probability value should lie in (0, 1)'
    mask = torch.rand(img.size()[2:])
    img[:, :, mask < p] = 0
    mask = mask > p
    mask = mask.repeat(1, 1, 1, 1)
    return img, mask


lr = 1e-2
device = 'cpu'
print('Using {} for computation'.format(device.upper()))

hg_net = Hourglass()
hg_net.to(device)
mse = nn.MSELoss()
optimizer = optim.Adam(hg_net.parameters(), lr=lr)

to_tensor = tv.transforms.ToTensor()
im_path = '/Users/murray/Projects/psaap-data-science/data/exp/images/Test138_SCH_IMG/Test138_SCH_IMG_0.08.png'
x = Image.open(im_path)
x = to_tensor(x).unsqueeze(0)
print(f'Loaded target image with shape {x.shape}')

n_iter = 500
images = []
losses = []
z = torch.Tensor(np.mgrid[:x.shape[2], :x.shape[3]]).unsqueeze(0).to(device) / 512

x, mask = pixel_thanos(x, 0.5)
mask = mask.to(device).float()
x = x.to(device)

for i in range(n_iter):
    optimizer.zero_grad()
    y = hg_net(z)
    loss = mse(x, y*mask)
    losses.append(loss.item())
    loss.backward()
    optimizer.step()
    if i < 1000 and (i+1)%4==0 or i==0:
        with torch.no_grad():
            out = y
            out = out[0, 0].cpu().detach().numpy()
            out_np = (out * 255).astype(np.uint8)  # Convert to uint8
            images.append(out_np)
    if (i+1) % 20 == 0:
        print('Iteration: {} Loss: {:.07f}'.format(i+1, losses[-1]))

print(out.shape)
print(x[0, 0].shape)

imageio.mimsave('schlieren_dip_test.gif',images)
plt.imsave('final.jpg', out_np)
plt.imsave('start.jpg', x[0, 0].cpu().detach().numpy())
plt.plot(losses)
plt.show()