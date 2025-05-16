function varargout = LW(T, v0, waiting_distribution, args)
% [0,t]区间，速度 v0, 等待时间 指数分布或者幂律分布，args: 分布参数

    assert(ismember(waiting_distribution, ["exp", "power"]), ...
        "等待时间是指数分布(exp)或幂律分布(power)")
    if waiting_distribution == "exp"
        rnd = @exprnd;
    else
        rnd = @randpow;
    end
    wait = zeros;
    walk = zeros;
    counter = 1;
    current_time = 0;
    while true
        counter = counter + 1;
        tau = rnd(args);
        if rand() <= 0.5
            state = 1;
        else
            state = -1;
        end
        if current_time + tau < T
            wait(counter) = tau;
            walk(counter) = state * v0 * tau;
            current_time = current_time + tau;
        else
            wait(counter) = T - current_time;
            walk(counter) = state * v0 * (T-current_time);
            break
        end
    end
    
    T = cumsum(wait);
    x = cumsum(walk); 
    
    figure()
    tau = 1e-3;
    for i=1:counter-1
        tt = T(i):tau:T(i+1);
        xx = linspace(x(i),x(i+1),length(tt));
        plot(tt,xx);
        hold on
    end
    xlabel("t")
    ylabel("x")
    if waiting_distribution == "exp"
        distribution = "Exponential Distribution";
        p = "\mu = " + num2str(args);
    else
        distribution = "Power-Law Distribution";
        p = "\alpha = " + num2str(args);
    end
    str = "Lévy Walk, waiting time: " + ...
        distribution + ", " + p + ", v = " + num2str(v0);
    title(str)
    
    if nargout == 2
        varargout{1} = T;
        varargout{2} = x;
    end
end

function r = randpow(alpha, n, tau)
    if nargin == 2
        n = 1;
    end
    if nargin == 1
        n = 1;
        tau =1;
    end
    u = rand(n,1);
    r = tau .* ((1-u) .^ (-1/alpha)-1);
end