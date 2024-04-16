close all;
clear all;
clc;

% Read the input image
input_image = imread('image1.jpg'); % Change the filename as needed

% Perform text recognition using OCR
results = ocr(input_image);

% Extract recognized text
recognized_text = results.Text;

% Display recognized text
disp('Recognized Text:');
disp(recognized_text);

% Visualize recognized text
figure;
imshow(input_image);
title('Input Image with Recognized Text');
text(10, 20, recognized_text, 'Color', 'red', 'FontSize', 12, 'FontWeight', 'bold');
