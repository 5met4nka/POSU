clc, clear, close all

global K tm

x0 = [1 0 0];
u_max = 1.4;
[t, x] = ode45('odefun2', [0 10], x0);

w0 = fminsearch(@fmsfun3, 1)
