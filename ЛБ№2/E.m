function [E_5, E_10, E_15] = E(data)

    E_5 = mean(data(length(data)-4:length(data)));
    E_10 = mean(data(length(data)-9:length(data)));
    E_15 = mean(data(length(data)-14:length(data)));

end