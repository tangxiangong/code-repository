function U = truncted_2d(a, b, c, d, T, tau, h1, h2, alpha, delta, u0,f)
t = (0:tau:T)';
x1 = (a:h1:b);
x2 = (c:h2:d);
N_delta = delta/tau;
M_x = length(x1)-2;
M_y = length(x2)-2;
M = M_x * M_y;
A_y = (diag(-2*ones(M_y,1))+diag(ones(M_y-1,1), 1)+diag(ones(M_y-1,1), -1))/h2^2;
B_y = (diag(10*ones(M_y,1))+diag(ones(M_y-1,1), 1)+diag(ones(M_y-1,1), -1))/12;
A_x = (diag(-2*ones(M_x,1))+diag(ones(M_x-1,1), 1)+diag(ones(M_x-1,1), -1))/h1^2;
B_x = (diag(10*ones(M_x,1))+diag(ones(M_x-1,1), 1)+diag(ones(M_x-1,1), -1))/12;
C = kron(B_x, B_y);
D = kron(B_x, A_y) + kron(A_x, B_y);
N = length(t)-1;
U_pre = truncted_1_2d(C, D, t, x1, x2, M, N, N_delta, tau, alpha, delta, u0, f);
U = truncted_2_2d(U_pre, C, D, t, x1, x2, M, N, N_delta, tau, alpha, delta, f);

end