function y_pred = ARp_model(coef, y)

    coef = coef(1:length(coef));
    X = zeros(length(y), length(coef)-1);

    for i = 1:length(coef)-1
        X(:,i) = [zeros(1, i), y(1:length(y)-i)];
    end
%   X_centr = [X - mean(X)];
    one_col = ones(length(y), 1);
    X = [one_col, X];

    y_pred = transpose(X * transpose(coef));

%     coef = coef(2:length(coef));
%     X = zeros(length(y), length(coef));
% 
%     for i = 1:length(coef)
%         X(:,i) = [zeros(1, i), y(1:length(y)-i)];
%     end
% %   X_centr = [X - mean(X)];
% %     one_col = ones(length(y), 1);
% %     X = [one_col, X];
%  
%     y_pred = transpose(X * transpose(coef));

end