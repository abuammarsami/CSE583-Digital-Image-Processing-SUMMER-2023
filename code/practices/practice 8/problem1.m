clc
clear all
close all

Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 28 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

I = imread('peppers.png'); % saturn peppers
ImageSize = 8 * 3 * size(I, 1) * size(I, 2);
Y_d = rgb2ycbcr(I);
% Downsample:
Y_d(:, :, 2) = round(Y_d(:, :, 2) / 2);
Y_d(:, :, 3) = round(Y_d(:, :, 3) / 2);

% DCT compress:
A = zeros(size(Y_d));

zscan = zeros(3*size(I,1)*size(I,2),1);
st = 1;
for channel = 1:3
    for j = 1:8:size(Y_d,1)-7
        for k = 1:8:size(Y_d,2)-7
            II = Y_d(j:j+7,k:k+7,channel);
            
            freq = dct2(II);
            freq = round(freq./Q);
            
            zscan(st:st+63) = zigzag(freq);
            st = st + 64;
            
        end
    end
end

rle_zscan = rle(zscan);
b = rle_zscan;

symbols = unique(b);
prob = [histc(b,symbols)]/length(b);
dict = huffmandict(symbols, prob);
enco = huffmanenco(b, dict);
FinalCompressedImage = length(enco);

compression_ratio = ImageSize/FinalCompressedImage;
inv_compression_ratio = 1/compression_ratio;
redundancy = 1 - 1/compression_ratio;


%%%% Decoding

% Decode Huffman
b_decoded = huffmandeco(enco, dict);

% Run-length decoding
rle_decoded = irle(b_decoded);

% Create a new array for the DCT coefficients
newY_d = zeros(size(I));

% Apply the inverse DCT and dequantization
st = 1;
for channel = 1:3
    for j = 1:8:size(newY_d, 1) - 7
        for k = 1:8:size(newY_d, 2) - 7
            % Apply izigzag on what you get from irle to produce an 8x8 block
            freq_decoded = izigzag(rle_decoded(st:st + 63), 8, 8);
            st = st + 64;

            % Apply dequantization
            freq_decoded = freq_decoded .* Q;

            % Apply idct2
            II = idct2(freq_decoded);

            % Fill newY_d(j:j+7,k:k+7,channel)
            newY_d(j:j + 7, k:k + 7, channel) = II;
        end
    end
end




% Upsample Cb and Cr Components
newY_d(:,:,2) = newY_d(:,:,2) * 2;
newY_d(:,:,3) = newY_d(:,:,3) * 2;

% Visualize the Reconstructed Image (Uncomment to visualize)
subplot(1, 2, 1);
imshow(I);
title('Original');
subplot(1, 2, 2);
imshow(ycbcr2rgb(uint8(newY_d)));
title('Compressed');


