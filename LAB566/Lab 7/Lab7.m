close all;
clear all;
clc;

img_noise = imread('salt_and_pepper-1.jpg');
figure, imshow(img_noise);

img_denoise = medfilt2(img_noise);
figure,imshow(img_denoise);

img_denoise = medfilt2(img_noise,[5 5]);
figure,imshow(img_denoise);

img_denoise = medfilt2(img_noise,[10 10]);
figure,imshow(img_denoise);

img_denoise = medfilt2(img_noise,[50 50]);
figure,imshow(img_denoise);