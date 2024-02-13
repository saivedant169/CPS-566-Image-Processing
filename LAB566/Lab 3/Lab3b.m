clear all;
close all;
clc;

x = imread('newborn.png');
figure = imshow(x);

%Dither to 8 greylevels
D = [0 24;36 12];
r = repmat(D,128,128);
x = double(x);
q = floor(x/37);
x4 = q+(x-37*q>r);
figure, imshow(uint8(37*x4));