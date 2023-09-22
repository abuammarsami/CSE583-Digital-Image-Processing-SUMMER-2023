% Read the RGB image into MATLAB.
img = imread('night_boy.jpg');

% Create a sepia filter.
[H, W, K] = size(img);

R = double(img(:,:,1));
G = double(img(:,:,2));
B = double(img(:,:,3));

RR = R*0.189 + G*0.769 + B*0.393; % Cool tone coefficients
RG = R*0.168 + G*0.686 + B*0.349;
RB = R*0.131 + G*0.534 + B*0.272;

RandR = rand() * 0.5 + 0.5;
RandG = rand() * 0.5 + 0.5;
RandB = rand() * 0.5 + 0.5;

IMGN = zeros(H, W, K);
IMGN(:,:,1) = RandR*RR + (1-RandR)*R;
IMGN(:,:,2) = RandG*RG + (1-RandG)*G;
IMGN(:,:,3) = RandB*RB + (1-RandB)*B;

% Apply the sepia filter to the RGB image.
sepia_image = uint8(IMGN);

% Convert the noisy_image to double format
double_image = double(sepia_image);

% Separate the color channels
red_channel = double_image(:,:,1);
green_channel = double_image(:,:,2);
blue_channel = double_image(:,:,3);

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

% Apply Gaussian blur to the RGB image.
sigma = 5;  % Adjust the sigma value for the blur level.
blurred_gray_image = imgaussfilt(gradient_magnitude_rgb, sigma);

% Combine the blurred image with the original RGB image to create the glow effect.
edge_glow_image = 0.7 * gradient_magnitude_rgb + 0.3 * blurred_gray_image;

% Display the transitional steps
figure('Position', [100, 100, 1200, 400]);

subplot(2, 4, 1);
imshow(img);
title('1. Input Image');

subplot(2, 4, 2);
imshow(sepia_image);
title('2. Sepia Filter');


subplot(2, 4, 3);
imshow(gradient_magnitude_rgb);
title('3. Sobel Operator Applied Image');

subplot(2, 4, 4);
imshow(blurred_gray_image);
title('4. Blurred Image');

subplot(2, 4, 5);
imshow(edge_glow_image);
title('5. Edge Glow Effect (FInal Output)');
