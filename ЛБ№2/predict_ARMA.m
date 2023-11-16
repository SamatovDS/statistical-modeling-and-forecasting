function y_pred_25 = predict_ARMA(data, cov, p, q)

    coef = find_params_ARMA_model(data, cov, p, q);
    y_n = ARMA_model(coef, data);
    theta = coef(length(coef));
    W = [data - mean(data)];
    disp_eps = var(W - y_n) / (1 + theta^2); 
    y_pred_25 = normrnd(0, disp_eps) * theta;
    
    for i = length(coef)-1:-1:1
        y_pred_25 = y_pred_25 + coef(i) * W(i);
    end
    
    y_pred_25 = y_pred_25 + mean(data);

end

