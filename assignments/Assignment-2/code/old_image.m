clc
clear all
close all

% Load an image
im = imread('footBall_orig.jpg');

% Add salt and pepper noise 
noise_density = 0.05;  % Adjust this value to control the noise level
noisy_image = im;

% Get the image dimensions
[rows, cols, ~] = size(im);
num_pixels = rows * cols;

% Calculate the number of noisy pixels to add
num_noisy_pixels = round(noise_density * num_pixels);

% Generate random pixel coordinates for adding noise
rand_rows = randi(rows, 1, num_noisy_pixels);
rand_cols = randi(cols, 1, num_noisy_pixels);

% Add salt and pepper noise to the selected pixels
for i = 1:num_noisy_pixels
    row = rand_rows(i);
    col = rand_cols(i);
    
    % Randomly set the pixel to black or white
    if rand() < 0.5
        noisy_image(row, col, :) = 0;  % Black pixel
    else
        noisy_image(row, col, :) = 255;  % White pixel
    end
end

% Display the original and noisy images
figure;

subplot(1, 2, 1);
imshow(im);
title('Original Image');

subplot(1, 2, 2);
imshow(noisy_image);
title('Noisy Image (Old Image Effect)');
