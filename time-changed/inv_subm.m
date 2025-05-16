function [t, x] = inv_subm(alpha, T, tau)
    if nargin == 2
        tau = 1e-2;
    end
    [t, E] = inv_subordinator(alpha, T, tau);
    n = length(E)-1;
    noise = normrnd(0, 1, n, 1);
    x = [0; cumsum(sqrt(diff(E)) .* noise)];
end