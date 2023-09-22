clc
clear all
close all

% Load the image and convert to grayscale
inputImage = imread('footBall_orig.jpg');
inputImage = rgb2gray(inputImage);

% Define the convolution filter.
n = 21;
f = (1/(n*n)) * ones(n, n);

% Get the size of the input image.
[height, width] = size(inputImage);

% Get the size of the filter.
[fHeight, fWidth] = size(f);

% Initialize the output image.
outputImage = zeros(height, width);
tic
% Apply convolution manually using loops.
for y = 1:height
    for x = 1:width
        % Compute the sum of element-wise multiplication between the filter and the image region.
        convolutionSum = 0;
        for fy = 1:fHeight
            for fx = 1:fWidth
                % Handle boundary conditions by zero-padding.
                imgY = y - ceil(fHeight / 2) + fy;
                imgX = x - ceil(fWidth / 2) + fx;
                
                if imgY >= 1 && imgY <= height && imgX >= 1 && imgX <= width
                    convolutionSum = convolutionSum + f(fy, fx) * double(inputImage(imgY, imgX));
                end
            end
        end
        % Assign the result to the output image.
        outputImage(y, x) = convolutionSum;
    end
end
toc
% Display the input and output images.
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Input Image');

subplot(1, 2, 2);
imshow(uint8(outputImage));
title('Convolved Image');
