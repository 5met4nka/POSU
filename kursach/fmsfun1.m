
function f = fmsfun1(TT)
    global tt t x fi Um uu
    if TT(1) >= TT(2) || TT(2) >= TT(3)
        f = inf; % наказание за нарушение условия
        return;
    end
    tt = TT;
    [t, x] = ode45(@odefun2, [0 TT(3)], [0 0 fi]);
    f = x(length(t), 1)^2 + x(length(t), 2)^2 + x(length(t), 3)^2; 
    uu = zeros(length(t), 1);
    for i = 1:length(t)
        if t(i) < tt(1)
            u = -Um;
        elseif t(i) < tt(2)
            u = Um;
        else
            u = -Um;
        end
        if t(i) > tt(3)
            u = 0;
        end
        uu(i, 1) = u;
    end
    % Сохранение uu для основной программы
    assignin('base', 'uu', uu);
end