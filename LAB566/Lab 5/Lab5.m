close all;
clear all;
clc;

I = imread("udayton-1.jpg");
imshow(I); title('original image');
I_gray = rgb2gray(I);

level = graythresh(I_gray);
bw = im2bw(I_gray,level);
figure; imshow(bw); title('binary image');

a = bw';
a = a(:);
a = a';
a = double(a);

rle(1) = a(1);
m = 2;
rle(m) = 1;

for i = 1: length(a)-1
    if a(i) == a(i+1)
        rle(m) = rle(m) + 1;
    else
        m = m + 1;
        rle(m) = 1;
    end
end
display(rle);


