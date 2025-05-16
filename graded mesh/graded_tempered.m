function [t, x, u] = graded_tempered(alpha, mu, T, a, b, N, h, r, phi, f)
M = ceil((b-a)/h);
u = zeros(M-1, N+1);
x = a:h:b;
t = T*((0:N)/N).^(r);
tau = diff(t);
u0 = phi(x(2:end-1));
u(:, 0) = u0;
A = (diag(-2*ones(M-1,1))+diag(ones(M-2, 1), 1)+diag(ones(M-2, 1), -1))/h^2;
for n=2:N+1
    c = graded_coe(alpha, mu, tau);
    rhs = f(t(n), x(2:end-1));
    for k=1:n-1
        rhs = rhs + c(k)*u(:, k);
    end
    M = c(n)*eye(M-1) - A;
    u(:, n) = M\rhs;
end
end