clc, clear

% psi10 =- (20 * (exp(18/5) + 1)) / (9 * (2 * exp(18/5) + 7));
% psi20 =- (10 * (exp(18/5) - 5)) / (9 * (2 * exp(18/5) + 7));
% u_t = @(t)[0.75 * psi10 + (0.5 * psi20 - 0.25 * psi10) * exp(2 * t)];
% rp_ode = @(t, x) [x(2) + u_t(t); -2 * x(2) + u_t(t)];
% [T, Y] = ode45(rp_ode, [0 1.8], [1; 0]);
% plot(T, Y, T, u_t(T), '--')
% disp(Y(end, :))

psi = fminsearch('costfunc_4', [1; 1])
