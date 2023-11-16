function create_season_regression_model_pred(t, y, params, y_pred)
    t_new = horzcat(t, [25, 26]);
    data = zeros(1, 26);
    figure('Color', 'w')

    for i = 1:26 
        if i < 8
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + (-params(4)-params(5));
            data(i) = f(t_new(i));
        elseif i == 8
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + (-params(4)-params(5)) * 1/2 + params(4) * 1/2;
            data(i) = f(t_new(i)); 
        elseif i > 8 && i < 17
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + params(4);
            data(i) = f(t_new(i)); 
        elseif i == 17
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + params(4) * 1/2 + params(5) * 1/2;
            data(i) = f(t_new(i));
        elseif i > 17
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + params(5);
            data(i) = f(t_new(i));
        end
    end

    hold on
    plot(data, 'red')

    plot(t, y, 'bo')
    
    plot([25, 26], y_pred, '*')
    hold off
    
    grid on
    grid minor

    title('Модель тренда + сезонность');
    xlabel('t')
    ylabel('y')
end