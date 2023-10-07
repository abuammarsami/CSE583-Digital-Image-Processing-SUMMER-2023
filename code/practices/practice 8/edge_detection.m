clc
clear all
close all

I = imread('footBall_orig.jpg');
% I = imread('bag.png');

I = rgb2gray(I);

figure, subplot(2,2,1), imshow(I), title('Original Image');
[I_prw1,t1] = edge(I,'sobel'); % % sobel prewitt Roberts log zerocross Canny
subplot(2,2,2), imshow(I_prw1);
I_noise = imnoise(I,'gaussian');
% [I_prw2,t2] = edge(I_noise,'sobel'); % sobel prewitt Roberts log zerocross Canny
[I_prw2,t2] = edge(I_noise,'sobel');%, [], 2.5); % sobel prewitt Roberts log zerocross Canny
subplot(2,2,3), imshow(I_noise);
subplot(2,2,4), imshow(I_prw2);


% th = .5;
%
% I_bw = im2bw(I,.5);
%
% imshow(I_bw);

