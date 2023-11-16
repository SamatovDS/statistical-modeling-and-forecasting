function y_pred = predict_ARp(coef, data, t)

    y_pred = 0;
    for i = 1:length(coef)-1
        y_pred = y_pred + coef(i+1) * data(t-i);
    end
    
end