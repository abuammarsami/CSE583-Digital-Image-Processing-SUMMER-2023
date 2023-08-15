% Load the image
input_image = imread('input/penguin.jpg');

% Calculate center pixel and maximum distance
center_x = size(input_image, 2) / 2;
center_y = size(input_image, 1) / 2;
max_distance = sqrt(center_x^2 + center_y^2);

% Initialize the vignette image
vignette_image = zeros(size(input_image));

% Apply Vignetting effect
for row = 1:size(input_image, 1)
    for col = 1:size(input_image, 2)
        distance = sqrt((col - center_x)^2 + (row - center_y)^2);
        darkness_weight = 1 - distance / max_distance;
        vignette_image(row, col, :) = input_image(row, col, :) * darkness_weight;
    end
end

vignette_image = uint8(vignette_image);

% Display the input image
subplot(1, 2, 1), imshow(input_image), title('Input Image');

% Display the vignette image
subplot(1, 2, 2), imshow(vignette_image), title('Vignette Effect');


% Save the result
imwrite(vignette_image, 'output/penguin_vignette_image.jpg');
