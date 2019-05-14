# Conditional GANs for Multi-Illuminant Color Constancy: Revolution or Yet Another Approach?
Supporting code to the paper <br>
[O Sidorov. Conditional GANs for Multi-Illuminant Color Constancy: Revolution or Yet Another Approach?](https://arxiv.org/abs/1811.06604)
<br>

![image preview](https://github.com/acecreamu/angularGAN/blob/master/image.jpg)

# AngularGAN
The work presents an extension of the supervised image-to-image translation algorithm ["pix2pix" by Isola *et al.*](https://arxiv.org/abs/1611.07004) orriented specifically to the color constancy task.<br></br>
AngularGAN inherits from [this](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix) implementation of pix2pix in PyTorch. Therefore, you may follow original instruction for installation and dependincies. The new modules are implemented in Torch and do not require additional packages. 
#### Datasets are below!</br>
### Getting started
- Put your data in datasets/facades in the format
```
-facedes/
    -test/
        -xxx.jpg
        -yyy.jpg
        -...
    -train/
        -zzz.jpg
        -...
```
where each image consist of couple of images A and B (input and output) concatenated along horizontal axis.</br>
- Run `visdom` to open training visualization (optional)
- Run training (change parameter `--model angular_gan_v2` to use v2)
```
chmod a+x run.sh
./run.sh
```
- Replace `runtest.sh` for testing  (change parameter `--model angular_gan_v2` to use v2)</br></br>
*We thank autors of pix2pix for their excellent work!*

![angulargan_framework](https://github.com/acecreamu/angularGAN/blob/master/angulargan.jpg)

# Datasets
### Tinted Multi-illuminant dataset

The MATLAB code `generate_tinted_images.m` allows to apply multi-illuimnant color cast to the input images. The tint maps are randomized and are not coherent between frames. </br>
You can use the provided file `real_illum_11346_Normalized.mat` or create your own by simple normalization of the original illumination vectors as `e_norm = e./norm(e)`.

### GTAV Shadow Removal Dataset 
The GTAV Shadow Removal Dataset of 5,723 image pairs with and without shadows may be acessed by the [link](https://drive.google.com/open?id=1ktOXJmMQL_6U2J03mks3yWh6EMWKjUmu).<br>

#### Preview

![dataset preview](https://github.com/acecreamu/angularGAN/blob/master/preview.jpg)
