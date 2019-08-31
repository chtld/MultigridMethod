function f = right_f(eplison, a, l, x, y)
    C1 = eplison*l^2*pi^2-2*a;
    C2 = -eplison*l^2*pi^2;
    C0 = a+2*eplison;
    f = sin(l*pi*y)*(C2*x^2+C1*x+C0);
end