function varargout = inv_subordinator(alpha, T, plt1, plt2, tau)
% inverse alpha-stable subordinator
% plt1 = true or false, 是否画inverse的图
% plt2 = true or false, 是否画对应原subordinator的图
    assert(alpha > 0 && alpha < 1 && T > 0, ...
           "请检查参数范围, 0<alpha<1, T>0.")
    if nargin==2
        plt1 = true;
        plt2 = true;
        tau = 1e-3;
    end
    if nargin==4
        tau=1e-3;
    end
    [t1, S1] = subordinator(alpha, T*2, false, tau);
    ind = S1 <= T;
    t2 = t1(ind);
    S2 = S1(ind);
    S3 = [S2;T];
    t3 = [t2;t2(end)];
    if plt1
        figure()
        plot(S3,t3)
        title("inverse "+num2str(alpha)+"-stable subordinator")
        if plt2
            hold on
            plot(t3,S3)
            legend(["inverse subordinator", "subordinator"], ...
                    'Location', 'best')
        end
    end
    if nargout == 2
        varargout{1} = S3;
        varargout{2} = t3;
    end
end