function y_pred = create_ARMA_model(data, cov, p, q)
    
    coef = find_params_ARMA_model(data, cov, p, q);
    y_n = ARMA_model(coef, data);
    theta = coef(length(coef));
    disp_eps = var([data - mean(data)] - y_n) / (1 + theta^2);    
    eps_col = [zeros(1, 1) normrnd(0, disp_eps, [1 23])];

    W = [data - mean(data)];
    y_pred = zeros(1, length(data));
    X = zeros(length(data), length(coef));
    X(:, length(coef)) = (-1) * eps_col;
    
    for i = 1:length(coef)-1
        X(:,i) = [zeros(1, i) W(1:length(data)-i)];
    end

    y_pred = transpose(X * transpose(coef)) + mean(data);

end