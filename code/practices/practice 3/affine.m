clc
clear all
close all

im = imread('flower.jpg'); % 108073.png flower.jpg
% im = imresize(im,.25);
im = rgb2gray(im);
im = double(im);

%% affine transformation


% A = [1 0 100    % Translation
%     0 1 10
%     0 0 1];

% A = [.8 0 1    % Sceling
%     0 1 1
%     0 0 1];

rot = 30;
A = [cosd(rot) -sind(rot) 1    % Rotation
    sind(rot) cosd(rot) 1
    0 0 1];

% A = [1 .5 1    % Shear vertical
%     0 1 1
%     0 0 1];

% A = [1 0 1    % Shear horizontal
%     .6 1 1
%     0 0 1];


out = zeros(size(im));
for r = 1 : size(im,1)
    for c = 1 : size(im,2)
        loc = A * [r c 1]'; x = round(loc(1)); y = round(loc(2));
        x = max([1 x]);
        y = max([1 y]);
        x = min([x size(im,1)]);
        y = min([y size(im,2)]);
        out(x,y) = im(r,c);
    end
end



%% Showing output
subplot(1,2,1)
imshow(mat2gray(im))
subplot(1,2,2)
imshow(mat2gray(out))