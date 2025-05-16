clc
% clear 
close all

% tau = 0.1;
% h = 0.5;
% delta = 0.5;
% T = 1;
% a = 0;
% b = 2;
% alpha = 0.3;
% u0 = @(x) x.*(2-x);
% ul = @(t) 0;
% ur = @(t) 0;
% f = @(t,x) 0;
% 
% 
% U1 = truncted(a, b, T, h^4, h, alpha, delta, u0, ul, ur, f);
% U2 = truncted(a, b, T, (h/2)^4, h/2, alpha, delta, u0, ul, ur, f);
% U3 = truncted(a, b, T, (h/4)^4, h/4, alpha, delta, u0, ul, ur, f);
% U4 = truncted(a, b, T, (h/8)^4, h/8, alpha, delta, u0, ul, ur, f);
% U5 = truncted(a, b, T, (h/16)^4, h/16, alpha, delta, u0, ul, ur, f);
% U6 = truncted(a, b, T, (h/32)^4, h/32, alpha, delta, u0, ul, ur, f);
e1 = max(abs(U1(:, end) - U2(2:2:end-1, end)));
e2 = max(abs(U2(:, end) - U3(2:2:end-1, end)));
e3 = max(abs(U3(:, end) - U4(2:2:end-1, end))); 
e4 = max(abs(U4(:, end) - U5(2:2:end-1, end)));
% e5 = max(abs(U5(:, end) - U6(2:2:end-1, end)));
r1 = log(e1/e2)/log(2);
r2 = log(e2/e3)/log(2);
r3 = log(e3/e4)/log(2);
% log(e4/e5)/log(2)
% % U4 = truncted(a, b, T, tau/8, h, alpha, delta, u0, ul, ur, f);
% % U5 = truncted(a, b, T, tau/16, h, alpha, delta, u0, ul, ur, f);
% % U6 = truncted(a, b, T, tau/32, h, alpha, delta, u0, ul, ur, f);
% % 
% % e1 = max(abs(U1(:,end)-U2(:,end)));
% % e2 = max(abs(U2(:,end)-U3(:, end)));
% % e3 = max(abs(U3(:,end)-U4(:, end)));
% % e4 = max(abs(U4(:,end)-U5(:, end)));
% % e5 = max(abs(U5(:,end)-U6(:, end)));
% % log(e1/e2)/log(2)
% % log(e2/e3)/log(2)
% % log(e3/e4)/log(2)
% % log(e4/e5)/log(2)