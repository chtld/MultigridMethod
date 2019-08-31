function [ v ] = Vcycle( n, F, v0 ,epsilon, a)
m = n;
A = totalA(epsilon, a, m, n);
v = dampedJacobi(A, F, v0, 5);
if n==4
    return;
end
if n==8
    r = F-A*v;
    r2h = I_h_2h(n)*r;
    v0 = zeros((m/2-1)*(n/2-1),1);
    e2h = Vcycle(n/2, r2h, v0,epsilon,a);
    e = get_I_2h_to_h(n/2)*e2h;
    v = v+e;
end
if n==16
    r = F-A*v;
    r2h = I_h_2h(n)*r;
    v0 = zeros((m/2-1)*(n/2-1),1);
    e2h = Vcycle(n/2, r2h, v0,epsilon,a);
    e2h = Vcycle(n/2, r2h, e2h,epsilon,a);
    e = get_I_2h_to_h(n/2)*e2h;
    v = v+e;
end
if n==64
    r = F-A*v;
    r2h = I_h_2h(n)*r;
    v0 = zeros((m/2-1)*(n/2-1),1);
    e2h = Vcycle(n/2, r2h, v0,epsilon,a);
    e2h = Vcycle(n/2, r2h, e2h,epsilon,a);
    e = get_I_2h_to_h(n/2)*e2h;
    v = v+e;
end
r = F-A*v;
r2h = I_h_2h(n)*r;
v0 = zeros((m/2-1)*(n/2-1),1);
e2h = Vcycle(n/2, r2h, v0,epsilon,a);
e = get_I_2h_to_h(n/2)*e2h;
v = v+e;
end

