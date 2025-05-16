function Dfunc = L1(func, alpha, tn, tau)
n = floor(tn / tau);
Dfunc = zeros(1, n);
for k = 1:n
    A = zeros(1, k);
    for i=1:k-1
        A(i) = a(k-i-1, alpha) - a(k-i, alpha);
    end
    A(k) = a(k-1, alpha);
    t = tau .* (0:k);
    fk = func(t, alpha);
    Dfunc(k) = tau ^ (-alpha) .* (fk(k + 1) - A(k)*fk(1) -  ... 
    dot(A(1:k-1), fk(2:k))) ./ gamma(2-alpha);
end
end

function coe = a(j, alpha)
coe = (j + 1) .^ (1 - alpha) - j .^ (1 - alpha);
end