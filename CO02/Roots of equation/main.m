clear
clc

format longg % to see more decimal points of approximation
iterations = 48; % 48 iterations or more gives the same result to 14 d.p.

% 48 iterations of bisection or more gives correct result to 14 d.p.
root_approximation_using_bisection = bisection(2,4,iterations);

% 3 iterations of n-r or more gives correct result to 14 d.p.
root_approximation_using_nr = newton_raphson(3,iterations);

% Compare true value with calculated values
equation = @(x) 3*exp(-x) - x + 3;

% fzero takes two arguments: a function, and a 'guess' of the root (in this case 3)
true_root = fzero(equation,3); 

bisection_difference = root_approximation_using_bisection - true_root
n_r_difference = root_approximation_using_nr - true_root