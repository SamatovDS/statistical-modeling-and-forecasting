function create_ARMA_plot(data, y_pred)
    t = 1:length(data);

    figure('Color', 'w')
    
    
    hold on

    plot(t, data, Color='red')
    plot(t, y_pred, Color='blue')

    hold off
    
    grid on
    grid minor
    
    title('Модель ARMA(1,1)');
    legend('Исходные данные', 'модель ARMA(1,1)');

    xlabel('t')
    ylabel('y')

end