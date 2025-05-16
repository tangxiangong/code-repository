function [t, E] = inverse_subordinator(alpha, T, tau)
    if nargin==2
        tau=1e-2;
    end
    t = 0:tau:T;
    N = length(t)-1;
    E = zeros(1, N+1);
    n = 1;
    while true
        [tt, S] = subordinator(alpha, n*T, tau/5);
        if S(end) > T
            break
        end
        n = 2*n;
    end
    for k=2:N+1
        temp = tt(S>=t(k));
        E(k) = temp(1);
    end
end