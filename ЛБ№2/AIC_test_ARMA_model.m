function [AIC, DU] = AIC_test_ARMA_model(data, p, q, cov)
    
    AIC = zeros(1, p);
    DU = zeros(1, p);
    T = length(data);
    
    for p = p:-1:1
        coef = find_params_ARMA_model(data, cov, p, q);

        AIC(p) = 2 * (p+q) / T + log(sum(([data - mean(data)] - ARMA_model(coef, data)).^2)/T);
     
        DU(p) = DU_test(data, ARMA_model(coef, data));
    end

end