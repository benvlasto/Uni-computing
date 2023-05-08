function plotted_data = plot_data(half_life_x, half_life_y)

    N = 100; % Could be any number, but 100 is on the order of the number of time intervals
    
    % Conversion between half life and decay constant
    alpha_x = log(2)/half_life_x;
    alpha_y = log(2)/half_life_y;
    
    X = [];
    Y = [];
    Z = [];
    time = [];
    for year = 0:50
        x = current_x(alpha_x, year, N);
        y = current_y(alpha_x, alpha_y, year, N);
        z = current_z(x, y, N);
    
        X = [X x];
        Y = [Y y];
        Z = [Z z];
    
        time = [time year];
    end
    
    % Saving each set of graphs as .csv files
    plotted_data = [X Y Z];

    hold on
    plot(time, X)
    plot(time, Y)
    plot(time, Z)

end