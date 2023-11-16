function [D_5, D_10, D_15] = D(data)

    n = length(data);

    D_5 = var(data(n-4:n), 1);
    D_10 = var(data(n-9:n), 1);
    D_15 = var(data(n-14:n), 1);
    
end