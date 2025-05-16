function [t, x, varargout] = Levy(alpha, T, x0, tau)
    if nargin == 2
        x0 = 0;
        tau = 1e-2;
    elseif nargin == 3
        tau = 1e-2;
    end
    t = (0:tau:T)';
    N = length(t) - 1;
    stable_rnd = tau^(1/alpha) * random('Stable', alpha, 0, 1, 0, N, 1);
    x = x0 + cumsum([0;stable_rnd]);   
    if nargout == 3
        varargout = cell(1, 1);
        varargout{1} = stable_rnd;
    end
end