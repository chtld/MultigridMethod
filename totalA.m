function [ A ] = totalA(epsilon, a, m, n)
hx = 1/m;
hy = 1/n;
h = hx;
B_a = -epsilon/(h^2); B_b = 4*epsilon/(h^2); B_c = -epsilon/(h^2);
C_a = -epsilon/(h^2)-a/(2*h);
D_a = -epsilon/(h^2)+a/(2*h);
B = diagonalB(B_a, B_b, B_c, n);
C = lowBlockC(C_a, n);
D = upBlockD(D_a, n);
A = zeros((m-1)*(n-1));
for i = 2: 1: m-2
    row = -(i-1)*(n-1)-1+ i*(n-1);
    column = -(i-2)*(n-1)-1+ (i+1)*(n-1);
    A((i-1)*(n-1)+1: i*(n-1), (i-2)*(n-1)+1: (i+1)*(n-1)) = [C B D];
end
A(1: (n-1), 1: 2 * (n-1)) = [B, D];
A((m-2)*(n-1)+1: (m-1)*(n-1), (m-3)*(n-1)+1: (m-1)*(n-1))=[C B];

end

