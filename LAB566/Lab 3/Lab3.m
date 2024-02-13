clear all;
close all;
clc;

x = imread('newborn.png');
figure, imshow(x);
 
% x_half = imresize(x,0.5);
% figure, imshow(x_half);
% 
% x_double = imresize(x,2);
% figure, imshow(x_double);
% 
% x_half_double = imresize(x_half,2);
% figure, imshow(x_half_double);

% Dither to 4 greylevels
D = [0 56;84 28];
r = repmat(D,128,128);
x = double(x);
q = floor(x/85);
x4 = q+(x-85*q>r);
figure, imshow(uint8(85*x4));
figure, imshow(uint8(q),[]);
figure, imshow((q),[]);
