%% hand search

clc; clear; close all;

global K x_10 umax
umax = 1.4; % установка максимального значения управляющего воздействия
x_10 = 1;
tm_min = Inf;
w_0_min = 0;
x_min = [];
t_min = [];

for w_0 = 0:0.2:20.0
    tm = costfunc_modal_control(w_0);
    
    if tm < tm_min
        tm_min = tm;
        w_0_min = w_0;
    end
end

A = [0 1 2; 1 -5 -4; -5 0 0];
b = [2 * w_0_min + 3; 2 * w_0_min ^ 2 - 2; w_0_min ^ 3];
K = A \ b;
[t_min, x_min] = ode45(@odefun3, [0 100], [x_10; 0; 0]);

% Расчет управляющего воздействия u для каждого момента времени
u_min = K(1)*x_min(:,1) + K(2)*x_min(:,2) + K(3)*x_min(:,3);
u_min = arrayfun(@(u) max(min(u, umax), -umax), u_min); % Применяем ограничение

disp(['Минимальное время переходного процесса: ', num2str(tm_min), ' при w_0 = ', num2str(w_0_min)]);
disp(['Коэффициенты K для минимального времени: ', mat2str(K)]);

% Построение графика переменных состояния
figure;
plot(t_min, x_min);
xlabel('Время t');
ylabel('Переменные состояния');
title(['Переходные процессы для w_0 = ', num2str(w_0_min)]);
grid on;

% Построение графика управляющего воздействия u
figure;
plot(t_min, u_min);
xlabel('Время t');
ylabel('Управляющее воздействие u');
title(['График управляющего воздействия для w_0 = ', num2str(w_0_min)]);
grid on;

%% automatic search

clc; clear; close all;
global K x_10 umax
x_10 = 1; % Начальное условие системы
umax = 1.4; % Максимальное управляющее воздействие

w_0_initial = 10; % Начальное значение для оптимизации
[w_0_min, tm_min] = fminsearch(@costfunc_modal_control, w_0_initial);

% Вычисление коэффициентов K для минимального времени после определения w_0_min
A = [0 1 2; 1 -5 -4; -5 0 0];
b = [2 * w_0_min + 3; 2 * w_0_min ^ 2 - 2; w_0_min ^ 3];
K = A \ b; % Сохраняем найденные коэффициенты в K для использования в odefun3

% Решаем систему уравнений с найденным оптимальным w_0 для построения графиков
[t_min, x_min] = ode45(@odefun3, [0 100], [x_10; 0; 0]);

% Расчёт управляющего воздействия u для каждого момента времени
u_min = K(1)*x_min(:,1) + K(2)*x_min(:,2) + K(3)*x_min(:,3);
u_min = min(max(u_min, -umax), umax); % Применение ограничения

disp(['Минимальное время переходного процесса: ', num2str(tm_min), ' при w_0 = ', num2str(w_0_min)]);
disp(['Коэффициенты K для минимального времени: ', mat2str(K)]);

% Построение графика переменных состояния
figure;
plot(t_min, x_min);
xlabel('Время t');
ylabel('Переменные состояния');
title(['Переходные процессы для w_0 = ', num2str(w_0_min)]);
grid on;

% Построение графика управляющего воздействия u
figure;
plot(t_min, u_min);
xlabel('Время t');
ylabel('Управляющее воздействие u');
title(['График управляющего воздействия для w_0 = ', num2str(w_0_min)]);
grid on;
