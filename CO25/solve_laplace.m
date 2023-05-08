function [ psi , hist_values ] = solve_laplace ( init_psi , alpha , N_iter )
% Author: Ben Vlasto , Date: 17/01/2023
% This function solves the Laplace’s equation using the over−relaxation method
% Input:
% * init_psi: 2D matrix containing the initial \psi, including boundaries.
% * alpha: the coefficient of over−relaxation.
% * N_iter: maximum number of iterations performed.
%
% Output:
% * psi: 2D matrix of the value of \psi after (up to) N_iter iterations.
% * hist_values: (N_iter x 3) matrix that contains historical values of 3 points during
% the iteration (1 in the upper half, 1 in the middle, and 1 in the lower half).
%
% Constraints:
% * The boundaries of \psi are kept constant during the iterations.
%
% Example use:
% >> init_psi = zeros(7,7);
% >> % example of boundary conditions: all ones
% >> init_psi(1,:) = 1;
% >> init_psi(end,:) = 1;
% >> init_psi(:,1) = 1;
% >> init_psi(:,end) = 1;
% >> [psi, hist_vals] = solve_laplace(init_psi, 1.1, 30);

    psi = init_psi;
    hist_values = zeros(3,N_iter);
    flag = 0;

    for i = 1:N_iter

        if flag == 1 % once convergence is reached, this if statement stops the iteration process
            break
        end

        for r = 2:6
            for c = 2:6
                test_value = psi(r,c);
                c = 8 - c; % so that we iterate from the non-zero edge to the zero edge
                R_ij = psi(r+1,c) + psi(r-1,c) + psi(r,c-1) + psi(r,c+1) - 4*psi(r,c);
                psi(r,c) = psi(r,c) + (alpha/4) * (R_ij);

                if abs(test_value - psi(r,c)) < 0.00000001 % if any old value and new value agree to 8 d.p., stop convergence process.
                    % This is an ugly solution, but it greatly simplifies
                    % the code, produces good results, and doesn't waste
                    % too many resources as the task is small.
                    flag = 1;
                end

            end
        end
        
        hist_values(:,i) = [psi(2,6); psi(4,4); psi(2,6)];

    end

end