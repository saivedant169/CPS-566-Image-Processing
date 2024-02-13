close all;
clear all;
clc;

img = imread('singapore-1.jpg');
figure, imshow(img);

img_gray = rgb2gray(img);
figure, imshow(img_gray);

gaussian_kernel = fspecial('gaussian', [25 25], 5);
img_gray_gaussian = imfilter(img_gray, gaussian_kernel,'replicate');
figure, imshow(img_gray_gaussian);

img_sharpened = img_gray * 2 - img_gray_gaussian;
figure, imshow(img_sharpened);

img_sharpened2 = double(img_gray)*2 - double(img_gray_gaussian);
figure, imshow(img_sharpened2);

img_sharpened3 = uint8(img_sharpened2);
figure, imshow(img_sharpened3);

figure, imshow(gaussian_kernel,[]);

kernel = [0 1 0; 1 -4 1;0 1 0];
kernel1 = [1 1 1; 1 -8 1;1 1 1];

img_laplacian = imfilter(img, kernel, 'replicate');
figure, imshow(img_laplacian);

img_laplacian = imfilter(img, kernel1, 'replicate');
figure, imshow(img_laplacian);

