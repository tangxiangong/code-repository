function FPT = FPT_LW(x, v0, waiting_distribution, args)
% Levy Walk 的首次通过时间， x 边界 
    a = x(1);
    b = x(2);
    assert(a < b)
    assert(ismember(waiting_distribution, ["exp", "power"]), ...
        "等待时间是指数分布(exp)或幂律分布(power)")
    if waiting_distribution == "exp"
        rnd = @exprnd;
    else
        rnd = @randpow;
    end
    if x(1) > 0 || x(2) < 0
        FPT = 0;
    end
    current_time = 0;
    position = 0;
    while true
       tau = rnd(args);
       if rand() <= 0.5
           state = -1;
       else
           state = 1;
       end
       delta_x = state * v0 * tau;
       temp = delta_x + position;
       if  temp >= a && temp <= b
           position = temp;
           current_time = current_time + tau;
       else
           if state == 1
               delta_t = (b-position)/v0;
           else
               delta_t = (position-a)/v0;
           end
           current_time = current_time + delta_t;
           break
       end
    end
    FPT = current_time;
end