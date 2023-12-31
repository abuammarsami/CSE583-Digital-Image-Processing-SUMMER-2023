% Load the retinal image
image = imread('retina.jpg');

% Convert to grayscale
gray_image = rgb2gray(image);

% Threshold the grayscale image
binary_image = imbinarize(gray_image, 0.7);

% Define a structuring element for erosion (you can adjust the size)
se_ractangle = strel('rectangle',[1 3]);
se_square = strel('square', 2);


% Erode the binary image
eroded_image_rectangle = imerode(binary_image, se_ractangle);
eroded_image_square = imerode(binary_image, se_square);


subplot(1,3,1);
imshow(image);
title('Input Image');

% Display the eroded binary image
subplot(1,3,2);
imshow(eroded_image_rectangle);
title('Extracted Retina Vassel(Erode with SE of Rectangle)');


subplot(1,3,3);
imshow(eroded_image_square);
title('Extracted Retina Vassel(Erode with SE of Square)');
