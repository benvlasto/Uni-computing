clear
clc
clf

% half_life_x = input("Half-life of x: ");
% half_life_y = input("Half-life of y: ");

half_lives = readmatrix("half_lives.txt");
half_life_x = half_lives(:,1);
half_life_y = half_lives(:,2);

for i = 1:length(half_life_x)

    plotted_data = plot_data(half_life_x(i),half_life_y(i))

    % Save data to .csv file
    filename = string(i);
    writematrix(plotted_data, filename)
        
    % Plot each set of graphs in a new figure, without creating an empty
    % figure at the start or end
    if i ~= length(half_life_x)
        figure
    end

end