clc
clear
close all

alpha = 0.1;
f = @(t, alpha) t .^ (4 + alpha);
a = L1_2(f, alpha, 1, 1/20);
tau = [1/10 1/20 1/40 1/80 1/160 1/320 1/640 1/1280 1/2560 1/5120];
e1 = log2(err1(tau, alpha)./err1(tau./2, alpha));
e2 = log2(err2(tau, alpha)./err2(tau./2, alpha));


plot(-log2(tau), e1)
hold on
plot(-log2(tau), 1.9*ones(1, length(tau)))
plot(-log2(tau), e2)
plot(-log2(tau), 2.9*ones(1, length(tau)))
title('L1 and L1-2 formulae of Caputo derivative, convergence orders with different temporal stepsizes \tau, \alpha = 0.1')
xlabel('$-\log_2{\tau}$', 'interpreter', 'latex')
ylabel('order')
legend({'numerical order of L1 formula', 'theoretical order of L1 formula, 2-\alpha' ... 
    'numerical order of L1-2 formula', 'theoretical order of L1-2 formula, 3-\alpha'}, ...
    'Location', 'bestoutside')

function e = err1(tau, alpha)
f = @(t, alpha) t .^ (4 + alpha);
Df = @(t, alpha) gamma(5 + alpha) .* (t .^ 4) ./ 24;
n = length(tau);
e = size(1, n);
exact = Df(1, alpha);
for k = 1:n
    e(k) = abs(exact - L1(f, alpha, 1, tau(k)));
end
end

function e = err2(tau, alpha)
f = @(t, alpha) t .^ (4 + alpha);
Df = @(t, alpha) gamma(5 + alpha) .* (t .^ 4) ./ 24;
n = length(tau);
e = size(1, n);
[exact, ~] = Df(1, alpha);
for k = 1:n
    e(k) = abs(exact - L1_2(f, alpha, 1, tau(k)));
end
end
