clc;
clear all;
close all;

% Load the image
input_image = imread('footBall_orig.jpg');
input_image = rgb2gray(input_image);

% Image dimensions
[M, N] = size(input_image);

% Compute the average of the image
average_f = mean(input_image(:));

% Compute the Fourier Transform of the image
F = fft2(double(input_image));

% Retrieve the (0,0) component of the Fourier Transform
F_00 = F(1,1) / (M*N);

% Display the results
fprintf('Average of image f: %f\n', average_f);
fprintf('1/MN * F(0,0): %f\n', F_00);

% Verify the equality
if abs(average_f - F_00) == 0 
    disp('The equation is verified!');
else
    disp('The equation is not verified.');
end