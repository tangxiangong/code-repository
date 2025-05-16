function r = powrnd(alpha, n, tau)
% 生成时间幂律分布的随机数
    if nargin == 2
        tau = 1;
    elseif nargin == 1
        n = 1;
        tau = 1;
    end
    u = rand(n,1);
    r = tau .* ((1-u) .^ (-1/alpha)-1);
end