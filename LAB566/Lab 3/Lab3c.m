clear all;
close all;
clc;

A = imread('udayton.jpg');
figure, imshow(A);
A = rgb2gray(A);