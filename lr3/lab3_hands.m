clear; clc; close
global K u_max
u_max = 1.4;
x10 = 1;
w0 = 4.2383;
A = [0 1 2; 1 -5 -4; -5 0 0];
b = [2 * w0 + 3; 2 * w0 ^ 2 - 2; w0 ^ 3];
K = A \ b;
[t, x] = ode45('odefun3', [0 10], [x10 0 0]);

for i = length(t):-1:1

    if (abs(x(i, 2))) > x10 * 0.05
        t_min = t(i);
        break
    end

end

disp("Минимальное время переходного процесса");
disp(t_min);
disp("Коэффициенты регулятора");
disp(K)
plot(t, x);
