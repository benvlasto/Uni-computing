function main()

%%%%%%%%%%%%%%% DAYS 1 & 2

    for i = 1:7
        clf(i)
    end
    clc
    clear

    N = 250;
    f_x = zeros(2*N,1);

    %f_x(246:256) = 1; % first part of problem A, slit centred on origin
    %f_x(236:246) = 1; % second part of problem A, slit centred at -10
    %f_x(241:261) = 1; % third part of problem A, 2x width centred origin
    %f_x(241:261) = 0.5; % fourth part of problem A, half height 2x width centred origin

    %f_x(226:246) = 1;
    %f_x(256:276) = 1; % first part problem B, centred at +/- 15

    %f_x(216:236) = 1;
    %f_x(266:286) = 1; % second part problem B, centred at +/- 25

    %f_x(206:246) = 1;
    %f_x(256:296) = 1; % third part problem B, double width

    f_x(206:246) = 0.5;
    f_x(256:296) = 0.5; % fourth part problem B, double width half height

    figure(1)
    x = linspace(-250,249,500).';
    plot(x, f_x)

    Y = ft1(f_x);
     
    figure(2)
    %plot(x, real(Y), "b") % only plot real part for problem A
    hold on
    plot(x, abs(Y), "r")

    %title("Plots of real and absolute parts of DFT") % only plot real part for problem A
    %legend("real component","absolute value")

    title("Absolute value of DFT")

    f_x = zeros(2*N,1);
    f_x(241:261) = 1; % convolution, slit centred on origin
    Y = convolution1(f_x, f_x);

    ft_slit_squared = abs(ft1(f_x)).^2;
    ft_convolved_slit = abs(ft1(Y));

    x = linspace(-250,249,500).';
    figure(3)
    hold on
    plot(x, ft_convolved_slit)
    plot(x, ft_slit_squared)

    title("Transform of convolved slit and (transform of slit)^2")
    legend("transform of convolved slit", "transform of slit squared")

%%%%%%%%%%%%%%% DAY 3

    % problem A of extra day
    X = zeros(50,50);
    X(25,24:26) = 1;
    X(24:26,25) = 1;
    
    figure(4)
    imagesc(X)
    title("Cross-shaped source")

    Y = fftshift(ft2(X));
    % is fftshift allowed? It doesn't do any real processing, it just
    % rearranges the quadrants of the ouput matrix to move the
    % zero-frequency component to the centre where it should be

    figure(5)
    mesh(abs(Y))
    title("Amplitude of DFT of cross-shaped source")

    % problem B of extra day
    X = zeros(50,50);
    X(10,10:11) = 1;
    X(11,10:11) = 1;
    X(47:48,26) = 1;
    X(47:48,27) = 1;
    figure(6)
    imagesc(X)
    title("Randomly placed square sources")

    Y = fftshift(ft2(X));

    figure(7)
    mesh(abs(Y)) % mesh plot reveals less about plot because of fine detail
    title("Amplitude of DFT of square sources")

end