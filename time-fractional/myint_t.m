function I = myint_t(f, g, t, a, b)
    h = (b-a)/10;
    x = a:h:b;
    l = length(x);
    I = f(x(1), t)*g(x(1))/2 + f(x(end), t)*g(x(end))/2;
    for i=1:l-1
        I = I + f(x(i+1), t)*g(x(i+1));
    end
    I = I*h;
end