function Dfun = L1_2(func, alpha, tn, tau)
n = floor(tn / tau);
Dfun = zeros(1, n);
for k = 1:n
    A = zeros(1, k+1);
    A(1) = c(0, alpha, k);
    A(k + 1) = c(k-1, alpha, k);
    for i=2:k
        A(i) = c(k-i, alpha, k) - c(k-i+1, alpha, k);
    end
    t = tau .* (0:k);
    fk = func(t, alpha);
    Dfun(k) = tau ^ (-alpha) .* (A(1) * fk(k + 1) - A(k+1)*fk(1) -  ... 
    dot(A(2:k), fk(2:k))) ./ gamma(2-alpha);
end
end


function coe = c(j, alpha, n)
if n == 1
    coe = 1;
    return
end
if j == 0
    coe = a(0, alpha) + b(0, alpha);
elseif 1<= j && j <= n-2
    coe = a(j, alpha) + b(j, alpha) - b(j - 1, alpha);
else
    coe = a(j, alpha) - b(j - 1, alpha);
end
end


function coe = a(j, alpha)
coe = (j + 1)^(1 - alpha) - j^(1 - alpha);
end

function coe = b(j, alpha)
coe = ((j + 1)^(2 - alpha) - j^(2 - alpha))/(2 - alpha) - ...
    ((j + 1)^(1 - alpha) + j^(1 - alpha))/2;
end