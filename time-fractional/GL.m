function c = GL(alpha, n, mu, tau)
    c = zeros(n, 1);
    c(1) = -alpha *(1+tau*mu)^(alpha-1);
    for k=2:n
        c(k) = (1-(1+alpha)/k)*c(k-1)/(1+mu*tau);
    end
end