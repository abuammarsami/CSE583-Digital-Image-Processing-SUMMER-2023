clc;
clear;
close;

a = imread('D:\tuts\deepika1.jpeg');                %Read the Image
b = size(a);             

r = 0:255;                                          %Defining input pixels
d = round(scale*r)+ shift;                          %linear Transformation function

ep = zeros(b);
for i=1:b(1)                                        %loop tracing the rows of image
    for j=1:b(2)                                    %loop tracing thes columns of image
        t=(a(i,j)+1);                               %pixel values in image
        ep(i,j)=d(t);                               %Making the ouput image using 
    end                                             %the transformation function
end

%Procedure for plotting histogram

hist1 = zeros(1,256);                               %prealocation space for input histogram
hist2 = zeros(1,256);                               %prealocation space for output histogram

for i1=1:b(1)                                       %loop tracing the rows of image 
    for j1=1:b(2)                                   %loop tracing the Columns of image
        for k1=0:255                                %loop checking which graylevel
            if a(i1,j1)==k1                         %match found at k1
                hist1(k1+1)=hist1(k1+1)+1;          %increase the value at k1
            end
            if ep(i1,j1)==k1                        %for output image
                hist2(k1+1)=hist2(k1+1)+1;                
            end
        end
    end
end        
   

%Plotting input image output image and their respective histograms

subplot(2,2,1);
imshow(a);
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,2);
plot(hist1);
subplot(2,2,4);
plot(hist2);

%Plotting input image output image 

figure;
subplot(1,2,1);
imshow(a);
subplot(1,2,2);
imshow(uint8(ep));



