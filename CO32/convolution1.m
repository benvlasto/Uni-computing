function [ w ] = convolution1 (u , v)
% Author: ??? , Date: ??/??/????
% Perform convolution of two 1−dimensional signals, u and v
% Input:
% * u, v: column vectors of signal with N elements each (N x 1).
%
% Output:
% * w: the convolved signal of u and v with the same size as the input vector, N x 1
% (the full vector would have size 2N−1 but here we only take the central part of
% the signal, [ceil((N+1)/2):ceil((3*N−1)/2)] ).
%
% Constraints:
% * u and v are one−dimensional vectors of the same size.
% * Do not use the built−in functions from MATLAB that perform convolution.
%
% Example use:
% >> t = linspace(−1, 1, 1000);
% >> u = exp(−t.*t/(2*0.2^2));
% >> v = t.^2;
% >> y = convolution1(u, v);
% >> plot(y);

    N = length(u);
    u = [zeros(N-1,1) ; u ; zeros(N-1,1)];
    x_spacing = 1; % this variable changes the spacing between adjacent data points. It is 1 by default
    
    w = zeros(2*N-1,1);
    
    for z = -(N-1):N-1
        transformed_v = [zeros(N-1+z,1) ; flip(v) ; zeros(N-1-z,1)];
        w(z+N) = x_spacing * sum(u.*transformed_v);
    end
    
    w = w(ceil((N+1)/2):ceil((3*N-1)/2));

end