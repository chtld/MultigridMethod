function [ u ] = exactSolution(l, m, n)
hx = 1/m;
hy = 1/n;
u = zeros((m-1)*(n-1),1);
for i=1:1:m-1
    for j=1:1:n-1
        u((i-1)*(n-1)+j) = i*hx*(1-i*hx)*sin(l*pi*j*hy);
    end
end
end

