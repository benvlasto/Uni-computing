function [ Y ] = ft2 ( X )
% Author: ??? , Date: ??/??/????
% Fourier transform function for 2−dimensional signal.
% Input:
% * X: a matrix of 2D signal with size (2M x 2N).
%
% Output:
% * Y: the Fourier transformed signal in the form of a (2M x 2N) matrix with complex
% elements.
%
% Constraints:
% * X is a two−dimensional matrix.
% * Do not use the built−in Fourier transform functions from MATLAB.
%
% Example use:
% >> [t0, t1] = meshgrid(linspace(−1, 1, 1000));
% >> x = exp(−(t0.*t0+t1.*t1)/(2*0.2^2));
% >> y = ft2(x);
% >> imagesc(abs(y));

    M = size(X,1)/2;
    N = size(X,2)/2;

    [x,y] = meshgrid(linspace(-N,N-1,2*N), -linspace(-M+1,M,2*M));

    Y = zeros(2*M,2*N);

    for c = 1:2*N
        for r = 1:2*M
            Y(r,c) = 1/(4*N*M)*sum(sum(X.*exp(-pi*1i*(x*c/N+y*r/M))));
        end
    end

end