close all;
clear all;
clc;

img = imread("alphabet.jpg");
img_g = rgb2gray(img);

bw = imbinarize(img_g, 0.6);
figure, imshow(bw),title('Original Imager');

% Background should be black and foreground should be white
bw_c = imcomplement(bw);
figure, imshow(bw_c),title('Complement of Orignial Image');

[L, num] = bwlabel(bw_c, 8);
figure, imshow(L);

fprintf('There are %d letter in Alphabet. \n', num);

% Displaying individual elements in the image.
[h,w] = size(bw);
for i = 1:num
    new_img = zeros(h,w);
    [r,c] = find(L == i);
    for j = 1:length(r)
        new_img(r(j),c(j)) = 1;
    end
    figure, imshow(new_img);
end
