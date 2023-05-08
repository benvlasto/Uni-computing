function [intercept, slope, rms] = linear_fit()

    M = readmatrix("linear.csv");
    x = M(:,1);
    y = M(:,2);
    N = length(x);
    
    X = [N, sum(x); sum(x), sum(x.^2)];
    
    Y = [sum(y); sum(x.*y)];
    
    a = X\Y;
    intercept = a(1);
    slope = a(2);
    rms = 1/N * sum((y - intercept - slope.*x).^2);
    rms = rms ^ 0.5;

end