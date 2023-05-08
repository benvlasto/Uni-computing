function root = newton_raphson(x,i)
    
    % Apply formula
    root = x - (apply_equation(x)/apply_equation_derivate(x));

    i = i - 1;
    if i > 0 % If we haven't done enough iterations
        root = newton_raphson(root,i); % Do another

end