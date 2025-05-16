function r = randpow(alpha, n, tau)
    if nargin == 2
        n = 1;
    end
    if nargin == 1
        n = 1;
        tau =1;
    end
    u = rand(n,1);
    r = tau .* ((1-u) .^ (-1/alpha)-1);
end