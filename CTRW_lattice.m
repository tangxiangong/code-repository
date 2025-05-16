function varargout = CTRW_lattice(t, tau, x0)
    N = ceil(t/tau);
    delta_t = [0, tau * ones(1,N-1), t-(N-1)*tau];
    r = rand(1,N-1);
    temp = zeros(1,N-1);
    for i=1:N-1
        if r(i) > 0.5
            temp(i) = 1;
        else
            temp(i) = -1;
        end
    end
    figure()
    delta_x = [0, x0*temp, 0];
    stairs(cumsum(delta_t), cumsum(delta_x));
    xlabel('t')
    ylabel('x')
    
    if nargout == 2
        varargout{1} = delta_t;
        varargout{2} = delta_x;
    end
end