function [t, S, varargout] = subordinator(alpha, T, tau)
    assert(alpha > 0 && alpha < 1 && T > 0)
    if nargin==2
        tau=1e-2;
    end
    
    t = (0:tau:T)';
    n = length(t) - 1;
    rnd = tau^(1/alpha) * skewed_stable(alpha, n);
    S = [0; cumsum(rnd)];
    if nargout == 3
        varargout = cell(1, 1);
        varargout{1} = rnd;
    end
end
