function [E] = find_oscillator_eigenvalue(E0)
% Author: Ben Vlasto, Date: 18/10/2022
% Finding the eigenvalue for harmonic oscillator potential by iteration with starting
% value E0.
% Input:
% * E0: the initial guess of the eigenvalue
%
% Output:
% * E: the eigenvalue near the initial guess of the system with harmonic oscillator
% potential
%
% Constraints:
% * E0 is a positive real number
%
% Example use:
% >> E = find_oscillator_eigenvalue(1.2);
% >> disp(E);
end