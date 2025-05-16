function B = Brown(tt)
    n = length(tt);
    noise = zeros(n-1, 1);
    for i = 1:n-1
        noise(i) = normrnd(0, sqrt(2*(tt(i+1)-tt(i))));
    end
    B = [0; cumsum(noise)];
end