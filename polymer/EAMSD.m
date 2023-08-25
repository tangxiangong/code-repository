function m=EAMSD(M, T, a, tau, alpha, beta, n_min, D0, lambda, mu, arg)
%% 蒙特卡洛模拟MSD, 需使用并行计算的工具箱
T_max = T(end);
m = zeros(length(T), 1);
n = ceil(T(end)/tau);
index = 1+ceil(n*T/T_max);
parfor k=1:M
    [~, B] = BnG(T_max, a, tau, alpha, beta, n_min, D0, lambda, mu, arg);
    m = m + (B(index)).^2;
end
m=m/M;
end