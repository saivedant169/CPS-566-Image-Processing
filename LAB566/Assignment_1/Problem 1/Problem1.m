clear all;
close all;
clc;

% Call the histogram_matching function
matched_img = histogram_matching('image1.jpg', 'image2.jpg');

% Save the matched image
imwrite(uint8(matched_img), 'matched_image.jpg');

% Read input images
img1 = imread('image1.jpg');
img2 = imread('image2.jpg');

% Compute histograms
hist1 = compute_histogram(img1);
hist2 = compute_histogram(img2);
matched_hist = compute_histogram(matched_img);

% Display histograms
figure;
subplot(3, 2, 1);
imshow(img1);
title('Image 1');
subplot(3, 2, 2);
imshow(img2);
title('Image 2');
subplot(3, 2, 3);
bar(hist1);
title('Histogram of Image 1');
subplot(3, 2, 4);
bar(hist2);
title('Histogram of Image 2');
subplot(3, 2, 5);
imshow(uint8(matched_img));
title('Matched Image');
subplot(3, 2, 6);
bar(matched_hist);
title('Histogram of Matched Image');

function hist = compute_histogram(image)
    hist = zeros(256, 1);
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            intensity = image(i, j);
            hist(intensity + 1) = hist(intensity + 1) + 1;
        end
    end
end