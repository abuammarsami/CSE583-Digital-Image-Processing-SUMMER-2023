clc
clear all
close all

fontSize = 15;

footBall=imread('footBall_orig.jpg');
footBall=rgb2gray(footBall);

[rows, columns, numberOfColorChannels] = size(footBall);


PQ = paddedsize(size(footBall));
% F=fft2(double(footBall),PQ(1),PQ(2));


n = 5;
hz = (1/(n*n))*ones(n,n);

tic
HZ=fftshift(fft2(double(hz), PQ(1), PQ(2)));


dist = distmatrix(PQ(1), PQ(2));
dist = fftshift(dist);
HZ = double(dist <=50); % low pass
% HZ = double(dist > 50); % high pass

% Fourier transform the noisy image.
freqDomainImage = fftshift(fft2(footBall, PQ(1), PQ(2)));

% Now do filtering in the frequency domain
filteredFreqDomain = freqDomainImage .* HZ; %gaussianFreqFilter;

% Now transform back to spatial domain:
spatialImage = abs(ifft2(ifftshift(filteredFreqDomain),PQ(1), PQ(2)));
toc







