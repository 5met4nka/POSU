function f = costfunc(x)
    z = x(1) ^ 2 + x(2) ^ 2 - x(1) - x(2) + 1;
    f = exp(-0.1 * z) * cos(z);
