function f = odefun2(t, x)

    global a11 a12 a21 a22 b11 b21 Um tt

    t1 = tt(1);
    t2 = tt(2);
    T = tt(3);

    if t < t1
        u = -Um;
    elseif t < t2
        u = Um;
    else
        u = -Um;
    end

    if t > T
        u = 0;
    end

    f = [a11 * x(1) + a12 * x(2) + b11 * u; a21 * x(1) + a22 * x(2) + b21 * u; x(1)];
end
