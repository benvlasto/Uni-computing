    function approximation = approximate_erf(x, n)

    h = x/n;

    first_term = function_erf(0);

    second_term = function_erf(x);

    third_term = 0;
    for i = 1:n-1
        third_term = third_term + function_erf(i*h);
    end
    third_term = 2 * third_term;
    
    fourth_term = 0;
    for i = 1:n
        fourth_term = fourth_term + function_erf((i-0.5)*h);
    end
    fourth_term = 4 * fourth_term;

    approximation = (2/sqrt(pi)) * (h/6) * (first_term + second_term + third_term + fourth_term);

end