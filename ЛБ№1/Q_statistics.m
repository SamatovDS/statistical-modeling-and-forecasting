function q = Q_statistics(r, T)

    sum = 0;
    for k = 1:length(r)
        sum = sum + r(k) ^ 2 / (T-k);
    end
    q = sum * (T + 2) * T;
end