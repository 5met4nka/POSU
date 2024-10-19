function f = costfunc1(T)

    global TT x a11 a12 a21 a22 b11 b21 deg_yaw t delta_v

    TT = T;
    [t, x] = ode45('odefun12', [0 T(3)], [0 0 deg_yaw]);
    xf = [0 0 0];
    f = (x(length(t), 1) - xf(1)) ^ 2 + (x(length(t), 2) - xf(2)) ^ 2 + (x(length(t), 3) - xf(3)) ^ 2;

    for i = 1:length(t)

        if t(i) < T(1)
            u(i) = -delta_v;
        elseif t(i) < T(2)
            u(i) = delta_v;
        else
            u(i) = -delta_v;
        end

    end

    plot(t, x(:, 1), 'b', t, x(:, 2), 'g', t, x(:, 3), 'r', t, u, 'k')
    grid on
    legend('x1', 'x2', 'x3', 'u')
