clear
clc

format longg

%{
% Error function
for x = 0.2:0.2:1
    for n = [1 10 100]
        % Outputs the three approximations using 1, 10, then 100 sections
        approximation = approximate_erf(x, n);
        sprintf('%0.10f', approximation)
    end
    % Outputs precise answer at each x after outputting the three
    % approximations
    precise_ans = erf(x);
    sprintf('%0.10f', precise_ans)
end
%}

func = @(t) (2/sqrt(pi)) .* sin(100.*pi.*t).^2 .* exp(-t.^2);

% Oscillatory function
for x = 0.2:0.2:1
    for n = [1 10 100]
        approximation = approximate_oscillatory(x, n);
        sprintf('%0.10f', approximation)
    end
    % Outputs precise answer at each x after outputting the three
    % approximations
    precise_ans = integral(func, 0, x);
    sprintf('%0.10f', precise_ans)
end