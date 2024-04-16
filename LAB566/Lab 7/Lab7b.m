close all;
clear all;
clc;

img = imread('marvel.jpg');
img_gray = rgb2gray(img);
figure, imshow(img_gray);
title('Grayscale Image');

img_gray_noise = imnoise(img_gray,'gaussian',0,0.025);
figure, imshow(img_gray_noise);
title('Image with Added Gaussian Noise');

img_median_denoise = medfilt2(img_gray_noise,[5 5]);
figure,imshow(img_median_denoise);
title('Image Denoised with Median Filter');

img_median_denoise = medfilt2(img_gray_noise,[10 10]);
figure,imshow(img_median_denoise);
title('Image Denoised with Median Filter (10x10)');

gaussian_kernel = fspecial('gaussian', [5 5]);
img_gray_gaussian = imfilter(img_gray_noise, gaussian_kernel,'replicate');
figure, imshow(img_gray_gaussian);
title('Image Denoised with Gaussian Filter');

img_adaptive_denoise = wiener2(img_gray_noise,[3 3]);
figure,imshow(img_adaptive_denoise);
title('Image Denoised with Adaptive Filter (3x3)');

img_adaptive_denoise = wiener2(img_gray_noise,[5 5]);
figure,imshow(img_adaptive_denoise);
title('Image Denoised with Adaptive Filter (5x5)');

img_adaptive_denoise = wiener2(img_gray_noise,[10 10]);
figure,imshow(img_adaptive_denoise);
title('Image Denoised with Adaptive Filter (10x10)');