%% 次扩散方程
%%
% 
% $$D_t^{\alpha}u(x,t)=\frac{\partial^2 u(x,t)}{\partial x^2}+f(x,t),\quad x\in (a,b),\quad t\in (0,T],$$
%
% $$u(a,t) = \phi(t), \quad  u(b,t)=\varphi(t), \quad t\in (0,T],$$
%
% $$u(x,0) = u^0(x), \quad x\in [a,b],$$
% 
% 其中, 
% 
% $$D_t^{\alpha}u(x,t) = \frac{1}{\Gamma(1-\alpha)}\int_0^{t}(t-s)^{-\alpha}\frac{\partial u(x,s)}{\partial s}ds$$
%
% 为 $\alpha$ 阶Caputo导数, $0<\alpha<1$.

function U = subdiffusion(alpha, a, b, T, h, tau, f, phi, varphi, u0)
%% 求解上述次扩散方程
% Input  - alpha - Caputo 导数的阶
%        - a & b - [a, b] 求解区域, 空间
%        -   T   - (0, T] 求解区域, 时间
%        -   h   - 空间离散步长
%        -  tau  - 时间离散步长
%        -   f   - 方程右端项
%        -  phi  - 边界条件，左端点
%        - varphi- 边界条件，右端点
%        -  u0   - 初始条件
M = floor((b-a) / h);
N = floor(T / tau);
U = zeros(M-1, N);
A = 1/h^2 *(diag(-2*ones(M-1, 1))+diag(ones(M-2, 1), 1)+diag(ones(M-2, 1),-1));



end


function coe = a(j, alpha)
coe = (j+1)^(1-alpha) - j^(1-alpha);
end