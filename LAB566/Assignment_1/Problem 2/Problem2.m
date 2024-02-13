% Main file: main.m

% Read the image
img = imread('image.jpg');

% Convert the image to grayscale
grayImg = rgb2gray(img);

% Apply the median filter
windowSizeMedian = 3; % Change this to change the window size
medianFilteredImg = myMedianFilter(double(grayImg), windowSizeMedian);

% Apply the adaptive filter
windowSizeAdaptive = 3; % Change this to change the window size
adaptiveFilteredImg = myAdaptiveFilter(double(grayImg), windowSizeAdaptive);

% Display the original and filtered images
figure, imshow(grayImg), title('Original Grayscale Image');
figure, imshow(uint8(medianFilteredImg)), title('Median Filtered Image');
figure, imshow(uint8(adaptiveFilteredImg)), title('Adaptive Filtered Image');