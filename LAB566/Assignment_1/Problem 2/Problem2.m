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
img_median = median_filter(img_gray, window_size);

% Perform adaptive filtering
img_adaptive = adaptive_filter(img_gray, window_size);

% Display the original and filtered images
figure;
subplot(1, 3, 1);
imshow(img_gray);
title('Original Grayscale Image');

subplot(1, 3, 2);
imshow(uint8(img_median)); % Convert to uint8 for visualization
title('Median Filtered Image');

subplot(1, 3, 3);
imshow(uint8(img_adaptive)); % Convert to uint8 for visualization
title('Adaptive Filtered Image');