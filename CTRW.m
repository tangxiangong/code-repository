function varargout = CTRW(t, alpha, beta)
% 连续时间随机游走模拟
%
% 输入: alpha, 等待时间的指标. 0<alpha<1时, 等待时间服从一阶矩发散的幂律分布;
% alpha = 1时, 服从一阶矩收敛的指数分布. 默认为1.
%      beta, 跳跃步长的指标. 0<beta<2时, 跳跃步长服从二阶矩发散的beta稳定分布, 
% 即幂律分布; beta = 2时, 服从二阶矩收敛的正态分布. 默认为2.
%      t, 时间, 生成[0,t]时间段内的轨迹. 默认为100.
%
% 输出: 等待时间和跳跃步长向量.
%
% 例子: 1. CTRW(), 生成[0,100]的等待时间为指数分布, 跳跃步长为标准正态分布的轨迹;
%      2. CTRW(t), 生成[0,t]的等待时间为指数分布, 跳跃步长为标准正态分布的轨迹;
%      3. CTRW(t, alpha, beta), 生成[0,t]的轨迹, 等待时间和跳跃步长的指标分别是
% alpha 和 beta.

    if nargin == 0
        t = 100;
        alpha = 1;
        beta = 2;
        
    elseif nargin == 1
        alpha = 1;
        beta = 2;
    end
    assert(t > 0 && alpha > 0 && alpha <= 1 && beta > 0 && beta <= 2, ...
    "请检查参数是否符合 t>0, 0<alpha<=1, 0<beta<=2."); 
    
    if alpha == 1
        waiting_time = @(x) exprnd(x); % 这种情况下alpha就变成了指数分布的参数.
    else
        waiting_time = @(x) powrnd(x);
    end
    
    jump_length = @(x) random('Stable', x, 0, 1, 0);
        
    total_time = 0;
    counter = 1;
    delta_t = zeros;
    delta_x = zeros;
    
    while true
        tau = waiting_time(alpha);
        if total_time + tau > t
            delta_t(counter + 1) = t-total_time;
            delta_x(counter + 1) = 0;
            break
        else
            counter = counter + 1;
            delta_t(counter) = tau;
            delta_x(counter) = jump_length(beta);
            total_time = total_time + tau;
        end
    end
    
    delta_t = delta_t(1:counter+1);
    delta_x = delta_x(1:counter+1);
    
    t = cumsum(delta_t);
    x = cumsum(delta_x);
%     figure()
%     stairs(t,x)
%     xlabel('t')
%     ylabel('x')
%     title("Continuous Time Random Walk, waiting time  \alpha=" ...
%           + num2str(alpha) + ", jump length \beta=" + num2str(beta))
%     
    if nargout == 2
        varargout{1} = t;
        varargout{2} = x;
    end
end

function r = powrnd(alpha, n, tau)
% 生成时间幂律分布的随机数
    if nargin == 2
        tau = 1;
    elseif nargin == 1
        n = 1;
        tau = 1;
    end
    u = rand(n,1);
    r = tau .* ((1-u) .^ (-1/alpha)-1);
end
