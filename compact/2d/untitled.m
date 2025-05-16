clc
clear

[~, x1, y1, U1] = graded_solver(T, a, b, c, d, alpha, sigma, r, N1, N2, N, u0);
U1 = reshape(U1(:, end), length(x1)-2, length(y1)-2);
[~, x2, y2, U2] = graded_solver(T, a, b, c, d, alpha, sigma, r, 2*N1, 2*N2, N, u0);
U2 = reshape(U2(:, end), length(x2)-2, length(y2)-2);
U2 = U2(2:2:end-1, 2:2:end-1);
e = max(max(abs(U1-U2)));


% h1 = 0.2;
% h2 = 0.4;
% x = 0:h1:10;
% y = 0:h2:5;
% [X, Y] = meshgrid(x(2:end-1), y(2:end-1));
% 
% 
% u = @(x, y) x.^2 + y.^2;
% 
% r1 = u(X,Y);
% r1 = r1(:);
% r1 = reshape(r1, size(X));
% 
% x = 0:h1/2:10;
% y = 0:h2/2:5;
% [X, Y] = meshgrid(x(2:end-1), y(2:end-1));
% r2 = u(X,Y);
% r2 = r2(:);
% r2 = reshape(r2, size(X));
% r3 = r2(2:2:end-1, 2:2:end-1);