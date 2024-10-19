function Tpp = costfunc3(w0)

    global A B u delta_v deg_yaw K Tpp

    R = roots([1 1 * w0 2 * w0 ^ 2 w0 ^ 3]);
    K = acker(A, B, R);

    [t, x] = ode45('odefun31', [0 40], [0 0 deg_yaw]);

    u = [];

    for i = 1:length(t)
        u(i) = -K(1) * x(i, 1) - K(2) * x(i, 2) - K(3) * x(i, 3);

        if abs(u(i)) >= delta_v
            u(i) = delta_v * sign(u(i));
        end

    end

    for i = length(t):-1:1

        if abs(x(i, 3)) >= 0.05 * deg_yaw
            Tpp = t(i);
            break
        end

    end

    plot(t, x(:, 1), 'b', t, x(:, 2), 'g', t, x(:, 3), 'r', t, u, 'k')
    xlabel('t, sec')
    grid on
    legend('x1(t)', 'x2(t)', 'x3(t)', 'u(t)')
end
