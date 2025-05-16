clc
clear 
close all

H = 0.4;
T = 10;
x10 = 0;
x20 = 0;
tau = 1e-2;
[t, X] = solver(H, T, x10, x20, tau);

plot(t, X(:, 1))
hold on
plot(t, X(:, 2))
legend("X1", "X2")
xlabel('t')
ylabel('X')

function [t, X] = solver(H, T, x10, x20, tau)
if nargin == 4
    tau=1e-2;
end
t = 0:tau:T;
N = length(t)-1;
A1 = a1(t);
A2 = a2(t);
C1 = c1(t);
C2 = c2(t);
temp1 = 0.3 .* abs(sin(t));
temp2 = 0.2 .* exp(-2 .* t);
x1 = zeros(N+1, 1);
x2 = zeros(N+1, 1);
x1(1) = x10;
x2(1) = x20;
noise1 = fGn(H, N);
noise2 = fGn(H, N);
for k=2:N+1
    x1(k) = x1(k-1) + tau * (A1(k-1) * x1(k-1) + ...
        temp1(k-1)*x1(k-1)+ temp2(k-1)) + C1(k-1)*tau^(1+H)*noise1(k-1);
    x2(k) = x2(k-1) + tau* (A2(k-1) * x2(k-1) + ...
        temp1(k-1)*x2(k-1)+ temp2(k-1)) + C2(k-1)*tau^(1+H)*noise2(k-1);
end
X = [x1, x2];
end

function y = c1(t)
y=exp(-3.*t-0.1.*cos(t));
end

function y = c2(t)
y=exp(-5.*t-0.1.*cos(t));
end

function y = a1(t)
y=-2+0.1.*sin(t);
end

function y = a2(t)
y=-3+0.1.*sin(t); 
end

function f = fGn(H, N)
 sigma = 1;
 if H ~= 0.5
 c = sigma^2/2*(((0:N)+1).^(2*H)-2*((0:N).^(2*H))+abs((0:N)-1).^(2*H));
 v = [c(1:N), c(N+1:-1:2)];
 g = real(fft(v));
 if min(g) < 0
  error(' Some of the g(k) are negative!');
 end
 g = abs(g);
 z(1)=sqrt(2)*randn();
 y(1)=z(1);
 z(N+1)=sqrt(2)*randn();
 y(N+1)=z(N+1);
 a=randn(1, N-1);
 b=randn(1, N-1);
 z1=a+b*1i;
 y1=z1;
 y(2:N)=y1;
 y(N+2:2*N)=conj(y(N:-1:2));
 y = y.*sqrt(g);
 f = real(fft(y')')/sqrt(4*N);
 f = f(1:N);
 else
  f = randn(N, 1);
 end
end