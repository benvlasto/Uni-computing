function Y = current_y(alpha_x, alpha_y, t, N)

    if alpha_x == alpha_y
        Y = N * alpha_x * t * exp(-alpha_x * t);
    else
        Y = N * alpha_x * (exp(-alpha_x * t) - exp(-alpha_y * t))/(alpha_y - alpha_x);
    end

end