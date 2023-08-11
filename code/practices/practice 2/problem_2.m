clc
clear all
close all

%% Image read write
im = imread('flower.jpg');
imgray = rgb2gray(im);
imgray = imresize(imgray, 0.6);

% Define the filter
a = (1/273) * [1, 4, 7, 4, 1; 4, 16, 26, 16, 4; 7, 26, 41, 26, 7;
               4, 16, 26, 16, 4; 1, 4, 7, 4, 1];

% Get the size of the image
[image_height, image_width] = size(imgray);

% Initialize the filtered image
filtered_image = zeros(image_height, image_width);

% Apply the filter using correlation
for i = 3 : image_height - 2
    for j = 3 : image_width - 2
        local_region = double(imgray(i-2:i+2, j-2:j+2));
        correlated_pixel = sum(sum(local_region .* a));
        filtered_image(i, j) = correlated_pixel;
    end
end

% Convert the filtered image back to uint8 format
filtered_image = uint8(filtered_image);

% Display the original and filtered images
subplot(1, 2, 1);
imshow(imgray);
title('Original Image');

subplot(1, 2, 2);
imshow(filtered_image);
title('Filtered Image (Correlation)');