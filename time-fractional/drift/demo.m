% f = @(x,t) 0;
% g = @(x) x.*(1-x);
% 
% a = 0;
% b = 1;
% 
% tau = 1e-2;
% h = 1e-3;
% alpha = 0.6;
% T = 3;
% [t1, x1, u1] = solver(alpha, T, a, b, tau, h, f, g);
% [t2, x2, u2] = solver(alpha, T, a, b, tau/2, h, f, g);
% [t3, x3, u3] = solver(alpha, T, a, b, tau/4, h, f, g);
clc
clear
close all
T = 10;
tau = 1e-1;
lambda = -1;
alpha = 0.3;
f = @(t) 1+t.^(alpha)/gamma(1+alpha);
u_exact = @(t) t.^(alpha)/gamma(1+alpha);

[t0,u0] = solver(alpha, T, tau, lambda, f, 0);
[t1,u1] = solver(alpha, T, tau/10, lambda, f, 0);
[t2,u2] = solver(alpha, T, tau/100, lambda, f, 0);
[t3,u3] = solver(alpha, T, tau/1000, lambda, f, 0);

e0 = abs(u_exact(T)-u0(end));
e1 = abs(u_exact(T)-u1(end));
e2 = abs(u_exact(T)-u2(end));
e3 = abs(u_exact(T)-u3(end));

log(e0/e1)/log(10)
log(e1/e2)/log(10)
log(e2/e3)/log(10)