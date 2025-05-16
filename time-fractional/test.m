clc
clear

mu = 0;
h = 0.1;
a = 0;
b = 1;
g = @(x) x*(1-x);
tau = 0.0001;
T = 1;
f = @(x, t) 0;
alpha = 0.7;
[~, u1] = fem(alpha, T, a, b, tau, h, f, g, mu);
[~, u2] = fem(alpha, T, a, b, tau, h/2, f, g, mu);
[~, u3] = fem(alpha, T, a, b, tau, h/4, f, g, mu);
% [~, u4] = fem(alpha, T, a, b, tau/8, h, f, g, mu);
% [~, u5] = fem(alpha, T, a, b, tau/16, h, f, g, mu);
% [~, u6] = fem(alpha, T, a, b, tau/32, h, f, g, mu);
e1 = max(abs(u1(:,end)-u2(2:2:end-1, end)));
e2 = max(abs(u2(:,end)-u3(2:2:end-1, end)));
% e3 = max(abs(u3(:,end)-u4(:, end)));
% e4 = max(abs(u4(:,end)-u5(:, end)));
% e5 = max(abs(u5(:,end)-u6(:, end)));
r1 = log(e1/e2)/log(2)
% r2 = log(e2/e3)/log(2)
% r3 = log(e3/e4)/log(2)
% r4 = log(e4/e5)/log(2)

% e1 = sqrt(h*sum((u1(:, end)-u2(2:2:end-1, end)).^2));
% e2 = sqrt(h*sum((u2(:, end)-u3(2:2:end-1, end)).^2)/2);
% e3 = sqrt(h*sum((u3(:, end)-u4(2:2:end-1, end)).^2)/4);
% e4 = sqrt(h*sum((u4(:, end)-u5(2:2:end-1, end)).^2)/8);
