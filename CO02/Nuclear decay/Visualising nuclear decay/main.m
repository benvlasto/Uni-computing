clear
clc
clf

X = 100;
Y = 0;
Z = 0;

alpha_x = log(2)/2;
alpha_y = log(2)/16;

p_x_decay = 1 - exp(-alpha_x);
p_y_decay = 1 - exp(-alpha_y);

hold on
for T = 0:50

    scatter(T, X, 10, "r", "filled")
    scatter(T, Y, 10, "g", "filled")
    scatter(T, Z, 10, "b", "filled")
    pause(0.2)

    for i = 1:X
        if rand < p_x_decay
            X = X - 1;
            Y = Y + 1;
        end
    end
    
    for i = 1:Y
        if rand < p_y_decay
            Y = Y - 1;
            Z = Z + 1;
        end
    end

end