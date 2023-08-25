function m = EATAMSD(M, T, delta, a, alpha, beta, n_min, D0, lambda, mu, arg)
h = 1e-3;
t = (0:h:T)';
index1 = t>=0 & t<=T-delta;
index2 = t>=delta & t<=T;
a_vec = a(t, arg);
a_vec1 = a_vec(index1);
a_vec2 = a_vec(index2);
M = [0;EAMSD(M, t(2:end), a, h/5, alpha, beta, n_min, D0, lambda, mu, arg)];
M1 = M(index1);
M2 = M(index2);
temp = (M2(1)+M2(end)+(1-2*a_vec2(end)/a_vec1(end))*M1(end))/2;
m = sum(M2 + (1-2*a_vec2./a_vec1).* M1)-temp;
m = h*m/(T-delta);
end