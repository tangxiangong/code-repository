function t = fpt(alpha1, alpha2, b)

a = 0.1;
position = 0;
total_time = 0;
o = 0;
while true
    r = rand();
    if r>0.5
        state = 1;
    else
        state = -1;
    end
    if position >= b
        wait = powrnd(alpha2);
        o = o + wait;
    else
        wait = powrnd(alpha1);
    end
    if position >= b
        t = total_time + wait;
        break
    end
    total_time = total_time + wait;
    position = position + state * a;
end
end



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
