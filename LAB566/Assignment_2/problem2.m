clear all;
close all;
clc;

% Read the image
image = imread('udayton.jpg');

% Convert image to grayscale
gray_image = rgb2gray(image);
figure, imshow(gray_image), title("Original Image");

% Print the 10x10 matrix of grayscale image
disp('Grayscale Image (10x10 matrix):');
disp(gray_image(1:10, 1:10));

% Read compressed data from file
fid = fopen('compressed_image1.lzw', 'rb');
compressed_data = fread(fid, '*ubit32')';  % Read data in 32-bit format
fclose(fid);

% Read dictionary values from file
fid_dict = fopen('dictionary_values.txt', 'rt');
dictionary = textscan(fid_dict, 'Key: %d, Value: %s');
fclose(fid_dict);

dictionary = dictionary{2};  % Extract dictionary values

% Adjust dictionary to accommodate hyphen-separated values correctly
for i = 1:length(dictionary)
    % Split the string by hyphen and store as a cell array if necessary
    dictionary{i} = split(dictionary{i}, '-');
end

% Get the size of the original grayscale image
image_info = imfinfo('udayton.jpg');
image_height = image_info.Height;
image_width = image_info.Width;

% LZW decompression
[B, decompressed_values] = lzw_decompress(compressed_data, dictionary, image_height, image_width);

% Convert the decompressed image matrix B to uint8
B = uint8(B);

% Print the 10x10 matrix of decompressed image
disp('Decompressed Image (10x10 matrix):');
disp(B(1:10, 1:10));

figure, imshow(B), title("Decompressed Image");
