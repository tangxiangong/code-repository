% clc
% clear 
close all

loglog(t, ag, 'o')
hold on
loglog(t, 1.38*t.^(-0.15))
legend('Occupation fraction T_f', 'line Ct^{-0.15}')
xlabel('t')
ylabel('T_f')
% alpha1 = 0.6;
% alpha2 = 0.8;
% 
% t = 1d4:1d4:1d7;
% ag = zeros(length(t), 1);
% for k=1:length(t)
%     ag(k) = avg(alpha1, alpha2, t(k));
% end
% 
% 
% function ag = avg(alpha1, alpha2, t)
% M = 100000;
% a = zeros(M, 1);
% parfor i=1:M
%     a(i) = occup(alpha1, alpha2, t);
% end
% ag = mean(a)/t;
% end
% 
% function o = occup(alpha1, alpha2, t)
% a = 1;
% position = 0;
% total_time = 0;
% o = 0;
% while true
%     r = rand();
%     if r>0.5
%         state = 1;
%     else
%         state = -1;
%     end
%     if position >= 0
%         wait = powrnd(alpha1);
%         o = o + wait;
%     else
%         wait = powrnd(alpha2);
%     end
%     if total_time + wait >= t
%         if position >= 0
%             o = o - (total_time + wait - t);
%         end
%         break
%     end
%     total_time = total_time + wait;
%     position = position + state * a;
% end
% end
% % t = cumsum([0; wait])/100;
% % x = cumsum([0; jump]);
% % stairs(t,x)
