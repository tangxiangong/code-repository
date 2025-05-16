function [t, x] = subm(alpha, T, tau)
    if nargin == 2
        tau = 1e-2;
    end
    [t, S] = subordinator(alpha, T, tau);
    n = length(S)-1;
    noise = normrnd(0, 1, n, 1);
    x = [0; cumsum(sqrt(diff(S)) .* noise)];
end