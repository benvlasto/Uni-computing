function [ Y ] = ft1 ( f_x )
% Author: ??? , Date: ??/??/????
% Fourier transform function for a 1−dimensional signal.
% Input:
% * X: a column vector of signal with N elements (N x 1).
%
% Output:
% * Y: the Fourier transformed signal in the form of a column vector of N complex
% elements.
%
% Constraints:
% * X is a one−dimensional column vector
% * Do not use the built−in Fourier transform functions from MATLAB
%
% Example use:
% >> t = linspace(−1, 1, 1000);
% >> x = exp(−t.*t/(2*0.2^2));
% >> y = ft1(x);
% >> plot(abs(y));

    N = length(f_x)/2;
    x = linspace(-N,N-1,2*N).'; % this acts as x-axis
    real_F_u = zeros(2*N,1);
    imag_F_u = zeros(2*N,1);
    for u = -N:N-1
        real_F_u(u+N+1) = sum(f_x .* cos(-pi*u*(1/(2*N)) * x));
        imag_F_u(u+N+1) = sum(f_x .* sin(-pi*u*(1/(2*N)) * x));
    end

    Y = real_F_u + 1i * imag_F_u;

end