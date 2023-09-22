clc;
clear;
close all;

% Load the image
inputImage = imread('footBall_orig.jpg');
if size(inputImage, 3) == 3
    inputImage = rgb2gray(inputImage);
end

% Apply the Sobel operator to get the gradient magnitude and direction.
gx = [-1 0 1; -2 0 2; -1 0 1];
gy = [-1 -2 -1; 0 0 0; 1 2 1];

gradientX = conv2(double(inputImage), gx, 'same');
gradientY = conv2(double(inputImage), gy, 'same');

gradientMagnitude = sqrt(gradientX.^2 + gradientY.^2);

% Perform Fourier Transform on the gradient magnitude image.
fftGradientMagnitude = fft2(gradientMagnitude);

% Create a high-pass filter in the frequency domain to for the edge
% detection
[n, m] = size(fftGradientMagnitude);
radius = 20; %this control the strength and characteristics of the high-pass filtering effect.
highPassFilter = ones(n, m);
center = [ceil(n/2), ceil(m/2)];
for i = 1:n
    for j = 1:m
        if sqrt((i - center(1))^2 + (j - center(2))^2) <= radius
            highPassFilter(i, j) = 0;
        end
    end
end

% Apply the high-pass filter in the frequency domain.
filteredFFT = fftGradientMagnitude .* highPassFilter;

% Perform Inverse Fourier Transform to obtain the final edge-detected image.
filteredImage = ifft2(filteredFFT);

% Display the original and edge-detected images.
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Original Image');

subplot(1, 2, 2);
imshow(abs(filteredImage), []);
title('Edge-Detected Image');
