function create_plot(data)
    figure('Color', 'w')
   
    hold on

    plot(data, Color='red')

    hold off
    
    grid on
    grid minor

    title('Вон, Корея');
    xlabel('Номер дня');
    ylabel('Цена, руб.');