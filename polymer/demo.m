%% MSD蒙特卡洛模拟, 不要用自己的电脑直接运行，很慢很慢
clc
clear
close all
T=1000:100:4000;
tau=1e-1; 
alpha=0.5;
n_min=3; 
D0=1; 
lambda=1;
mu=1;
arg=1;
power_expanding = @(t,r) (t+1).^r;  % 幂律扩张(arg对应于参数r)
exp_expanding = @(t,H) e.^(-H*t);   % 指数扩张(arg对应于参数H)

% M = 1d5;
% MSD = zeros(length(T),1);
% 
% for k=1:length(T)
%     % 幂律扩张
% MSD = msdExpanding(M, 100, power_expanding, tau, alpha, n_min, D0, lambda, mu, arg);
%     % 指数扩张
%     % MSD(k) = msdExpanding(M, T(k), exp_expanding, tau, alpha, n_min, D0, lambda, mu, arg);
% end

load power-expanding-r-01.mat
loglog(tt, m, 'o')
clear
load power-expanding-r-02.mat
hold on
loglog(tt, m, '>')
clear 
load power-expanding-r-03.mat
hold on
loglog(tt, m, '<')
clear 
load power-expanding-r-04.mat
hold on
loglog(tt, m, '^')
clear 
load power-expanding-r-05.mat
hold on
loglog(tt, m, '*')
clear 
load power-expanding-r-06.mat
hold on
loglog(tt, m, 's')
clear 
load power-expanding-r-07.mat
hold on
loglog(tt, m, 'd')
clear 
load power-expanding-r-08.mat
hold on
loglog(tt, m, '.')
clear 
load power-expanding-r-09.mat
hold on
loglog(tt, m, 'p')
clear 
load power-expanding-r-10.mat
hold on
loglog(tt, m, 'h')
hold on
loglog(tt, 1.3*tt, '-')
hold on
loglog(tt, 0.9*tt.^1.2, '-')
hold on
loglog(tt, 0.8*tt.^1.4, '-')
hold on
loglog(tt, 0.6*tt.^1.6, '-')
hold on
loglog(tt, 0.5*tt.^1.8, '-')
hold on
loglog(tt, 0.4*tt.^2, '-')

txt1 = 'slope=1.0';
text(tt(10), 1.8*tt(10), txt1, 'Fontsize', 14)
txt2 = 'slope=1.2';
text(tt(10), 1.3*tt(10)^1.2, txt2, 'Fontsize', 14)
txt3 = 'slope=1.4';
text(tt(10), 1.2*tt(10)^1.4, txt3, 'Fontsize', 14)
txt4 = 'slope=1.6';
text(tt(10), 0.9*tt(10)^1.6, txt4, 'Fontsize', 14)
txt5 = 'slope=1.8';
text(tt(10), 0.7*tt(10)^1.8, txt5, 'Fontsize', 14)
txt6 = 'slope=2.0';
text(tt(10), 0.6*tt(10)^2, txt6, 'Fontsize', 14)


legend('\gamma=0.1','\gamma=0.2','\gamma=0.3','\gamma=0.4','\gamma=0.5', ...
       '\gamma=0.6','\gamma=0.7','\gamma=0.8','\gamma=0.9','\gamma=1.0', 'Location','bestoutside')