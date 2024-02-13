clear all;
close all;
clc;

% Read the image
img = imread('image.jpg');

% Convert the image to grayscale
img_gray = rgb2gray(img);

% Define the window size for the filters
window_size = 3;

% Perform median filtering
img_median = medfilt2(img_gray, [window_size, window_size]);

% Perform adaptive filtering
img_adaptive = adapthisteq(img_gray, 'NumTiles', [window_size, window_size]);

% Display the original and filtered images
figure;
subplot(1, 3, 1);
imshow(img_gray);
title('Original Grayscale Image');

subplot(1, 3, 2);
imshow(img_median);
title('Median Filtered Image');

subplot(1, 3, 3);
imshow(img_adaptive);
title('Adaptive Filtered Image');