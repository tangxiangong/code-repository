function U =  truncted_2_2d(U_pre, C, D, t, x, y, M, N, N_delta, tau, alpha, delta, f)
    rho1 = 1/tau;
    [X, Y] = meshgrid(x(2:end-1), y(2:end-1));
    M_x = length(x)-2;
    M_y = length(y)-2;
    rho2 = tau^(-alpha)/gamma(2-alpha);
    rho3 = delta^(-alpha)/gamma(1-alpha);
    rho = rho1 + rho2 - rho3;
    v = coe(alpha, N);
    E = rho * C - D;
    
    U = zeros(M, N+1);
    U(:, 1:N_delta+1) = U_pre;
    for n=N_delta+2:N+1
       temp = f(t(n), X, Y); 
       F = temp(:);
       b = rho1*U(:, n-1)+(rho2*v(N_delta)-rho3)*U(:, n-N_delta);
       for j=1:N_delta+1
           b = b + rho2*(v(j)-v(j+1))*U(:, n-j);
       end
       b1 = C*(b + F);
       b2 = zeros(M, 1);
       for j=1:M_x
           b2((j-1)*M_y+1) = f(t(n), x(j+1), y(1))/12;
           b2(j*M_y) = f(t(n), x(j+1), y(end))/12;
       end
%        b2(1) = -rho*ul(t(n))/12 + ul(t(n))/h^2 + rho1*ul(t(n-1))+ ...
%            (rho2*v(n-1)-rho3)*ul(t(n-N_delta))/12 + f(t(n), x(1))/12;
%        b2(end) = -rho*ur(t(n))/12 + ur(t(n))/h^2 + rho1*ur(t(n-1))+ ...
%            (rho2*v(n-1)-rho3)*ur(t(n-N_delta))/12 + f(t(n), x(end))/12;
%        for j=1:N_delta+1
%            b2(1) = b2(1) + rho2*(v(j)-v(j+1))*ul(t(n-j))/12;
%            b2(end) = b2(end) + rho2*(v(j)-v(j+1))*ur(t(n-j))/12;
%        end
       b_all = b1 + b2;
       U(:, n) = E\b_all;
    end
end

function v = coe(alpha, n)
    v = zeros(n, 1);
    for j=1:n
        v(j) = j^(1-alpha) - (j-1)^(1-alpha);
    end
end