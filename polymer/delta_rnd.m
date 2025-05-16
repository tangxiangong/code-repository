function [r, theta, phi] = delta_rnd(b, n)
    % 生成球面上的均匀分布随机数
    phi = 2 * pi * rand(n, 1);
    theta = pi * rand(n, 1);
    x = b .* sin(theta) .* cos(phi);
    y = b .* sin(theta) .* sin(phi);
    z = b .* cos(theta);
    r = [x y z];
end