function [t, N] = birth_death_N(n_step, lambda, mu)
t_p = zeros(n_step+1,1);
N = zeros(n_step+1,1);
for k = 2:n_step+1 
    if N(k-1) == 0
        mu_temp = 0;
    else
        mu_temp = mu;
    end
    t_p(k) = exprnd(1/(lambda+mu_temp));
    if rand() <= lambda/(lambda+mu_temp)
        N(k) = N(k-1)+1;
    else
        N(k) = N(k-1)-1;
    end
end
t = cumsum(t_p);
end