function root = bisection(x1,x2,i)
    
    % Find midpoint
    x3 = (x1+x2)/2

    % Input 'roots' and their midpoint are evaluated with the function
    f_x1 = apply_equation(x1);
    f_x2 = apply_equation(x2);
    f_x3 = apply_equation(x3);

    % Decrement the iteration counter
    i = i - 1;

    % Check if we have done enough iterations
    % If we have, return our approximation of the root
    if i < 1
        root = x3;

    % If we haven't, do another iteration. 
    % To decide which of x1 or x2 we are using for our next iteration, work
    % out which of f(x1) and f(x2) has the opposite sign to f(x3). If f(x1)
    % has opposite sign, f(x1) * f(x3) will be negative
    elseif f_x1 * f_x3 < 0
        root = bisection(x1,x3,i);
    else
        root = bisection(x2,x3,i);
    end

end