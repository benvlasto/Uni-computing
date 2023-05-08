function main

    % Author: Ben Vlasto , Date: 21/02/2022

    % Initialises all variables, including:
    % * the number of atoms (N).
    % * the initial element populations (D-elements vector init_pop).
    % * the half life of each element that decays ((D-1)-elements vector
    % half_lives).
    % * N−elements vector of the time grid where the population is
    % returned.
    % This function also calculates the analytic solution, and plots the
    % data produced by simulate_decay.m over the analytic solution.

    % Input: N/A
    
    % Output: Nothing is returned, but this function outputs the plot of
    % data (coloured lines) over the analytic solution (black dashed
    % lines).

    % Example use: N/A
    
    clf
    clc
    clear

    %{
    total_average_difference = [0, 0, 0, 0, 0];
    repetitions = 100;

    for i = 1:repetitions
    %}

    N = 1000;
    init_pop = [N, 0, 0, 0, 0];
    half_lives = [2.5e5, 8e4, 1.62e3, 4/365];
    t = linspace(0, 5e5, N);
    [pop, lambda] = simulate_decay(init_pop, half_lives, t);

    % lamba(1-3) are extracted into shorter variable names to make code
    % more readable
    l1 = lambda(1);
    l2 = lambda(2);
    l3 = lambda(3);

    % equations for analytic solution
    N1 = N * exp(-l1 * t);
    N2 = N * (l1/(l2 - l1)) * ((N1 ./ N) - exp(-l2 * t));
    N3 = N * l1 * l2 * ( (exp(-l1*t))/((l1-l2)*(l1-l3)) + exp(-l2*t)/((l2-l3)*(l2-l1)) + exp(-l3*t)/((l3-l1)*(l3-l2)));
    N4 = 0 * t; % in each time step, (500 * 365) / 4 = 45,625 half lives of element 4 pass, so we would never expect to see even a single atom
    N5 = N - (N1 + N2 + N3 + N4); % variable name changed from N4 (lab script suggestion) to N5 (my choice) to reflect that this is the 5th element in the chain, not the 4th

    hold on
    title('Element populations against time over 500,000 years')
    xlabel('Time (years * 10^5)')
    ylabel('Element population')

    % plot data:
    
    plot(t, pop(:, 1));
    plot(t, pop(:, 2));
    plot(t, pop(:, 3));
    plot(t, pop(:, 4));
    plot(t, pop(:, 5));


    % plot theory as black dashed line:
    plot(t, N1, '--k');
    plot(t, N2, '--k');
    plot(t, N3, '--k');
    plot(t, N4, '--k');
    plot(t, N5, '--k');

    legend('Uranium-234', 'Thorium-230', 'Radium-226', 'Radon-226', 'Lead-206', 'Analytic solution')
    legend

    % output final element populations
    pop(end,:)

    %{
    % average difference between computed values and theory
    theoretical_matrix = [N1.', N2.', N3.', N4.', N5.'];
    difference_matrix = abs(pop - theoretical_matrix);
    total_difference = [sum(difference_matrix(:,1)), sum(difference_matrix(:,2)), sum(difference_matrix(:,3)), sum(difference_matrix(:,4)), sum(difference_matrix(:,5))]; 
    average_difference = total_difference / N;

    total_average_difference = total_average_difference + average_difference;

    end

    total_average_difference = total_average_difference / repetitions
    adjusted_total_average = total_average_difference / N
    %}

end