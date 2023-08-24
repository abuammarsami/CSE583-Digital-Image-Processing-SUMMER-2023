% Load a grayscale image
image = imread('tiger.png');

% Convert the image to double precision for calculations
image = im2double(image);

% Get image dimensions
[row, col] = size(image);

% Initialize filtered_image arrays
median_filtered_image = zeros(row, col);
min_filtered_image = zeros(row, col);
max_filtered_image = zeros(row, col);

% Define neighborhood size
neighborhood_size = 3;

% Apply filters
for i = 1:row
    for j = 1:col
        % Define neighborhood boundaries
        row_start = max(1, i - floor(neighborhood_size/2));
        row_end = min(row, i + floor(neighborhood_size/2));
        col_start = max(1, j - floor(neighborhood_size/2));
        col_end = min(col, j + floor(neighborhood_size/2));
        
        % Extract neighborhood
        neighborhood = image(row_start:row_end, col_start:col_end);
        
        % Apply median filter
        median_filtered_image(i, j) = median(neighborhood(:));
        
        % Apply minimum filter
        min_filtered_image(i, j) = min(neighborhood(:));
        
        % Apply maximum filter
        max_filtered_image(i, j) = max(neighborhood(:));
    end
end

% Display the original image and filtered images
figure;

subplot(2, 2, 1);
imshow(image);
title('Original Image');

subplot(2, 2, 2);
imshow(median_filtered_image);
title('Median Filtered Image');

subplot(2, 2, 3);
imshow(min_filtered_image);
title('Minimum Filtered Image');

subplot(2, 2, 4);
imshow(max_filtered_image);
title('Maximum Filtered Image');

% Save the plot as an image
saveas(gcf, 'filtered_images_plot_problem1.png');
