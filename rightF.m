function [ F ] = rightF(right_f, eplison, a, l, m, n )
hx = 1/m;
hy = 1/n;
F =zeros((m-1)*(n-1), 1);
for i = 1: 1: m-1
   for j = 1: 1: n-1
       F((n-1)*(i-1)+j) = right_f(eplison, a, l, i*hx, j*hy);
   end
end

end


