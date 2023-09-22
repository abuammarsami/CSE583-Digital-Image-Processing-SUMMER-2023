clc
clear all
close all

im = imread("hist_in1.tif");
if size(im, 3) == 3
    im = rgb2gray(im);
end

% Calculate the histogram of the grayscale image
histogramOfInputImage = zeros(256,1);
for i = 1:size(im, 1)
    for j = 1:size(im, 2)
        intensity = im(i, j) + 1;
        histogramOfInputImage(intensity) = histogramOfInputImage(intensity) + 1;
    end
end

% Calculate the PDF (Probability Density Function)
pdf = histogramOfInputImage / (size(im, 1) * size(im, 2));

% Calculate the CDF (Cumulative Distribution Function) manually
cdf = zeros(256, 1);
cdf(1) = pdf(1);
for i = 2:256
    cdf(i) = cdf(i - 1) + pdf(i);
end

% Compute the new intensity values based on the CDF
new_intensity = floor(cdf / max(cdf) * 255);

% Create the equalized image using the new intensity values
equalized_image = zeros(size(im));
for i = 1:size(im, 1)
    for j = 1:size(im, 2)
        intensity = im(i, j) + 1;
        equalized_image(i, j) = new_intensity(intensity);
    end
end

% Calculate the histogram of the equalized image
histogramOfEqualizedImage = zeros(256,1);
for i = 1:size(equalized_image, 1)
    for j = 1:size(equalized_image, 2)
        intensity = equalized_image(i, j) + 1;
        histogramOfEqualizedImage(intensity) = histogramOfEqualizedImage(intensity) + 1;
    end
end

% Display the original and equalized images
figure;

subplot(2, 2, 1);
imshow(im, []);
title('Original Image');

subplot(2, 2, 2);
imshow(equalized_image, []);
title('Equalized Image');

% Display the input image's histogram
subplot(2, 2, 3);
bar(histogramOfInputImage);
title('Input Image Histogram');

% Display the equalized histogram
subplot(2, 2, 4);
bar(histogramOfEqualizedImage);
title('Equalized Histogram');