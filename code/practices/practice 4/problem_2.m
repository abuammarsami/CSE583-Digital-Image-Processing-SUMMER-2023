% Load an image
input_image = imread('footBall_orig.jpg');
input_image = rgb2gray(input_image);


% Apply FFT to the input image
PQ = paddedsize(size(input_image));
fft_image=fft2(double(input_image),PQ(1),PQ(2));



% Separate real and imaginary parts of the Fourier Spectrum
real_part = real(fft_image);
imaginary_part = imag(fft_image);

% Reconstruct using both
reconstructed_image = ifft2(fft_image);
reconstructed_image = reconstructed_image(1:size(input_image,1), 1:size(input_image,2));

% Reconstruct the image using only the real part
reconstructed_real = ifft2(real_part);
reconstructed_real = reconstructed_real(1:size(input_image,1), 1:size(input_image,2));

% Reconstruct the image using only the imaginary part
reconstructed_imaginary = ifft2(imaginary_part);
reconstructed_imaginary = reconstructed_imaginary(1:size(input_image,1), 1:size(input_image,2));

% Display the input image and both reconstructions side by side
subplot(1, 4, 1);
imshow(input_image, []);
title('Input Image');

subplot(1, 4, 2);
imshow(real(reconstructed_image), []);
title('Reconstructed with both');

subplot(1, 4, 3);
imshow(real(reconstructed_real), []);
title('Reconstructed with Real Part');

subplot(1, 4, 4);
imshow(real(reconstructed_imaginary), []);
title('Reconstructed with Imaginary Part');
