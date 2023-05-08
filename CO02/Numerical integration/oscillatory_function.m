function ans = oscillatory_function(x)
    
    ans = sin(100*pi*x)^2 * function_erf(x);

end