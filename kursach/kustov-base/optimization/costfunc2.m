function f = costfunc2(Kn)

    global delta_v delta_yaw x

    [t, x] = ode45(@(t, x) odefun21(t, x, Kn), [0 20], [0 0 delta_yaw]);

    for i = length(t):-1:1

        if abs(x(i, 3)) > 0.05 * delta_yaw
            f = t(i);
            break;
        end

    end

    u = [];

    for i = 1:length(t)

        u(i) = -Kn(1) * x(i, 3) - Kn(2) * x(i, 1);

        if abs(u(i)) >= delta_v
            u(i) = delta_v * sign(u(i));
        end

    end

    plot(t, x(:, 1), 'b', t, x(:, 2), 'g', t, x(:, 3), 'r', t, u, 'k')
    grid on
    legend('x1', 'x2', 'x3', 'u')
    xlabel('t,sec')
