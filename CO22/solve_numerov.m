function [psi] = solve_numerov(f , x , psi0 , dpsi0)
% Author: Ben Vlasto, Date: 18/10/2022
% Solving d^2(psi)/dx^2 = f(x) psi from x0 to x1 with boundary condition
% psi(x0) = psi0 and d(psi(x0))/dx = dpsi0
% Input:
% * f: The function to be called on the right hand side of the equation (see hint
% section), receives x and returns the value of f(x).
% * x: array of the integration, the first element is the lower bound, x0, and the last
% element is the upper bound, x1.
% * psi0: the value of \psi at x0, i.e. \psi(x0)
% * dpsi0: the value of \psi derivative at x0, i.e. d\psi(x0)/dx
%
% Output:
% * psi: array of values of \psi with each element in the array corresponding to the same
% element in x
%
% Example use:
% >> f = @(x) x^2 − 1;
% >> x = linspace(0, 1, 100);
% >> psi0 = 1;
% >> dpsi0 = 0;
% >> psi = solve_numerov(f, x, psi0, dpsi0);
% >> plot(x, psi);
end