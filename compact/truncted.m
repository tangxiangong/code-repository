function U = truncted(a, b, T, tau, h, alpha, delta, u0, ul, ur, f)
t = (0:tau:T)';
x = (a:h:b)';
N_delta = delta/tau;
M = length(x)-1;
N = length(t)-1;
U_pre = truncted_1(t, x,M, N, N_delta, tau, h, alpha, delta, u0, ul, ur, f);
U = truncted_2(U_pre,t, x, M, N, N_delta, tau, h, alpha, delta, ul, ur, f);

end