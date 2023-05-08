function main()

% Author: Ben Vlasto , Date: 17/01/2023
% This function creates initial variables, calls the solve_laplace()
% function, and outputs a contour plot of the solution
%
% Input: none
% Output: none

    clf
    clc
    clear

    init_psi = zeros(7,7);

    top_edge_bc = linspace(0,1,7);
    right_edge_bc = linspace(1,0,7);
    top_edge_bc = sin(top_edge_bc) * sinh(1);
    right_edge_bc = sin(1) * sinh(right_edge_bc);

    init_psi(1,:) = top_edge_bc;
    init_psi(:,end) = right_edge_bc;
    init_psi(end,:) = 0;
    init_psi(:,1) = 0;

    %init_psi
    
    figure(1)
    hold on
    for alpha = [1.1, 1.25, 1.45, 1.9]

        [psi, hist_vals] = solve_laplace(init_psi, alpha, 100);
        plot(hist_vals(2,:))

    end

    legend("1.1", "1.25", "1.45", "1.9")
    xlabel("Iteration number")
    ylabel("Historical matrix element values")

    analytic_sltn = zeros(7,7);
    for r = 1:7
        for c = 1:7
            y = (r-1)/6;
            x = (c-1)/6;
            analytic_sltn(8-r,c) = sin(x) * sinh(y);
        end
    end

    analytic_sltn - psi % to check analytic and numerical solutions agree

    figure(2)
    contour(linspace(0,1,7), linspace(1,0,7), psi)
    title("Contour plot of numerical solution")
    xlabel("x axis")
    ylabel("y axis")
    hist_vals;

end