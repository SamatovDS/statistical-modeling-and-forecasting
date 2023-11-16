function [AIC, DU] = AIC_test_ARp(data, p, cor)

    AIC = zeros(1, p);
    DU = zeros(1, p);
    T = length(data);
    for p = p:-1:1
        coef = find_params_ARp_model(data, cor, p);

        AIC(p) = 2 * p / T + log(sum((data - ARp_model(coef, data)).^2)/T);
     
        DU(p) = DU_test(data, ARp_model(coef, data));

    end

end