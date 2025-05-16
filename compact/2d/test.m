clc
clear
a=0;
b=2;
c=0;
d=2;
T = 1;
h = 0.5;
% h2 = 0.1;
tau = 0.01;
alpha = 0.4;
delta = 1;
u0 = @(x, y) x.*y.*(2-x).*(2-y);
f = @(t, x, y) t + x + y;
U1 = truncted_2d(a, b, c, d, T, h^4, h, h, alpha, delta, u0, f);
U2 = truncted_2d(a, b, c, d, T, (h/4)^4, h/2, h/2, alpha, delta, u0, f);
U3 = truncted_2d(a, b, c, d, T, (h/8)^4, h/4, h/4, alpha, delta, u0, f);

M1 = sqrt(length(U2(:, end)));
u2 = reshape(U2(:, end), M1, M1);
u2 = u2(2:2:end-1, :);
u2 = u2(:, 2:2:end-1);

M2 = sqrt(length(U3(:, end)));
u3 = reshape(U3(:, end), M2, M2);
u3 = u3(2:2:end-1, :);
u3 = u3(:, 2:2:end-1);


% U4 = truncted_2d(a, b, c, d, T, tau/8, h1, h2, alpha, delta, u0, f);
% U5 = truncted_2d(a, b, c, d, T, tau/16, h1, h2, alpha, delta, u0, f);
% U6 = truncted_2d(a, b, c, d, T, tau/32, h1, h2, alpha, delta, u0, f);
e1 = max(abs(U1(:,end)-u2(:)));
e2 = max(abs(U2(:,end)-u3(:)));
% e3 = max(abs(U3(:,end)-U4(:, end)));
% e4 = max(abs(U4(:,end)-U5(:, end)));
% e5 = max(abs(U5(:,end)-U6(:, end)));
log(e1/e2)/log(2)
% log(e2/e3)/log(2)
% log(e3/e4)/log(2)
% log(e4/e5)/log(2)