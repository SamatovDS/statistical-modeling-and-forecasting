clc, clearvars, close all, format compact

y_1 = [0.91, 0.87, 0.85, 0.82, 0.79, 0.75, 0.7, 0.66, 0.62, 0.6];
y_2 = [4087, 4737, 5768, 6005, 5639, 6745, 6311, 7107, 5741, 7087, 7310, 8600, 6975, 6891, 7527, 7971, 5875, 6140, 6248, 6041, 4626, 6501, 6284, 6707];
n_1 = length(y_1);
n_2 = length(y_2);
t_1 = 1:n_1;
t_2 = 1:n_2;

X_1 = horzcat(ones(n_1, 1), transpose(t_1));
X_2 = horzcat(ones(n_2, 1), transpose(t_2), transpose(t_2.^2));
X_3 = horzcat(ones(n_2, 1), transpose(t_2), transpose(t_2.^2), transpose(t_2.^3));

theta_1 = find_parametrs(X_1, y_1);
disp_1 = create_regression_model(t_1, y_1, theta_1, 0);


[disp_1, cov, cor, gamma] = find_characteristics(n_1, y_1, t_1, theta_1);
% Q = Q_statistics(cor, length(y_1));
% chi = chi2inv(0.95, 6);
% 
% y_pred = moving_average_method(y_1);
% 
% theta_2 = find_parametrs(X_2, y_2);
% disp_2 = create_regression_model(t_2, y_2, theta_2, 1);
% 
% center = [1, 9, 17, 24];
% X_season = zeros(24, 3);
% 
% theta_3 = find_parametrs(X_3, y_2);
% disp_3 = create_regression_model(t_2, y_2, theta_3, 2);
% 
% 
% for i = 1:3
%     for j = center(i):center(i+1)
%         X_season(j, i) = 1;
%     end
% end
% 
% X_season(9,1) = 1/2;
% X_season(9,2) = 1/2;
% X_season(17,2) = 1/2;
% X_season(17,3) = 1/2;
% 
% X_season = horzcat(X_season(:,2) - X_season(:,1), X_season(:,3) - X_season(:,1));
% X_4 = horzcat(X_2, X_season);
% theta_4 = find_parametrs(X_4, y_2);
% disp_4 = create_season_regression_model(t_2, y_2, theta_4);
% 
% [y_pred_25, y_pred_26] = predict(theta_4, [25, 26]);
% 
% create_season_regression_model_pred(t_2, y_2, theta_4, [y_pred_25, y_pred_26]);