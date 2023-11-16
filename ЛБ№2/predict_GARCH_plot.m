function predict_GARCH_plot(data, y_pred)

    t = 1:length(data);

    figure('Color', 'w')
   
    hold on

    plot(t, data, Color='red')
    plot(25, y_pred, 'bo')

    hold off
    
    grid on
    grid minor
    
    title('Предсказание модели');
    legend('Исходные данные', 'Предсказанное значение GARCH(1,1) модели');

    xlabel('t')
    ylabel('y')

end