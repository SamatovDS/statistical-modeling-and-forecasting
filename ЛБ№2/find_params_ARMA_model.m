function coef = find_params_ARMA_model(data, cov, p, q)
    b = cov(q+2:q+p+1);
    A = zeros(p);

    for i = 1:p
        for j = 1:p
            if q+i-j-1 >= 0
                A(i,j) = cov(i-j+2);
            else
                A(i,j) = cov(j-i+2);
            end
        end
    end

    coef_1 = A \ transpose(b);

    W = [data - mean(data)];
    y = zeros(1, length(data));
    X = zeros(length(data), length(coef_1)+1);
    X(:, 1) = W;

    for i = 2:length(coef_1)+1
        X(:,i) = (-1) * [zeros(1, i-1) W(1:length(data)-i+1)];
    end
 
    y = transpose(X * [1; coef_1]);

    [cov_2, cor_2] = find_characteristics(transpose(y), p);

    coef_2 = (sqrt(1 - 4 * cor_2(2)^2) - 1) / (2 * cor_2(2));
%     coef_2 = coef_2 = fsolve(@(x) -x / (1 + x^2) - cor_2(2), 0);

    coef = [transpose(coef_1) coef_2];

end