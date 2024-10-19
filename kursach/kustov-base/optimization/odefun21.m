function f = odefun21(t, x, Kn)

    global A B delta_v

    u = -Kn(1) * x(3) - Kn(2) * x(1);

    if abs(u) >= delta_v
        u = delta_v * sign(u);
    end

    f = A * x + B * u;
