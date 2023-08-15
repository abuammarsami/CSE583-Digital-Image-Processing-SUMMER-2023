% Load the image
input_image = imread('input/penguin.jpg');

% Extract the individual color channels
red_channel = input_image(:, :, 1);
green_channel = input_image(:, :, 2);
blue_channel = input_image(:, :, 3);


% Display the input image
subplot(2, 3, 1), imshow(input_image), title('Input Image');

% Apply Nightvision transformation
output_red = green_channel / 2;

% Combine the modified channels to create the intermediate nightvision image
intermediate_nightvision_image = cat(3, output_red, green_channel, blue_channel);

% Display the intermediate nightvision image
subplot(2, 3, 2), imshow(intermediate_nightvision_image), title('Intermediate - Green Enhanced');

% Apply Nightvision transformation
output_blue = 2 * output_red;

% Combine the modified channels to create the intermediate nightvision image
intermediate_nightvision_image = cat(3, output_red, output_blue, blue_channel);

% Display the intermediate nightvision image
subplot(2, 3, 3), imshow(intermediate_nightvision_image), title('Intermediate - Blue Enhanced');

% Apply Nightvision transformation
output_green = 2 * output_blue;

% Combine the modified channels to create the final nightvision image
nightvision_image = cat(3, output_red, output_green, output_blue);

% Display the final nightvision image
subplot(2, 3, 4), imshow(nightvision_image), title('Final Nightvision Image');

% Save the result
imwrite(nightvision_image, 'output/penguin_nightvision_image.jpg');