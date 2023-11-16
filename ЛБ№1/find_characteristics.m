function [disp, cov, cor, gamma] = find_characteristics(n, y, t, params)
    
    model = @(x) params(1) + params(2) * x;

    m = 5;
    y_pred = ones(1, n);
    cov = zeros(1, m+1);
    cor = zeros(1, m+1);
    e = zeros(1, n);
  
    for i = 1:n
        y_pred(i) = model(t(i)); 
    end 
    
    disp = disp_error(y_pred, y, n, length(params));
    y_mean = mean(y_pred);
    for i = 1:m+1
        sum = 0;
        for j = 1:n-(i-1)
            sum = sum + (y_pred(j) - y_mean) * (y_pred(j+(i-1)) - y_mean);
        end
    cov(i) = sum / n;
    end

    for i = 1:m+1
        cor(i) = cov(i) / cov(1);
    end 
    
    e = y_pred - y;

    gamma = 0;
    sum_gamma = 0;
    for i = 2:n
        gamma = gamma + (e(i) - e(i-1))^2;
        sum_gamma = sum_gamma + e(i)^2;
    end

    gamma = gamma / (sum_gamma + e(1)^2);
end
