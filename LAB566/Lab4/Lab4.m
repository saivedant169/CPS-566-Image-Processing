clear all;
close all;
clc;

img = imread('singapore.jpg');
figure, imshow(img);
img_gray = rgb2gray(img);
figure, imshow(img_gray);
hist = histogram(img_gray);
img_eq = histogram_equalize(img_gray, 255);
figure, hist_eq = histogram(img_eq);
figure, imshow(img_eq);

