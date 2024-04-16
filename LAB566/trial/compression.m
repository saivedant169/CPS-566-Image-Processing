% Close all figures, clear all variables, and clear the command window
close all;
clear all;
clc;

% Read the image from the file
image = imread('udayton-1.jpg');

% Convert the image to grayscale
grayImage = rgb2gray(image);

% Convert the grayscale image to double precision for processing
A = double(grayImage);

% Flatten A to a vector for the LZW function
inputVector = A(:);

% Call the LZW compression function
compressedData = lzw_encode(inputVector);

% Write the compressed data into a .mat file
save('compressed_data.mat', 'compressedData');