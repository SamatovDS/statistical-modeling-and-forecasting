clc, clearvars, close all, format compact


data = [49.76, 50.06, 50.37, 50.49, 50.59, 50.44, 50.84, 50.82, 50.39, 50.92, 50.96, 50.74, 50.75, 51.39, 51.40, 51.06, 51.65, 52.23, 52.31, 51.70, 51.61, 51.62, 51.88, 51.51];

create_plot(data);

% Первое задание
m = 10;
[cov, cor] = find_characteristics(data, m);
Q_statistics(cor, length(data));

coef = find_params_ARp_model(data, cor, 1);
ADF_test(data, cor);

% для p = 1 отклоняем гипотезу H0 статистики Дарбина-Уотсона 
[AIC, DU] = AIC_test_ARp(data, 10, cor);
y_pred_ARp = predict_ARp(coef, data, 25);


% Второе задание
% % q = 1;
% % m = 10;
% % [cov_2, cor_2] = find_characteristics(data, m);
% % 
% % coef = find_params_ARMA_model(data, cov_2, 1, q);
% % 
% % for p = 1:9
% %     for m = 1:9
% %         if m-p-q > 0
% %             BP_statistics(data, cov_2, m, p, q);
% %         end
% %     end
% % end
% % 
% % [AIC_2, DU_2] = AIC_test_ARMA_model(data, 9, q, cov_2);
% % 
% % y_pred = create_ARMA_model(data, cov_2, 1, q);
% % create_ARMA_plot(data, y_pred);
% % y_pred_ARMA = predict_ARMA(data, cov_2, 2, q);
% % 
% % predict_ARMA_plot(data, y_pred_ARMA);

% Третье задание  
% % new_data = zeros(1, length(data)-1);
% % 
% % for i = 2:length(data)
% %     new_data(i-1) = (data(i) - data(i-1)) / data(i-1);  
% % end
% % 
% % [E_5, E_10, E_15] = E(new_data);
% % [D_5, D_10, D_15] = D(new_data);
% % 
% % k = 15;
% % sigma = zeros(1, 8);
% % 
% % for  i = 23:-1:16
% %     sum_in_range = 0;
% %     for j = 1:k
% %         sum_in_range = sum_in_range + (new_data(1, i-j) - (sum(new_data(1, i-k:i-1)) / 15))^2;
% %     end
% %     sigma(1, i-k) = 1 / (k-1) * sum_in_range;
% % end
% % 
% % u_square = new_data.^2;
% % u_square_sigma = new_data(16:23).^2 ./sigma;
% % [cov_3, cor_3] = find_characteristics(u_square, 5);
% % [cov_4, cor_4] = find_characteristics(u_square_sigma, 5);
% % 
% % LB_statistics(cor_3, length(u_square));
% % LB_statistics(cor_4, length(u_square_sigma));
% % 
% % y_pred_GARCH = predict_GARCH(data, sigma, new_data);
% % predict_GARCH_plot(data, y_pred_GARCH);
% % 
% % frcst = model_GARCH(new_data);
% % 
% % predict_GARCH_plot(data, y_pred_GARCH);