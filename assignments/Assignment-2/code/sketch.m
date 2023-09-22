% Read the RGB image 
img = imread('footBall_orig.jpg');
figure;
subplot(2, 3, 1);
imshow(img);
title('1. Original Image');

% Create a sepia filter.
[H, W, K] = size(img);

R = double(img(:,:,1));
G = double(img(:,:,2));
B = double(img(:,:,3));

RR = R*0.189 + G*0.769 + B*0.393; % Cool tone coefficients
RG = R*0.168 + G*0.686 + B*0.349;
RB = R*0.131 + G*0.534 + B*0.272;

RandR = rand() * 0.7 + 0.7;
RandG = rand() * 0.7 + 0.7;
RandB = rand() * 0.7 + 0.7;

IMGN = zeros(H, W, K);
IMGN(:,:,1) = RandR*RR + (1-RandR)*R;
IMGN(:,:,2) = RandG*RG + (1-RandG)*G;
IMGN(:,:,3) = RandB*RB + (1-RandB)*B;

% Apply the sepia filter to the RGB image.
sepia_image = uint8(IMGN);
subplot(2, 3, 2);
imshow(sepia_image);
title('2. Sepia Filtered Image');

% Convert the sepia image to double format
noisy_image = double(sepia_image);

% Separate the color channels
red_channel = noisy_image(:,:,1);
green_channel = noisy_image(:,:,2);
blue_channel = noisy_image(:,:,3);

% Apply the Sobel operator to each color channel
sobel_x = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobel_y = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

gradient_x_red = conv2(red_channel, sobel_x, 'same');
gradient_y_red = conv2(red_channel, sobel_y, 'same');

gradient_x_green = conv2(green_channel, sobel_x, 'same');
gradient_y_green = conv2(green_channel, sobel_y, 'same');

gradient_x_blue = conv2(blue_channel, sobel_x, 'same');
gradient_y_blue = conv2(blue_channel, sobel_y, 'same');

% Compute the gradient magnitude for each channel
gradient_magnitude_red = sqrt(gradient_x_red.^2 + gradient_y_red.^2);
gradient_magnitude_green = sqrt(gradient_x_green.^2 + gradient_y_green.^2);
gradient_magnitude_blue = sqrt(gradient_x_blue.^2 + gradient_y_blue.^2);

% Combine the channels to create an RGB gradient magnitude image
gradient_magnitude_rgb = cat(3, uint8(gradient_magnitude_red), uint8(gradient_magnitude_green), uint8(gradient_magnitude_blue));

% Display the RGB gradient magnitude image
subplot(2, 3, 4);
imshow(gradient_magnitude_rgb);
title('3. Sobel operator Image');

% Convert the edge image to grayscale.
gray_image = rgb2gray(gradient_magnitude_rgb);

% Invert the grayscale image.
sketch_image = 255 - uint8(gray_image);

% Display the sketch image.
subplot(2, 3, 5);
imshow(sketch_image);
title('4. Sketch Image (Final Output)');
