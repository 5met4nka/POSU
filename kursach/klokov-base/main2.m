clc
clear
global a11 a12 a21 a22 b11 b21 Um fi t xf x tm tt uu
% Параметры математической модели судна
V0 = 2.57;
L = 99.6;
r21 = -0.58;
r31 = 6.16;
q21 = 0.8;
q31 = -7.23;
s21 = -0.34;
s31 = -3.5;
% Вычисление коэффициентов
Omega = V0 / L; % Нормирующая частота
a11 = -r31 * Omega;
a12 = -q31 * Omega ^ 2;
a21 = -r21;
a22 = -q21 * Omega;
b11 = -s31 * Omega ^ 2;
b21 = -s21 * Omega;
Um = 35 * pi / 180; % ограничение по углу перекладки руля
fi = 10 * pi / 180;
global t x fi tt uu
TT = fminsearch(@fmsfun1, [26.75 55.65 65.5]);

disp('TT = ');
disp(TT);

% Проверка траекторий
figure;
plot(t, x(:, 1), t, x(:, 2), t, x(:, 3), t, uu(:, 1));
legend('x1 - угловая скорость рыскания', 'x2 - угол дрейфа', 'x3 - угол рыскания', 'u - управляющее воздействие');
grid on; xlabel('t, sec'); ylabel('x_1, x_2, x_3, u');
