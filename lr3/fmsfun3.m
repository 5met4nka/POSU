function [tm] = fmsfun3(w0)
    global K
    um = 1.4;
    x10 = 1;
    A = [
        0 1 0;
        0 2 -2;
        0 0 1
        ];
    B = [0; 1; 2];
    polynom = [1 2 * w0 2 * w0 ^ 2 w0 ^ 3];
    p = roots(polynom);
    K = acker(A, B, p)
    [t, x] = ode45('odefun3', [0 10], [x10 0 0]);
    tm = [];

    for j = 1:3

        for i = length(t):-1:1

            if abs(x(i, j)) > 0.05 * x10
                tm = [tm t(i)];
                break
            end

        end

    end

    tm = max(tm)

    for i = 1:length(t)
        u(i) = K(1) * x(i, 1) + K(2) * x(i, 2) + K(3) * x(i, 3);

        if abs(u(i)) > um
            u(i) = sign(u(i)) * um;
        end

    end

    figure(1)
    subplot(2, 1, 1)
    plot(t, x)
    title(sprintf('Переходные процессы при w_0=%.4f, t_п = %.4f', w0, tm))
    xlabel('t')
    ylabel('x(t)')
    grid on
    legend('x1(t)', 'x2(t)', 'x3(t)')
    subplot(2, 1, 2)
    plot(t, u)
    xlabel('t')
    ylabel('u(t)')
    title('Входное воздействие')
    legend('u(t)')
    grid on
end
