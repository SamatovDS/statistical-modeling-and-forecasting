function disp = create_season_regression_model(t, y, params)

    data = zeros(1, 24);
    figure('Color', 'w')

    for i = 1:24 
        if i < 8
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + (-params(4)-params(5));
            data(i) = f(t(i));
        elseif i == 8
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + (-params(4)-params(5)) * 1/2 + params(4) * 1/2;
            data(i) = f(t(i)); 
        elseif i > 8 && i < 17
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + params(4);
            data(i) = f(t(i)); 
        elseif i == 17
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + params(4) * 1/2 + params(5) * 1/2;
            data(i) = f(t(i));
        elseif i > 17
            f = @(x) params(1) + params(2)*x + params(3)*x.^2 + params(5);
            data(i) = f(t(i));
        end
    end

    hold on
    plot(data, 'red')

    plot(t, y, 'bo')
    hold off
    
    grid on
    grid minor

    title('Аддитивная модель');
    xlabel('t')
    ylabel('y')

    disp = disp_error(data, y, 24, length(params));
end


    