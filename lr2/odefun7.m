function f = odefun7(t, x)
    global t1 umax t_max;

    if t < t1
        u = umax * t / t1;
    else
        u = umax * (t_max - t) / (t_max - t1);
    end

    f = -0.15 * x + u;
