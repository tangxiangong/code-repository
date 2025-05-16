function r = fjc(b, n)
    % 自由连接链，即随机游走
    [delta_r, ~, ~] = delta_rnd(b, n);
    r = [0 0 0; cumsum(delta_r)];
end