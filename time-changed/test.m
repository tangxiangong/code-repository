clc
clear
close all

T = 10;
tau = 1e-2;
x0 = 0;
alpha = 1.5;
beta = 0.6;
max_continuous_delta = 0.1;


[t, x, delta_x] = Levy(alpha, T, x0, tau); 
figure()
[t_jump, x_jump] = plot_jump(t, x, 'r-', max_continuous_delta, delta_x);
hold on
plot(t_jump, x_jump, 'o')
xlabel("t")
ylabel("X(t)")
title("symmetric \alpha-stable L\'{e}vy process with \alpha=" ... 
    +num2str(alpha))