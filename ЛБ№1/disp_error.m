function disp = disp_error(y_pred, y, n, p)

    disp = 0;
    for i = 1:n
        disp = disp + (y_pred(i) - y(i))^2;
    end 
    
    disp = disp / (n-p);
end
