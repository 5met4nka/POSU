clear, clc, close all

syms t
time = 0:0.1:30;

hand_x1 = -0.590158 * exp(-1.71135 * time) - 0.409842 * exp(-0.144327 * time) .* cos(1.86686 * time) - 0.572697 * exp(-0.144327 * time) .* sin(1.86686 * time);
hand_x2 = 0.504999 * exp(-1.71135 * time) - 0.504999 * exp(-0.144327 * time) .* cos(1.86686 * time) + 0.42387 * exp(-0.144327 * time) .* sin(1.86686 * time);
hand_x3 = -0.864231 * exp(-1.71135 * time) + 0.864231 * exp(-0.144327 * time) .* cos(1.86686 * time) + 0.881586 * exp(-0.144327 * time) .* sin(1.86686 * time);

% ODE45 method

x10 = -1; x20 = 0; x30 = 0; tm = 30;
fun = @(t, x)[2 * x(2); x(3); -3 * x(1) - 4 * x(2) - 2 * x(3)];
[t, x] = ode45(fun, [0, tm], [x10, x20, x30]);

figure(1)
subplot(3, 1, 1)
plot(t, x(:, 1), 'm', time, hand_x1, 'om', 'MarkerSize', 2)
grid on
title('x1(t)')
legend('ODE45', 'hand')
xlabel('t'), ylabel('x1')
subplot(3, 1, 2)
plot(t, x(:, 2), 'm', time, hand_x2, 'om', 'MarkerSize', 2)
grid on
title('x2(t)')
legend('ODE45', 'hand')
xlabel('t'), ylabel('x2')
subplot(3, 1, 3)
plot(t, x(:, 3), 'm', time, hand_x3, 'om', 'MarkerSize', 2)
grid on
title('x3(t)')
legend('ODE45', 'hand')
xlabel('t'), ylabel('x3')
