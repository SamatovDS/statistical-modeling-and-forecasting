function [cov, cor] = find_characteristics(y, m)
    n = length(y);
    y_mean = mean(y);
    cov = zeros(1, m+1);
    cor = zeros(1, m+1);

    for i = 1:m+1
        sum = 0;
        for j = 1:n-(i-1)
            sum = sum + (y(j) - y_mean) * (y(j+(i-1)) - y_mean);
        end

    cov(i) = sum / n;
    end

    for i = 1:m+1
        cor(i) = cov(i) / cov(1);
    end

end