function xi = skewed_stable(alpha, n)
    if nargin==1
        n=1;
    end
    assert(alpha>0 && alpha < 1)
    c = pi/2;
    W = exprnd(1, n, 1);
    gamma = -c + 2 * c * rand(n, 1);
    S1 = sin(alpha*(gamma + c));
    S2 = (cos(gamma)) .^ (1/alpha);
    S3 = cos(gamma - alpha * (gamma + c));
    S4 = (S3 ./ W) .^ ((1 - alpha) / alpha);
    xi = S4 .* S1 ./ S2;
end