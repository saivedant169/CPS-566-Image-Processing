clear all;
close all;
clc;

% Call the histogram_matching function
img1 = imread('image1.jpg');
img2 = imread('image2.jpg');
result_image = Prob1(img1, img2);

% Display the original images and their histograms
figure, imshow(img1);
title('Original Image 1');
figure, histogram(img1);
title('Histogram of Image 1');

figure, imshow(img2);
title('Original Image 2');
figure, histogram(img2);
title('Histogram of Image 2');

% Display the result image and its histogram
figure, imshow(result_image);
title('Result Image');
figure, histogram(result_image);
title('Histogram of Result Image');