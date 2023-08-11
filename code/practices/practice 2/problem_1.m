clc
clear all
close all

%% Image read write
im = imread('flower.jpg');
imgray = rgb2gray(im);
imgray = imresize(imgray, 0.25);

% Define the filter
a = (1/9) * [1, 1, 1; 1, 1, 1; 1, 1, 1];
b = (1/16) * [1, 2, 1 ; 2, 4, 2 ; 1, 2, 1];

% Get the size of the image
[image_height, image_width] = size(imgray);

% Initialize the filtered images
filtered_image_a = zeros(image_height, image_width);
filtered_image_b = zeros(image_height, image_width);

% Apply the filters using correlation
for i = 2 : image_height - 1
    for j = 2 : image_width - 1
        local_region = double(imgray(i-1:i+1, j-1:j+1));
        
        correlated_pixel_a = sum(sum(local_region .* a));
        filtered_image_a(i, j) = correlated_pixel_a;
        
        correlated_pixel_b = sum(sum(local_region .* b));
        filtered_image_b(i, j) = correlated_pixel_b;
    end
end

% Convert the filtered images back to uint8 format
filtered_image_a = uint8(filtered_image_a);
filtered_image_b = uint8(filtered_image_b);

% Display the original and filtered images
subplot(1, 3, 1);
imshow(imgray);
title('Original Image');

subplot(1, 3, 2);
imshow(filtered_image_a);
title('Filtered Image (Filter a)');

subplot(1, 3, 3);
imshow(filtered_image_b);
title('Filtered Image (Filter b)');

