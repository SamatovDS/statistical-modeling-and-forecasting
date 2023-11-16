function predict_ARMA_plot(data, y_pred)

    t = 1:length(data);

    figure('Color', 'w')
   
    hold on

    plot(t, data, Color='red')
    plot(25 , y_pred, 'bo')
    plot(25, 51.632, '*')

    hold off
    
    grid on
    grid minor
    
    title('Предсказание модели');
    legend('Исходные данные', 'Предсказанное значение ARMA(1,1) модели','Statistica');

    xlabel('t')
    ylabel('y')

end