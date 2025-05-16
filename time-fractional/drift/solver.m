function [t,u] = solver(alpha, T, tau, lambda, f, u0)
    r = tau^(alpha);
    t = 0:tau:T;
    N = T/tau;
    c = GL(alpha, N);
    B = 1-r*lambda;
    u = zeros(N, 1);
    for n=1:N
        d = r*f(t(n+1)) + (1+sum(c(1:n-1)))*u0;
        for j=1:n-1
            d = d - u(n-j)*c(j);
        end
        u(n) = d/B;
    end
end