function error=convergence_BDF2(r,M)
%%%%%%%%%%%second order
format short e
N=40;

u=zeros(N+1,M+1);
u_coarse=zeros(N+1,M+1);
u_exact=zeros(N+1,M+1);

[D,x] = cheb(N);
D2 = D^2;
D2 = D2(2:N,2:N); 

t(1) =(1/M)^r;
tau(1)=t(1);

for k = 1 : N+1
    u(k,1)	=  initial_valueU(x(k),0);
    u(k,2)  = initial_valueU(x(k),t(1));
end

%boundary condition
u(1,2:M+1)=0;%边界条件
u(N+1,2:M+1)=0;%边界条件



for nstep=2: M
    t(nstep) =(nstep./M).^r;%%%%%网格剖分！%%%%%%
    tau(nstep)=t(nstep)-t(nstep-1);%%%%%步长！%%%%%%
 for i = 2 : N  
I=eye(N-1);%%%% N-1维乘N-1维的单位矩阵%%%%%%%
A=(tau(nstep-1)+2*tau(nstep))./(  tau(nstep)*(tau(nstep)+tau(nstep-1))  )*I-D2;
f(i)=(tau(nstep)+tau(nstep-1))./( tau(nstep)*tau(nstep-1) )*u(i,nstep)-tau(nstep)./( tau(nstep-1)*(tau(nstep)+tau(nstep-1)) )*u(i,nstep-1) ...
    + sourcef(x(i),t(nstep));
 end   
 u(2:N,nstep+1)=linsolve(A,f(2:N)');
end


% for nstep=2: M
%     t(nstep) =(nstep./M).^r;
%     tau(nstep)=t(nstep)-t(nstep-1);
%     w(nstep)=tau(nstep)./tau(nstep-1);
%  for i = 2 : N  
% I=eye(N-1);
% a=1+2*w(nstep);
% b=tau(nstep)*(1+w(nstep));
% A=a*I-b*D2;
%     f(i)=a*u(i,nstep)+w(nstep)^2*(u(i,nstep)-u(i,nstep-1) )+b*( 3*t(nstep).^2.*sin(pi*x(i))+pi^2*(t(nstep).^3+1).*sin(pi*x(i))   );
%  end
%     u(2:N,nstep+1)=linsolve(A,f(2:N)');
% end

for  i =2:N
  u_coarse(i,nstep+1) = u(i,nstep+1);
  u_exact(i,nstep+1) = initial_valueU(x(i),t(nstep));
end

subplot(2,2,1); plot(u_exact)
hold on
grid on
subplot(2,2,2); plot(u_coarse)
grid on
error=max(max(abs(u_coarse-u_exact)));

function [source]=sourcef(x,t)
source=(3*t^2)*(1-x^2)+2*(t^3+1);%源项（源函数）



function initial_value=initial_valueU(x,t)
initial_value= (t^3+1)*(1-x^2);%初始值 



% % % % % % CHEB compute D = differentiation matrix, x = Chebyshev grid
function [D,x] = cheb(N)  %求解矩阵
if N==0, D=0; x=-1; return, end
x = -cos(pi*(0:N)/N)';
c = [2; ones(N-1,1); 2].*(-1).^(0:N)';
X = repmat(x,1,N+1);
dX = X-X';
D = (c*(1./c)')./(dX+(eye(N+1))); % off-diagonal entries
D = D - diag(sum(D')); % diagonal entries





