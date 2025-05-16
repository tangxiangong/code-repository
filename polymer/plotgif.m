function plotgif(m, filename, titlename,p)
    if nargin == 3
        p=1;
    end
    figure()
    view(3)
    axis equal;
    grid on
    n = size(m, 1);
    h = animatedline(m(1,1),m(1,2),m(1,3),'Marker','.', 'Color', 'b');
    title(titlename)
    xlabel('x')
    ylabel('y')
    zlabel('z')
    for g=1:n
        addpoints(h,m(g,1),m(g,2),m(g,3));
        if mod(g-1,p)==0
        makegif(filename, g);
        drawnow
        end
    end
end