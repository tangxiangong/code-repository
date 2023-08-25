function [N, varargout] = birth_death_U(T, tau, lambda, mu)
[tt, NN] = birth_death_T(T, lambda, mu);
t = (0:tau:T)';
n = length(t);
N = zeros(n, 1);
for k=1:length(tt)-1
    index = (t>=tt(k) & t< tt(k+1));
    N(index) = NN(k);
end
N(end) = NN(end);
if nargout == 3
    varargout{1} = tt;
    varargout{2} = NN;
end
end