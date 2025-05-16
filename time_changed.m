function [t, B] = time_changed(alpha, T, n)
    [t, S] = subordinator(alpha, T, n);
    tt = sort([(0:0.01:S(end))'; S]);
    B = Brown(tt);
    m = length(tt);
    index = zeros(n+1, 1);
    for i=1:n+1
        for j=1:m
            if tt(j) == S(i)
                index(i) = j;
                break
            end
        end
    end
end