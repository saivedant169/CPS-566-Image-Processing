clear all;
clear all;
clc;

w = imread("hello.png");

%figure;

%imshow(w);

%[em,emap] = imread("emu.tif");
%figure, imshow(em);

[i,map] = imread('trees.tif');
imshow(i);
i1 = ind2rgb(i,map);
figure; imshow(i1);
i2 = ind2gray(i,map);
figure; imshow(i2)
i3 = im2bw(i,map,0.5);
figure; imshow(i3)

figure
subplot(1,3,1)
imshow(i1);
subplot(1,3,2)
imshow(i2);
subplot(1,3,3)
imshow(i3);
