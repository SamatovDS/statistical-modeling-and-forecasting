function disp = create_regression_model(t, y, params, flag)
    if flag == 0
        f = @(x) params(1) + params(2)*x;
    elseif flag == 1
        f = @(x) params(1) + params(2)*x + params(3)*x.^2; 
    else
        f = @(x) params(1) + params(2)*x + params(3)*x.^2 + + params(4)*x.^3;
    end
    
    figure('Color', 'w')
   
    hold on

    plot(t, f(t), Color='red')
    plot(t, y, 'bo')

    hold off
    
    grid on
    grid minor
    
    if flag == 0
        title('Линейная модель');
        legend('-0.0357 + 0.9533*x', 'узлы');
    elseif flag == 1
        title('Квадратичная модель');
        legend('4258.5 + 418.2*x -15.2*x^2', 'узлы'); 
    else
        title('Кубическая модель');
        legend('3213.5 + 418.2873.9*x - 59.9*x^2 + 1.2*x^3', 'узлы'); 
    end

    xlabel('t')
    ylabel('y')

    disp = disp_error(f(t), y, length(t), length(params));
end


    