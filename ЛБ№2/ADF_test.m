function gamma = ADF_test(y, cor)
    
    for p = 1:10

        coef = find_params_ARp_model(y, cor, p);
        a1 = coef(2);
        X = zeros(length(y), length(p));
        h = ARp_model(coef, y);
%         for i = 1:p
%             X(:,i) = [zeros(1, i), h(1:length(y)-i)];
%         end
%         
        X_centr = [h - mean(h)];
        c = inv(X_centr * transpose(X_centr));
        s = sqrt(c(1, 1) / (length(y) - 1));
    
        gamma = (a1 - 1) / s;
        
        if gamma < -1.95
            fprintf('При p = %d, oтклоняем нулевую гипотезу о нестационарности данных так как: %s < -1.95. \n', p, gamma);
        else
            fprintf('При p = %d, принимаем нулевую гипотезу о нестационарности данных так как: %s < -1.95. \n', p, gamma);
        end

    end
end