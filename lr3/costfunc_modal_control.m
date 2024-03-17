function tm = costfunc_modal_control(w_0)
    global K x_10
    x_10 = 1;
    
    A = [0 1 2; 1 -5 -4; -5 0 0];
    b = [2 * w_0 + 3; 2 * w_0 ^ 2 - 2; w_0 ^ 3];
    K = A \ b;
    [t, x] = ode45(@odefun3, [0 100], [x_10; 0; 0]);
    
    tm = t(end);
    for i = length(t):-1:1
        if abs(x(i, 1)) > 0.05 * x_10
            tm = t(i);
            break;
        end
    end
end
