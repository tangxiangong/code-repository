function r = frc(theta, b, n)
    % 自由旋转链
    delta_r = zeros(n+1, 3);
    phi = 2 * pi * rand(n, 1);
    m = eye(3);
    for i=2:n+1
        m = m * rotate_matrix(theta, phi(i-1));
        delta_r(i, :) = m * [0; 0; b]; % 全局坐标
    end
    r = cumsum(delta_r);
end