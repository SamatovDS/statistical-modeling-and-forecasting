function y_pred = predict_GARCH(data, sigma, u_n)
    model = garch('garchlags', 1, 'archlags', 1);
    [estM1, H, logL, info] = estimate(model, transpose(u_n), 'Display', {'params'});
    sum(sigma/length(sigma))
    sigma_n = sum(sigma/length(sigma)) * info.X(1) + u_n(23)^2 * info.X(3) + sigma(1) * info.X(2);
    new_u_n = sigma_n * normrnd(0, 1, 1); 
    y_pred = new_u_n * data(length(data)) + data(length(data));

end