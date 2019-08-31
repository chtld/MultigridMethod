function multigrid2(epsilon,a,n,l)
% epsilon = 0.01;
% a = 0.1;
% l = 1;
% n = 32;
m = n;

% v0 = zeros((m-1)*(n-1),1);
% for i=1:1:15
% A = totalA(epsilon, a, m, n);
% F = rightF(@right_f, epsilon, a, l, m, n);
% %v0 = zeros((m-1)*(n-1),1);
% %v = dampedJacobi(A, F, v0, 1000);
% %v = A\F;
% v = dampedJacobi(A, F, v0, 20);
% r = F-A*v;
% G = I_h_2h(n);
% r2h = I_h_2h(n)*r;
% v0 = zeros((m/2-1)*(n/2-1),1);
% A2h = totalA(epsilon, a, m/2, n/2);
% e2h = dampedJacobi(A2h, r2h, v0, 20);
% e = I_2h_h(n)*e2h;
% v = v+e;
% v0 = v;
% end
u = exactSolution(l, m, n);
v0 = zeros((m-1)*(n-1),1);
v = v0;
i = 0;
A = totalA(epsilon, a, m, n);
F = rightF(@right_f, epsilon, a, l, m, n);
while(norm((u-v),inf)>(1e-6))
v = Vcycle(n, F, v0, epsilon, a);
v0 = v;
i = i+ 1;
if i>20
    break;
end
fprintf('%e          %e          %e\n',norm(F-A*v,2),norm(u-v,2),norm(u-v,inf));
end
plx =zeros(n-1);
ply =zeros(n-1);
for i=1:1:n-1
   for j=1:1:n-1
      plu(i,j) = u((i-1)*(n-1)+j);
      plv(i,j) = v((i-1)*(n-1)+j);
      ply(:,j) = [1/n:1/n:(n-1)*1/n];
   end
   plx(i,:) = [1/n:1/n:(n-1)*1/n]';
end
%plot(1:size(v),v,'*r');
%hold on
%plot(1:size(u),u)
figure
mesh(plx, ply, plu);
%hold on
figure
mesh(plx, ply, plv)
end

