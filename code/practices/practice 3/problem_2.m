% read the image
image = rgb2gray(imread('flower.jpg'));

% Convert the image to double precision for calculations
image = im2double(image);

% Define Sobel operators
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Get image dimensions
[row, col] = size(image);

% Initialize gradient arrays
gradient_x = zeros(row, col);
gradient_y = zeros(row, col);

% Apply Sobel operators for horizontal and vertical edges
for i = 2:(row-1)
    for j = 2:(col-1)
        gradient_x(i, j) = sum(sum(sobel_x .* image(i-1:i+1, j-1:j+1)));
        gradient_y(i, j) = sum(sum(sobel_y .* image(i-1:i+1, j-1:j+1)));
    end
end

% Compute the gradient magnitude
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);

% Display the input image, image after horizontal gradient, image after vertical gradient, and
% final output(image after Gradient Magnitude)
subplot(2, 2, 1);
imshow(image);
title('input Image');

subplot(2, 2, 2);
imshow(gradient_x, []);
title('Horizontal Gradient');

subplot(2, 2, 3);
imshow(gradient_y, []);
title('Vertical Gradient');

subplot(2, 2, 4);
imshow(gradient_magnitude, []);
title('Final output: Edge of the image(Gradient Magnitude)');

% Save the plot as an image
saveas(gcf, 'images_plot_problem2.png');
