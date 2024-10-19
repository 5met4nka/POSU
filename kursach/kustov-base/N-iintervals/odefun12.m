function f = odefun12(t, x)

    global TT a11 a12 a21 a22 b11 b21 delta_v

    if t < TT(1)
        u = -delta_v;
    elseif t < TT(2)
        u = delta_v;
    else
        u =- delta_v;
    end

    f = [(a11 * x(1) + a12 * x(2) + b11 * u); (a21 * x(1) + a22 * x(2) + b21 * u); (x(1))];
