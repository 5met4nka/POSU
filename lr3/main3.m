clc, clear, close;
global K
u_max = 1.4;
x_10 = 1;
tm_min = Inf;
w_0_min = 0;

for w_0 = 0:0.2:10.0
    A = [0 1 2; 1 -5 -4; -5 0 0];
    b = [2 * w_0 + 3; 2 * w_0 ^ 2 - 2; w_0 ^ 3];
    K = A \ b;
    [t, x] = ode45('odefun3', [0 100], [x_10; 0; 0]);
    
    for i = length(t):-1:1
        if abs(x(i, 1)) > 0.05 * x_10
            tm = t(i);
            break
        end
    end
    
    if tm < tm_min
        tm_min = tm;
        w_0_min = w_0;
    end
end

disp(['Минимальное время переходного процесса: ', num2str(tm_min), ' при w_0 = ', num2str(w_0_min)]);

% Повторное решение системы уравнений с w_0, давшим минимальное время переходного процесса
A = [0 1 2; 1 -5 -4; -5 0 0];
b = [2 * w_0_min + 3; 2 * w_0_min ^ 2 - 2; w_0_min ^ 3];
K = A \ b;
[t_min, x_min] = ode45('odefun3', [0 100], [x_10; 0; 0]);

% Построение графиков переходных процессов для переменных состояния
figure;
plot(t_min, x_min);
xlabel('Время t');
ylabel('Переменные состояния');
title(['Переходные процессы для w_0 = ', num2str(w_0_min)]);
grid on;
