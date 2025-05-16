function I = myint_x(f, g, a, b)
    h = (b-a)/10;
    x = a:h:b;
    l = length(x);
    I = f(x(1))*g(x(1))/2 + f(x(end))*g(x(end))/2;
    for i=1:l-1
        I = I + f(x(i+1))*g(x(i+1));
    end
    I = I*h;
end