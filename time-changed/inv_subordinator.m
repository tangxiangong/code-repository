function [t, invS, varargout] = inv_subordinator(alpha, T, tau)
    assert(alpha > 0 && alpha < 1 && T > 0, ...
           "请检查参数范围, 0<alpha<1, T>0.")
    if nargin==2
        tau = 1e-2;
    end
    
    [t_temp, s_temp] = subordinator(alpha, T, tau);
    temp = 1;
    while s_temp(end) < T
        [t_temp, s_temp] = subordinator(alpha, 2^temp*T, tau);
        temp = temp + 1;
    end
    index = s_temp <= T;
    t_temp_t = t_temp(index);
    s_temp_t = s_temp(index);

    n = length(t_temp_t)-1;

    t = (0:tau:T)';
    invS = zeros(length(t), 1);
    index = t<= s_temp_t(1);
    invS(index) = t_temp_t(1);
    for k=1:n
        index = (t>s_temp_t(k) & t<= s_temp_t(k+1));
        invS(index) = t_temp_t(k+1);
    end
    index = t>s_temp_t(end);
    invS(index) = t_temp(n+2);

    if nargout == 4
        varargout{1} = t_temp;
        varargout{2} = s_temp;
    end
end