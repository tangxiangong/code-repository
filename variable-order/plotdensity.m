clc
% clear
close all

X = f;
h = histogram(X, 'Normalization','probability');
t = h.BinEdges;
fp = h.Values;
close all
loglog(t(1:end-1), fp)
% tt = zeros(length(t)-1,1);
% for i=1:length(f)
%     tt(i) = (t(i) + t(i+1))/2;
% end
fp = fp(2:end);
t = t(3:end);
% loglog(t(f~=0) , f(f~=0), 'o-')
figure
loglog(t(fp~=0), fp(fp~=0))
hold on
loglog(t, t.^(-1))