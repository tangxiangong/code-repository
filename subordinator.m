function [t, S] = subordinator(alpha, T, tau)
    if nargin == 2
        tau = 1e-2;
    end
    t = (0:tau:T)';
    N = length(t) - 1;
    skewed_stable_rand = skewed_stable(alpha, N);
    delta = [0; tau^(1/alpha)*skewed_stable_rand];
    S = cumsum(delta);
end