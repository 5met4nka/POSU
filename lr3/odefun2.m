function f = odefun2(t, x)
    global K u_max
    u = -K(1) * x(1) - K(2) * x(2) - K(3) * x(3);

    if abs(u) > u_max
        u = u_max * sign(u);
    end

    A = [
        0 1 0;
        0 -2 2;
        0 0 1
        ];
    B = [0; 1; 2];
    f = A * x + B * u;
end
