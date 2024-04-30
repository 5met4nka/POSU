function f = costfunc_4(psi)

    rp_ode = @(t, x) [x(2) + 0.5 * (x(3) + x(4)); -2 * x(2) + 0.5 * (x(3) + x(4)); 0; 2 * x(4) - x(3)]
    [t, x] = ode45(rp_ode, [0 1.8], [1 0 psi(1) psi(2)]);
    
    f = x(end, 1) * x(end, 1) + x(end, 2) * x(end, 2);
    
    plot(t, x(:, 1), t, x(:, 2), t, 0.5 * (x(:, 3) + x(:, 4)), '--'), pause(1)
end
