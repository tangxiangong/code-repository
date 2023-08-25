function [t, N] = birth_death_T(T, lambda, mu)
[t_n, N_n] = birth_death_N(2*ceil(T), lambda, mu);
count = 1;
while t_n(end) < T
    count = count + 1;
    [t_n, N_n] = birth_death_N(2^(count)*ceil(T), lambda, mu);
end
index = t_n <= T;
t_temp = t_n(index);
N_temp = N_n(index);
if t_temp(end) < T
    t = [t_temp; T];
    N = [N_temp; N_temp(end)];
else
    t = t_temp;
    N = N_temp;
end
end