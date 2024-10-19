function f = odefun31(t, x)

    global u a11 a12 a21 a22 b11 b21 delta_v K

    u = -K(1) * x(1) - K(2) * x(2) - K(3) * x(3);

    if abs(u) >= delta_v
        u = delta_v * sign(u);
    end

    f = [(a11 * x(1) + a12 * x(2) + b11 * u); (a21 * x(1) + a22 * x(2) + b21 * u); (x(1))];
end
