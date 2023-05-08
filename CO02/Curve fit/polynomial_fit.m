function fitted_coefficients = polynomial_fit(x, y, m)
    
    X = zeros(m+1,m+1); % X must be m+1 by m+1
    Y = zeros(1,m+1);
    Y = Y(:); % Y must be a column vector of length m + 1

    for row = 1:m+1
        for column = 1:m+1
            X(row, column) = sum(x.^(row+column-2)); % Equation for each (row, column) is given on canvas
        end
    end

    for row = 1:m+1
        Y(row) = sum(x.^(row-1).*y); % Equation given on canvas
    end

    fitted_coefficients = X\Y;

    % Compact code :)
    
end