clc
clear all
close all

image = imread("lincoln.tif");
SE = strel('diamond',5);

Internal_Boundary_Extracted_Image = image - (imerode(image, SE));
External_Boundary_Extracted_Image = imdilate(image, SE) - image;

subplot(1,4,1);
imshow(image);
title("Input Image")

subplot(1,4,2);
title("Structure Element(Diamond)");
imshow(mat2gray(SE.Neighborhood));

subplot(1,4,3);
imshow(Internal_Boundary_Extracted_Image);
title("Internal Extraction");

subplot(1,4,4);
imshow(External_Boundary_Extracted_Image);
title("External Extraction");
