function BP_statistics(data, cov, m, p, q)
    
    n = length(data);
    coef = find_params_ARMA_model(data, cov, p, q);
    y_pred = ARMA_model(coef, data);
    W = [data - mean(data)];

    r = zeros(1, m);
    
    for k = 1:m
        sum = 0;
        sum_under = 0;
        for i = k+1:n
            sum = sum + (W(i) - y_pred(i)) * (W(i-k) - y_pred(i-k));
        end

        for i = 1:n
            sum_under = sum_under + (W(i) - y_pred(i))^2;
        end

        r(k) = sum / sum_under;

    end
    
    sum = 0;
    for i = 1:m
       sum = sum + r(i)^2;
    end

    gamma = n * sum;

    if gamma < chi2inv(0.95, m-p-q)
        fprintf('При %d: принимаем гипотезу о равенстве нулю первых %g автокорреляций так как: %s < %f. \n', p, m, gamma, chi2inv(0.95, m-p-q));
    else
        fprintf('При %d: отклоняем гипотезу о равенстве нулю первых %g автокорреляций так как: %s > %f. \n', p, m, gamma, chi2inv(0.95, m-p-q));
    end

end 