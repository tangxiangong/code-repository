clc
% clear 
close all

[t, x] = CTRW(5, 1, 2);
% t = t(1:end-1);
% x = x(1:end-1);
stairs(t, x, '--k', 'LineWidth', 1.3)
hold on
plot(t(1:end-1), x(1:end-1), '.r', 'MarkerSize', 21);
param = struct('XLabel', '$t$', 'YLabel', '$x$', 'OLabel', '$O$');
DrawAxisWithArrow(gca, param);
xticks(t(1:end-1))
yticks([])
% set(gca, 'XAxisLocation', 'origin')
% set(gca, 'xticklabel', [])
% set(gca, 'yticklabel', [])