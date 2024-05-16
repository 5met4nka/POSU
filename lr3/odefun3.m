function f = odefun3(t, x)
    global K u_max u
    u = K(1) * x(1) + K(2) * x(2) + K(3) * x(3);

    if abs(u) > u_max
        u = u_max * sign(u);
    end

    f = [
        0 * x(1) + 1 * x(2) + 0 * x(3) + 0 * u;
        0 * x(1) + 2 * x(2) - 2 * x(3) + 1 * u;
        0 * x(1) + 0 * x(2) + 1 * x(3) + 3 * u
        ];
end
