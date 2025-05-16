function r = gc(b, n)
    % 高斯链
    mu = [0 0 0];
    sigma = b * b * eye(3)/3; % 协方差矩阵
    delta_r = [0 0 0; mvnrnd(mu, sigma, n)];
    r = cumsum(delta_r);
end