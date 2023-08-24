% read the image
image = imread('flower.jpg');

% Convert the image to double precision for calculations
image = im2double(image);

% Define the mean and standard deviation of the Gaussian noise
mean_noise = 0.2;
std_deviation_noise = 0.15;

% Generate Gaussian noise
noise = std_deviation_noise * randn(size(image)) + mean_noise;

% Add the noise to the original image
noisy_image = image + noise;

% Display the input image and Gaussian noisy image
subplot(1, 2, 1);
imshow(image);
title('Input Image');

subplot(1, 2, 2);
imshow(noisy_image);
title('Output: Gaussian Noisy Image');

% Save the plot as an image
saveas(gcf, 'images_plot_problem4.png');

