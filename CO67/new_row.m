function [row] = new_row(row_above, prob_decay)

    % Author: Ben Vlasto , Date: 21/02/2022

    % Calculates the population of each element after one time step, given
    % the initial element populations and the probability of each element
    % decaying in the time step.

    % Input:
    % * row_above: D-elements vector containing the population of each
    % element in the previous time step.
    % * prob_decay: (D-1)-elements vector containing the probability of
    % each of the unstable elements decaying in the time step.
    
    % Output:
    % * row: D-elements vector containing the new populations of each
    % element.

    % Example use:
    % >> row_above = [804, 134, 2, 0, 60];
    % >> prob_decay = [0.0014, 0.0043, 0.1926, 1.0000];
    % >> updated_row = new_row(row_above, prob_decay);
    % >> pop(row + 1, :) = updated_row;

    row = row_above;
    for element = 1:4
        for i = 1:row(element)
            rand_num = rand(1);
            if rand_num < prob_decay(element)
                row(element) = row(element) - 1;
                row(element + 1) = row(element + 1) + 1;
            end
        end
    end

end