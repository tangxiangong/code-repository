clc
clear
close all

f = @(x, t) -x;
g = @(x, t) 1;
alpha = rand();
T = 100;
CTRW(100, 0.3, 1.5)
% x0 = 0;
% [t, x] = subordinated_Langevin(T, x0, alpha, f, g);
% plot(t, x)