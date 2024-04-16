close all;
clear all;
clc;

img = imread('text.jpg');
figure,imshow(img), title('Original');

kernel = [0,1,0; 1,1,1; 0,1,0];

% Dilation
dilated_img = imdilate(img,kernel);
figure, imshow(dilated_img), title('Dilated Image');

% Erosion
eroded_img = imerode(img,kernel);
figure, imshow(eroded_img), title('Eroded Image');

% Noise Removal
fingerprint = imread('fingerprint.jpg');
figure, imshow(fingerprint), title('Original Fingerprint');
kernel = [1,1,1; 1,1,1; 1,1,1];
open = imopen(fingerprint, kernel);
close = imclose(open, kernel);
figure, imshow(close), title('After Removing Noise');

% Boundary Extraction
img = imread('man.jpg');

figure, imshow(img), title('Original')
img_e = imerode(img, kernel);
boundary = img - img_e;
figure, imshow(boundary), title('Boundary Image')

