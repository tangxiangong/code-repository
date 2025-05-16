function U = truncted_1(t,x, M, N, N_delta, tau, h, alpha, delta, u0, ul, ur, f)
    rho1 = 1/tau;
    rho2 = tau^(-alpha)/gamma(2-alpha);
    rho3 = delta^(-alpha)/gamma(1-alpha);
    rho = rho1 + rho2 - rho3;
    U = zeros(M-1, N_delta+1);
    v = coe(alpha, N);
    U(:, 1) = zeros(M-1, 1); % 初值
    for j=1:M-1
        U(j, 1) = u0(x(j+1));
    end
    A = (diag(-2*ones(M-1,1))+diag(ones(M-2,1), 1)+diag(ones(M-2,1), -1))/h^2;
    B = (diag(10*ones(M-1,1))+diag(ones(M-2,1), 1)+diag(ones(M-2,1), -1))/12;
    D = rho * B - A;
    for n=2:N_delta+1
       F = f(t(n), x(2:end-1)); 
       b = rho1*U(:, n-1)+(rho2*v(n-1)-rho3)*U(:, 1);
       for j=1:n-2
           b = b + rho2*(v(j)-v(j+1))*U(:, n-j);
       end
       b1 = B*(b + F);
       b2 = zeros(M-1, 1);
       b2(1) = -rho*ul(t(n))/12 + ul(t(n))/h^2 + rho1*ul(t(n-1))+ ...
           (rho2*v(n-1)-rho3)*u0(x(1))/12 + f(t(n), x(1))/12;
       b2(end) = -rho*ur(t(n))/12 + ur(t(n))/h^2 + rho1*ur(t(n-1))+ ...
           (rho2*v(n-1)-rho3)*u0(x(end))/12 + f(t(n), x(end))/12;
       for j=1:n-2
           b2(1) = b2(1) + rho2*(v(j)-v(j+1))*ul(t(n-j))/12;
           b2(end) = b2(end) + rho2*(v(j)-v(j+1))*ur(t(n-j))/12;
       end
       b_all = b1 + b2;
       U(:, n) = D\b_all;
    end
end

function v = coe(alpha, n)
    v = zeros(n, 1);
    for j=1:n
        v(j) = j^(1-alpha) - (j-1)^(1-alpha);
    end
end