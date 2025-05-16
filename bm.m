function varargout = bm(T, N, D)
% [0,T]时间段，分割为N个小区间，扩散系数D
tau = T/N;
noise = normrnd(0, 2*D*tau, N, 1);
B = [0; cumsum(noise)];
t = 0:tau:T;
% figure()
% plot(t, B)
% xlabel('t')
% ylabel('x')
% title("Brownian motion")
if nargout == 2
    varargout{1} = t;
    varargout{2} = B;
end
end
