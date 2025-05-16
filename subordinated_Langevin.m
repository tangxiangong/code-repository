function [t, x]=subordinated_Langevin(T, x0, alpha, f, g, tau)
    if nargin==5
        tau = 1e-2;
    end
    [t, E] = inverse_subordinator(alpha, T, tau);
    N = length(t);
    x = zeros(N, 1);
    x(1) = x0;
    normal_rand = normrnd(0, 1, N-1);
    for k=2:N
        delta_t = E(k)-E(k-1);
        x(k) = x(k-1) + f(x(k-1), E(k-1)) * delta_t + ...
            g(x(k-1), E(k-1))*(delta_t)^(1/2)*normal_rand(k-1);
    end
%     t_bar = (0:tau2:T)';
%     N2 = length(t_bar);
%     x_bar = zeros(N2, 1);
%     x_bar(1) = x0;
%     normal_rnd = normrnd(0,1,N2-1);
%     for k=2:N2+1
%         x_bar(k) = x_bar(k-1)+f(x_bar(k-1), t_bar(k-1))*tau2 + ...
%             g(x_bar(k-1), t_bar(k-1))*sqrt(tau2)*normal_rnd(k-1);
%     end
%     N1 = length(t);
%     x = zeros(N1, 1);
%     idx = 1:N2;
%     x(1) = x0;
%     for k=2:N1
%         temp = idx(t_bar >= E(k));
%         j = temp(1);
%         x(k) = (x_bar(j)-x_bar(j-1))*(E(k)-t_bar(j-1))/tau2 + x_bar(j-1);
%     end
end