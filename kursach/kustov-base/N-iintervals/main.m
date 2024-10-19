%% 1. Ручной поиск
clear, clc;
global A B u t1 t2 T a11 a12 a21 a22 b11 b21 delta_v deg_yaw

v0 = 5.65;
L = 51;
r21 = -0.59;
r31 = 5.32;
q21 = 0.94;
q31 = -2.41;
s21 = -0.29;
s31 = -3.4;

% расчет параметров модели
Omega = v0 / L % нормирующая частота
a11 = -r31 * Omega
a12 = -q31 * Omega ^ 2
a21 = -r21
a22 = -q21 * Omega
b11 = -s31 * Omega ^ 2
b21 = -s21 * Omega

A = [a11 a12 0; a21 a22 0; 1 0 0]
B = [b11; b21; 0]
delta_v = deg2rad(35);
deg_yaw = deg2rad(10);
rp_ode_inv = @(t, x) [- (a11 * x(1) + a12 * x(2) + b11 * (-delta_v)); - (a21 * x(1) + a22 * x(2) + b21 * (-delta_v)); - (x(1))];

[t_r, x_r] = ode45(rp_ode_inv, [0 2.5], [0 0 0]);
plot(x_r(:, 1), x_r(:, 2), 'r--', 'LineWidth', 1.5)
hold on

t1 = 3
t2 = 6.45
T = 9.5

[t, x] = ode45(@odefun11, [0 T], [0 0 deg_yaw]);
plot(x(:, 1), x(:, 2), 'b', 'LineWidth', 1)
grid on
xlabel("x_2")
ylabel("x_1")
title("Фазовые траектории в прямом и обратном времени")
legend("Обратное время", "Прямое время");

x_end = x(end, :)

%% 2. Автоматический поиск

global A B u t1 t2 T a11 a12 a21 a22 b11 b21 delta_v deg_yaw
V0 = 5.65;
L = 51;
r21 = -0.59;
r31 = 5.32;
q21 = 0.94;
q31 = -2.41;
s21 = -0.29;
s31 = -3.4;

W = V0 / L;
a11 = -r31 * W;
a12 = -q31 * W ^ 2;
a21 = -r21;
a22 = -q21 * W;
b11 = -s31 * W ^ 2;
b21 = -s21 * W;

A = [a11 a12 0; a21 a22 0; 1 0 0]
B = [b11; b21; 0]
delta_v = deg2rad(35);
deg_yaw = deg2rad(10);

t0 = [7.1787, 13.169, 14.192]
T = fminsearch('costfunc1', t0)
x_end = x(end, :)
