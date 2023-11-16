function LB_statistics(r, T)

    sum = 0;
    for k = 1:length(r)-1
        sum = sum + r(k+1)^2 / (T-k);
    end

    q = sum * (T + 2) * T;
    chi = chi2inv(0.95, length(r)-1-1-1);

    if q > chi
        fprintf('Отклоняем гипотезу о случайности данных так как: %s > %d. \n', q, chi);
    else
        fprintf('Принимаем гипотезу о случайности данных так как: %s < %d. \n', q, chi);
    end

end