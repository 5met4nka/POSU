function f = odefun11(t, x)

    global u t1 t2 T a11 a12 a21 a22 b11 b21 delta_v

    if t < t1
        u = -delta_v;
    elseif t < t2
        u = delta_v;
    else
        u = -delta_v;
    end

    if t > T
        u = 0;
    end

    f = [(a11 * x(1) + a12 * x(2) + b11 * u); (a21 * x(1) + a22 * x(2) + b21 * u); (x(1))];
