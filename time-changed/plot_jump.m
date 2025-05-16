function varargout = plot_jump(t, x, args, max_continue_delta, delta_x)
    if nargin == 2
        max_continue_delta = 1;
        delta_x = diff(x);
        args = 'b-';
    elseif nargin == 3
        delta_x = diff(x);
        max_continue_delta = 1;
    end

    index = delta_x > max_continue_delta;
    temp = (1:length(t)-1)';
    jump =  temp(index);
    n_jump = length(jump);
    
    if nargout == 2
        varargout{1} = t(jump);
        varargout{2} = x(jump);
    end

%     figure()
    if n_jump == 0
        plot(t, x, args)
    else
        plot(t(1:jump(1)), x(1:jump(1)), args)
        hold on
        for k=1:n_jump-1
            plot(t(jump(k)+1:jump(k+1)), x(jump(k)+1:jump(k+1)), args);
            hold on
        end
        plot(t(jump(end)+1:end), x(jump(end)+1:end), args)
%         hold on
%         plot(t(jump), x(jump), 'or')
    end
end