close all;
clear all;
clc;

img = imread('alphabet.jpg');
img = rgb2gray(img);
img = imbinarize(img);
img = imcomplement(img);
figure, imshow(img), title('orignal image');

[h,w] = size(img);
I = zeros(h,w);
num_iter = 1;

while(~isequal(I,img))
    I = img;
    for i = 2:h-1
        for j = 2:w-1
            if I(i,j) == 1
                Neighbour = [I(i-1,j-1) I(i-1,j) I(i-1,j+1) I(i,j+1) I(i+1,j+1) I(i+1,j) I(i+1,j-1) I(i,j-1), I(i-1,j-1)];
                % Number of 2-connected components
                A_p = nnz(diff(Neighbour)==1); 
                %  Number of foreground pixels
                B_p = sum(Neighbour(1:8)==1);
                if mod(num_iter,2) == 1
                % right pr bottom or north-west pixels shoul be 0
                    if A_p==1 && 2<=B_p && B_p<=6 ((I(i,j+1) * I(i+1,j)==0)||((I(i-1,j)==0 && (I(i,j-1)==0))))
                        img(i,j) = 0;
                    end
                end
            end
        end
    end
    num_iter = num_iter +1;
end

figure, imshow(img), title('After Skeletonization');

% Skeletonization using built-in function
skel = bwskel(img);
figure, imshow(skel), title('Skeletonization using built-in function');