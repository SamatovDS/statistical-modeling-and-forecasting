function frcst = model_GARCH(data)

    model = garch('garchlags', 1, 'archlags', 1);
    [estM1, H, logL, info] = estimate(model, transpose(data), 'Display', {'params'});
    
    frcst = forecast(estM1, 1, transpose(data));
    
    predict_GARCH_plot(data, frcst);

end