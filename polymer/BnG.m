function [t, y, varargout] = BnG(T, a, tau, alpha, beta, n_min, D0, lambda, mu, arg)
%% 扩张媒介下的布朗运动
% T: 轨迹长度
% a: 媒介扩张的函数(幂律/指数/...)
% tau: 模拟的时间步长
%
% $$D(N(t))=\frac{D_0}{(n+n_{min})^{\alpha}}$$
%
% beta: beta: =1:没有加逆从属过程; <1:加了逆从属过程
% lambda: 生灭过程的出生率
% mu: 生灭过程的死亡率
% arg: 函数a的参数
assert(alpha >= 0 && beta>0 && beta <= 1 && T > 0 ...
    && n_min >= 0 && tau>0 && D0 > 0 && lambda>0 && mu>0, ...
           "请检查参数范围, 0<alpha<1, T>0.")
t = (0:tau:T)';
N = birth_death_U(T, tau, lambda, mu);
N = N(1:end-1);
n = length(t);
D = 2*D0./(N+n_min).^(alpha);
a_vec = a(t, arg);
a_vec_t = a_vec(1:end-1);
if beta == 1
    delta_t = tau;
else
    [~, S] = inv_stable_subordinator(beta, T, tau);
    delta_t = diff(S);
end
noise = sqrt(2*delta_t).* normrnd(0, 1, n-1, 1)./a_vec_t;
x = cumsum([0;sqrt(D) .* noise]);
y = a_vec .* x;
if nargout == 3
    varargout{1} = x;
end
end
