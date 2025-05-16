function [t, u] = fem(alpha, T, a, b, tau, h, f, g, mu, kappa)
    c0 = (1+mu*tau)^alpha - (mu*tau)^alpha;
    t = (0:tau:T);
    x = a:h:b;
    r = tau^(alpha);
    N = length(t)-1;
    M = length(x)-1;
    A = h*(diag(2*ones(M-1, 1)/3) + diag(ones(M-2, 1)/6, -1) + diag(ones(M-2, 1)/6, 1));
    B = (diag(2*ones(M-1, 1)) - diag(ones(M-2, 1), -1) - diag(ones(M-2, 1), 1))/h;
    c = GL(alpha, N, mu, tau);
    D = (c0+kappa*tau^(alpha-1))*A + r*B;
    u0 = zeros(M-1, 1);
    phi = cell(M-1, 1);
    for k=1:M-1
        phi{k} = @(t) (t<x(k)) * 0 + (t>x(k+2))*0 + (t >= x(k) && ...
        t<=x(k+1))*((t-x(k))/h) + (t> x(k+1) && t<=x(k+2))*((x(k+1)-t)/h);
    end
    for k=1:M-1
        u0(k) = myint_x(g, phi{k}, x(k), x(k+2));
    end
    right = zeros(M-1, N);
    for i = 1:N
        for k = 1:M-1
            right(k, i) = myint_t(f, phi{k}, t(i+1), x(k), x(k+2));
        end
    end
    
    u = zeros(M-1, N);
    for n=2:N+1
        b = A*kappa*tau^(alpha-1)*u(:, n-1)+(c0+sum(c(1:n-2)))*u0 + r*right(:, n-1);
        for j=1:n-2
            b = b - c(j)*A*u(:, n-j);
        end
        u(:, n) = D\b;
    end
end