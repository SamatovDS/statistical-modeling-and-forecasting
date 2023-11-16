function [y_pred_25, y_pred_26] = predict(params, x_test)
    f = @(x) params(1) + params(2)*x + params(3)*x.^2 + params(5);

    y_pred_25 = f(x_test(1));
    y_pred_26 = f(x_test(2));
end
