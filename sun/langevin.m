function [t, x] = langevin(T, lambda, mu, x0, tau)
%% dx(t)=(lambda+mu)dt + dB(t), t in [0,T], x(0)=x0.
t = 0:tau:T;
N = length(t)-1;
noise = randn(1, N);
temp = [x0, (lambda+mu)*tau+tau^(1/2).*noise];
x = cumsum(temp);
end