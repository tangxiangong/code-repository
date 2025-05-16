clc
clear
close all

alpha1 = 0.5;
alpha2 = 0.6;
b = 10;

N = 1d5;
f = zeros(N, 1);
parfor k=1:N
f(k) = fpt(alpha1, alpha2, b);
end