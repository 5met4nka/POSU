%% static

clear, clc, close all

param = fminsearch(@(x) - costfunc(x), [0 0])
F_max = costfunc([param(1) param(2)])
x1 = -5:0.1:5;
x2 = 5:-0.1:-5;
[X1, X2] = meshgrid(x1, x2);
Z = X1 .^ 2 + X2 .^ 2 - X1 - X2 + 1;
F = exp(-0.1 * Z) .* cos(Z);
figure(1)
contour(X1, X2, F, 'ShowText', 'on')
grid on
hold on
plot(param(1), param(2), '-s', 'MarkerSize', 9, 'MarkerEdgeColor', 'red', 'MarkerFaceColor', [1 .6 .6])
figure(2)
surf(X1, X2, F)
xlabel('x')
ylabel('y')
zlabel('z')

%% dynamic

clear, clc, close all

global t t1 x x0 u t_max;
t1 = 6;
x0 = 10;
t_max = 9;
um = fminsearch(@fmsfun7, 0)
plot(t, x, t, u);
xlabel('t'); ylabel('x, u');
legend('x(t)', 'u(t)');
axis([0 t_max -2 10]);
grid on;
