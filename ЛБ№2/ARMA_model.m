function y_pred = ARMA_model(coef, data)

    coef = coef(1:length(coef)-1);

    W = [data - mean(data)];
    y_pred = zeros(1, length(data));
    X = zeros(length(data), length(coef));
    
    for i = 1:length(coef)
        X(:,i) = [zeros(1, i) W(1:length(data)-i)];
    end

    y_pred = transpose(X * transpose(coef));

end