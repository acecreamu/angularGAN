# the page is in the process of filling...

Content:

- AngularGAN code
- Multi-illuminant dataset
- GTAV Shadow removal dataset

---
# Conditional GANs for Multi-Illuminant Color Constancy: Revolution or Yet Another Approach?
Supporting code to the paper <br>
[O Sidorov. Conditional GANs for Multi-Illuminant Color Constancy: Revolution or Yet Another Approach?](https://arxiv.org/abs/1811.06604)
<br>

![image preview](https://github.com/acecreamu/angularGAN/blob/master/image.jpg)

The work is based on applying of supervised image-to-image translation algorithm ["pix2pix" by Isola *et al.*](https://arxiv.org/abs/1611.07004). <br>
[This](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix) implementation of pix2pix in PyTorch was used in our experiments. Please, refer to original repo for pix2pix's reqirements and dependencies.

# Datasets
## Tinted Multi-illuminant dataset

the MATLAB code `generate_tinted_images.m` allows to apply multi-illuimnant color cast on input images. Tint maps are randomized and are not coherent between frames.

## GTAV Shadow Removal Dataset 
The GTAV Shadow Removal Dataset of 5,723 image pairs with and without shadows may be acessed by the [link](https://drive.google.com/open?id=1jEmUIjbTgsU99_2ZEQjfV7g3GnK1L8II).<br>

#### Preview

![dataset preview](https://github.com/acecreamu/angularGAN/blob/master/preview.jpg)
