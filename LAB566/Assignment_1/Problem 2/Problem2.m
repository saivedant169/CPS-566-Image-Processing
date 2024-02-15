clear all;
close all;
clc;

% Read the original color image
original_img = imread('image.jpg');

% Convert the image to grayscale
gray_img = rgb2gray(original_img);

% Add noise to the grayscale image
noisy_gray_img = imnoise(gray_img, 'salt & pepper', 0.15);

% Define the size of the neighborhood for the filters
window_size = 7;

% Apply the median filter
median_filtered_img = Filter.median_filter(noisy_gray_img, window_size);

% Apply the adaptive filter
adaptive_filtered_img = Filter.adaptive_filter(noisy_gray_img, window_size);

% Display the images
figure;

subplot(2, 3, 1);
imshow(original_img);
title('Original Color Image');

subplot(2, 3, 2);
imshow(gray_img);
title('Grayscale Image');

subplot(2, 3, 3);
imshow(noisy_gray_img);
title('Grayscale Image with Noise');

subplot(2, 3, 4);
imshow(uint8(median_filtered_img)); % Convert back to uint8 for display
title('Median Filtered Image');

subplot(2, 3, 5);
imshow(uint8(adaptive_filtered_img)); % Convert back to uint8 for display
title('Adaptive Filtered Image');