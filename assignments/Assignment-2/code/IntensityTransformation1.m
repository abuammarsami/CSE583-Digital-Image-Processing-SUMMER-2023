clc
clear all
close all

%% Image read write
im = imread('flower.jpg');
imgray = rgb2gray(im); %  0.299 * R + 0.587 * G + 0.114 * B

% im_tras = imgray;
% for i = 1 : size(imgray,1)
%     for j = 1 : size(imgray,2)
%         im_tras(i,j) = 255 - imgray(i,j);
%     end
% end
% subplot(1,2,1)
% imshow(imgray)
% subplot(1,2,2)
% imshow(mat2gray(im_tras))


% count = randi([1 100],1,256);
% % count = [1:256];
% bar(count)



im = imread("histeq_in.tif");
% imhist(im)


%% Histogram or Contrast Stretching
% stretch_im = zeros(size(im));
% output_start = 0;
% output_end = 255;
% input_start = min(min(im));
% input_end = max(max(im));
% for i = 1 : size(im,1)
%     for j = 1 : size(im,2)
%         pixel = im(i,j);
%         input = pixel;
%         stretch_im(i,j) = output_start + ((output_end - output_start) / ...
%         (input_end - input_start)) * (input - input_start);
%     end
% end
% subplot(1,2,1)
% imshow(im)
% subplot(1,2,2)
% imshow(uint8(stretch_im))
% figure, imhist(uint8(stretch_im))
% figure, imhist(im)

% Histogram equalization
imhist(im);
subplot(2,2,1);
imshow(mat2gray(im));
subplot(2,2,2);

imshow(histeq(im));
subplot(2,2,3);
plot(imhist(im));
subplot(2,2,4);
plot(imhist(histeq(im)));