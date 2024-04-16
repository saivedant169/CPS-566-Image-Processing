close all;
clear all;
clc;

filename = 'blurring.jpg';
image = imread(filename);
if size(image,3)~=1
    image = rgb2gray(image);
end
figure, imshow(image);

%Image Restoration: H first
H = fspecial('gaussian',[size(image,1),size(image,2)],20);
H = mat2gray(H);

%G second
G = fftshift(fft2(image));

%Wiener Filter
SNR = 50;
F = G.*H./(H.^2+(1/SNR));
F = ifftshift(F);
out_img_Weiner = uint8(abs(ifft2(F)));

figure, imshow(out_img_Weiner);

% Save the image to file
filename_1 = strcat(filename(1:end-4),'_restored_blurring.jpg');
imwrite(out_img_Weiner,filename_1)


