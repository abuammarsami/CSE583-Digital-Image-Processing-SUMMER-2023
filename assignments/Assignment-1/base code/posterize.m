% load the image
input_image = imread('input/penguin.jpg');

% Define the number of levels for posterization
num_levels = 4;

% Get the size of the image
[height, width, channels] = size(input_image);

% Initialize the posterized image
posterized_image = zeros(size(input_image));

% Calculate the step size for each color level
step_size = 256 / num_levels;

% Loop through each pixel
for y = 1:height
    for x = 1:width
        for c = 1:channels
            % Get the original pixel value
            pixel_value = double(input_image(y, x, c));
            
            % Calculate the quantized value
            quantized_value = floor(pixel_value / step_size) * step_size;
            
            % Assign the quantized value to the color channel
            posterized_image(y, x, c) = quantized_value;
        end
    end
end

posterized_image = uint8(posterized_image);

% Display and save the result
subplot(1,2, 1), imshow(input_image), title('Input Image');
subplot(1, 2, 2), imshow(posterized_image), title('Posterize Image');
imwrite(posterized_image, 'output/penguin_posterized_image.jpg');