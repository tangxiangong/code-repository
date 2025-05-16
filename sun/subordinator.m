function [t, S] = subordinator(alpha, T, tau)
    if nargin == 2
        tau = 1e-2;
    end
    t = 0:tau:T;
    N = length(t) - 1;
    rnd = skewed_stable_rnd(alpha, N);
    delta = [0, tau^(1/alpha)*rnd'];
    S = cumsum(delta);
end