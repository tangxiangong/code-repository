function value = g(N, alpha)
    value = zeros(N, 1);
    value(1) = -alpha;
    for k = 2:N
        value(k) = (1-(alpha+1)/k)*value(k-1);
    end
end