% Load the image
input_image = imread('input/penguin.jpg');

% Convert the image to grayscale
gray_image = rgb2gray(input_image);

% Set the threshold value
threshold = 100;

% Initialize the output image
output_image = zeros(size(gray_image));

% Apply Photocopy effect
for y = 1:size(gray_image, 1)
    for x = 1:size(gray_image, 2)
        if gray_image(y, x) > threshold
            output_image(y, x) = 255;  % If pixel value > threshold, set to 255
        else
            output_image(y, x) = gray_image(y, x) * (threshold - gray_image(y, x)) / (threshold^2);
        end
    end
end

photo_copy_image = uint8(output_image);

% Display  the result
subplot(1,3, 1), imshow(input_image), title('Input Image');
subplot(1, 3, 2), imshow(gray_image), title('Grayscale Image');
subplot(1, 3, 3), imshow(photo_copy_image), title('Photocopy Image');

% Save  the result
imwrite(output_image, 'output/penguin_photocopy_image.jpg');