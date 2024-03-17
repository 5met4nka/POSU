function f = odefun3(t, x)
    global K u_max u
    u = -K(1) * x(1) - K(2) * x(2) - K(3) * x(3);

    if abs(u) > u_max
        u = u_max * sign(u);
    end

    f = [x(2); 2 * x(2) - 2 * x(3) + u; x(3) + 2 * u];
end
