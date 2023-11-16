function coef = find_params_ARp_model(data, cor, p)

    coef = zeros(1, (p+1));
    b = transpose(cor(2:(p+1)));

    A=zeros(p);

    for i = 1:p
        for j = 1:p
            if i >= j
                A(i,j) = cor(i-j+1);
            else
                A(i,j) = cor(j-i+1);
            end
        end
    end
    
    coef(2:(p+1)) = transpose(A\b);
    coef(1) = mean(data)*(1 - sum(coef(2:length(coef))));

end