clear
clc
clf

%{
% Linear fit
M = readmatrix("linear.csv");
x = M(:,1);
y = M(:,2);

[intercept, slope, rms] = linear_fit(); % Could pass in x and y instead of extracting them again in linear_fit, but it's whatever.

y_fit = intercept + slope.*x;

plot(x,y)
hold on
plot(x,y_fit)
%}

% Polynomial fit
n = input("Enter n: ");
m = input("Enter order of polynomial: ");
coefficients = [];
for counter = 1:m+1
    var = input("Enter coefficient: ");
    coefficients = [coefficients var];
end
e = input("Experimental rms value: ");

data = generate_polynomial_data(n, m, coefficients, e); % Pass in number of 
% data points, the order of the polynomial, the coefficients chosen by the
% user, and the "magnitude" of the noise they want to include in the
% generated data
x = data(:,1);
y = data(:, 2);
plot(x,y);
hold on

fitted_coefficients = polynomial_fit(x,y,m)
y_fit = [];
for i = 1:n
    y_fit_i = 0;
    for j = 1:m+1
        y_fit_i = y_fit_i + fitted_coefficients(j) * x(i)^(j-1);
    end
    y_fit = [y_fit; y_fit_i];
end
plot(x,y_fit);