function f = fmsfun7(um)
    global t t1 x x0 u umax t_max;
    umax = um;
    t = []; x = []; u = [];
    [t, x] = ode45(@odefun7, [0 t_max], x0);

    for i = 1:length(t)

        if t(i) < t1
            u(i) = umax * t(i) / t1;
        else
            u(i) = umax * (t_max - t(i)) / (t_max - t1);
        end

    end

    f = x(length(t)) * x(length(t));
