function [pop, lambda] = simulate_decay(init_pop, half_lives, t)

    % Author: Ben Vlasto , Date: 21/02/2022

    % Simulating decay of D elements given the initial population, half lives, and the time grid.
    % Input/output vectors in this function are sorted with the first element decays to the second
    % element, then to the third element, and so on until the last element.

    % Input:
    % * init_pop: D−elements vector of the initial population of each element, sorted
    % such that the stable element is at the last.
    % * half_lives: (D−1)−elements vector of half lives of each element.
    % * t: N−elements vector of the time grid where the population is returned.
    
    % Output:
    % * pop: (N x D) matrix that contains the population of each element in every time step.
    % * lambda: (D-1)-elements vector of each element's lambda, used to
    % plot analytic solution

    % Example use:
    % >> init_pop = [1000, 0, 0, 0, 0];
    % >> half_lives = [2.5e5, 8e4, 1.62e3, 4/365];
    % >> t = linspace(0, 5e5, N);
    % >> [pop, lambda] = simulate_decay(init_pop, half_lives, t);
    % >> plot(t, pop(:,1)); % plot the population of the 1st element vs time

    N = init_pop(1);
    D = 5;

    sz = size(t);
    delta_t = 5e5 * sz(1) / N;

    lambda = log(2) ./ half_lives;

    prob_decay = 1 - exp(-lambda .* delta_t);

    pop = zeros(N,D);
    pop(1,:) = init_pop;

    for row = 2:N
        pop(row, :) = new_row(pop(row-1, :), prob_decay);
    end

end