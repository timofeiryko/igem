% Parameters
p.CN = 17;
p.d1 = log(2)/3
p.d2 = 0.02
p.k2 = 8.23
p.k1 = 1.19

tfin = 60*3;
step = 0.1;
tspan = 0:step:tfin-step;

opti = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

Init = [0 0];

[t0, x0] = ode23t(@(t, x) model_const(t, x, p), tspan, Init, opti);

plot(t0, x0);

function [dxdt] = model_const(t, x, p)
    dxdt(1,1) = p.CN*p.k1-p.d1*x(1);
    dxdt(2,1) = p.k2*x(1)-p.d2*x(2);
end