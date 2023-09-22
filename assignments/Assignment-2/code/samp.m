clear all;
close all;
clc;

img = imread('sketch_in.jpg');
[H, W, K] = size(img);

R = double(img(:,:,1));
G = double(img(:,:,2));
B = double(img(:,:,3));

RR = R*0.393 + G*0.769 + B*0.198;
RG = R*0.349 + G*0.686 + B*0.168;
RB = R*0.272 + G*0.534 + B*0.131;

RandR = rand() * 0.7 + 0.7;
RandG = rand() * 0.7 + 0.7;
RandB = rand() * 0.7 + 0.7;

IMGN = zeros(H, W, K);
IMGN(:,:,1) = RandR*RR + (1-RandR)*R;
IMGN(:,:,2) = RandG*RG + (1-RandG)*G;
IMGN(:,:,3) = RandB*RB + (1-RandB)*B;

figure;
imshow(uint8(IMGN));