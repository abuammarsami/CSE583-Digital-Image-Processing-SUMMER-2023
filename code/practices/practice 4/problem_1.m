clc
clear all
close all

A = rand(1,100);
F = fft(A);

number_of_components = round(length(F)*0.5);
F(number_of_components+1:end) = 0;


B = ifft(F);

plot((1:100), A, 'r');
hold on 
plot((1:100), B, 'b');
hold off

distance = norm(A - B);
fprintf('Euclidean Distance between Original and Reconstructed Signal: %.2f\n', distance);