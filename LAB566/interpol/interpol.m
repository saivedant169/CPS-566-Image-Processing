close all;
clear all;
clc;

im = imread('udayton-2.jpg');
im_gray = rgb2gray(im);
im2 = imresize(im_gray,[800,800],"bicubic");
im3 = imresize(im_gray,[800,800],"nearest");
im4 = imresize(im_gray,[800,800],"bilinear");

figure, imshow(im2);
figure, imshow(im3);
figure, imshow(im4);
