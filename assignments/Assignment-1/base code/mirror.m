% Load the image
input_image = imread('input/penguin.jpg');

% Create the mirror image
mirror_image = zeros(size(input_image));

for row = 1:size(input_image, 1)
    mirror_image(row, :, :) = input_image(row, end:-1:1, :);
end

mirror_image = uint8(mirror_image);

% Display the input image
subplot(1, 2, 1), imshow(input_image), title('Input Image');
% Display the mirror image
subplot(1, 2, 2), imshow(mirror_image), title('Mirror Image');

% Save the result
imwrite(mirror_image, 'output/penguin_mirror_image.jpg');
