function approximation = approximate_oscillatory(x, n)

    h = x/n;

    first_term = oscillatory_function(0);

    second_term = oscillatory_function(x);

    third_term = 0;
    for i = 1:n-1
        third_term = third_term + oscillatory_function(i*h);
    end
    third_term = 2 * third_term;
    
    fourth_term = 0;
    for i = 1:n
        fourth_term = fourth_term + oscillatory_function((i-0.5)*h);
    end
    fourth_term = 4 * fourth_term;

    approximation = (2/sqrt(pi)) * (h/6) * (first_term + second_term + third_term + fourth_term);

end