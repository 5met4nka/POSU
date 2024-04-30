function Tpp = cost_m3(w0)

    a = [0 -1 -2; -1 5 4; 5 0 0];
    b = [2 * w0 + 3; 2 * w0 ^ 2 - 2; w0 ^ 3];
    K = a \ b;
    
    A = [0 1 0; 0 2 -2; 0 0 1];
    B = [0; 1; 2];
    
    Umax = 1.4
    u_t = @(x) (K' * x) * (abs(K' * x) < Umax) + Umax * sign(K' * x) * (abs(K' * x) >= Umax);
    rp_ode = @(t, x) [A * x + B * u_t(x)];
    [T, Y] = ode45(rp_ode, [0 10], [1; 0; 0]);
    
    U = (Y * K) .* (abs(Y * K) < Umax) + Umax * sign(Y * K) .* (abs(Y * K) >= Umax);
    plot(T, Y, T, U, '--')
    
    for i = length(T):-1:1

        if abs(Y(i, 1)) > 0.05
            Tpp = T(i);
            break
        end

    end
