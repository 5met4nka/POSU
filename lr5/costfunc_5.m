function [z] = costfunc_5(Tt)
    
    t1 = Tt(1); T = Tt(2);
    u_t = @(t)[1.5 * ((t >= t1) - (t < t1))];
    rp_ode = @(t, x)[-x(1) + x(2); u_t(t)];
    [T, Y] = ode23(rp_ode, [0 T], [1.5; 0]);
    z = Y(end, 1) ^ 2 + Y(end, 2) ^ 2;
    plot(T, Y, T, u_t(T), '--')

end
