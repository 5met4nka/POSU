clc; clear;

% t1 = 0.6931; T = 1.3863;
% u_t = @(t)[1.5 * ((t >= t1) - (t < t1))];
% rp_ode = @(t, x)[-x(1) + x(2); u_t(t)];
% [T, Y] = ode23(rp_ode, [0 T], [1.5; 0])
% plot(T, Y, T, u_t(T), '--')
% disp(Y(end, :))

% Topt = fminsearch('costfunc_5', [4 4])

Um = 1.5, x10 = 1.5,
rp_ode_str = @(t, x)[-x(1) + x(2); -Um]
rp_ode_inv = @(t, x)[-x(1) + x(2); +Um]
[t1, y1] = ode45(rp_ode_str, [0 2.138], [x10 0])
[t2, y2] = ode45(rp_ode_inv, [1.61 0], [0 0])
figure(1)
plot(y1(:, 1), y1(:, 2), 'r--', y2(:, 1), y2(:, 2))
Xcross = ginput(1)
figure(2), plot(t1, y1(:, 1) - Xcross(1), t1, y1(:, 2) - Xcross(2))
figure(3), plot(t2, y2(:, 1) - Xcross(1), t2, y2(:, 2) - Xcross(2))
for i = 1:length(t1)
    [g, j] = min(abs(y2(:, 1) - y1(i, 1)))
    Y(i) = y1(i, 2) - y2(j, 2)
end
[g, i] = min(abs(Y(:)))
t1 = t1(i)
[g, j] = min(abs(y2(:, 1) - y1(i, 1)))
t2 = 1.6 - t2(j)
t = t1
T = t1 + t2
f = costfunc_5([t, T])
