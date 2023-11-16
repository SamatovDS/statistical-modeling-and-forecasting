function gamma = DU_test(y, y_pred)

    e = y_pred - y;
    gamma = 0;
    sum_gamma = 0;
    n = length(y);

    for i = 2:n
        gamma = gamma + (e(i) - e(i-1))^2;
        sum_gamma = sum_gamma + e(i)^2;
    end

    gamma = gamma / (sum_gamma + e(1)^2);

end