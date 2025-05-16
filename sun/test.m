clc
clear 
close all

T = 100;
lambda = 1;
mu = 1;
x0 = 0;
tau = 0.01;
alpha = 0.9;


[t, x] = subordinated_Langevin(T, x0, alpha, lambda, mu, tau);
plot(t, x)