function data = generate_polynomial_data(n, m, coefficients, e)

    x = linspace(-5,5,n); % Creates a row vector of n values that are evenly spaced between -5 and 5 inclusive
    x = x(:); % x should be a column vector instead of a row vector

    y_err = []; % These will be the y values returned
    for i = 1:n
        y_i = 0;
        for j = 1:m+1
            y_i = y_i + (coefficients(j) * (x(i)^(j-1)));
        end
        y_i = y_i + e*randn(); % Include noise
        y_err = [y_err; y_i]; % Should preallocate y_err as a vector of the right size, but it's not important for small data sets
    end

    data = [x y_err];

    % Compact code :)
    % But inefficient. Use matrices!
    
end