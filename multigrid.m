function multigrid(epsilon, a, n, l)
hx=1/n;
hy=1/n;
u = exactSolution(l, n, n);
v0 = zeros((n-1)*(n-1),1);
i = 0; 
v = v0;
fprintf('n=%d\n',n);
fprintf('r_L2          e_L2\n');
A = totalA(epsilon, a, n, n);
F = rightF(@right_f, epsilon, a, l, n, n);
A2h = totalA(epsilon, a, n/2, n/2);
k=0;
while(norm((u-v),inf)>(1e-6))
k=k+1;
if(k>10) break;
end;
%v0 = zeros((n-1)*(n-1),1);
%v = danpedJacobi(A, F, v0, 1000);
%v = A\F;
v = dampedJacobi(A, F, v0, 3);
r = F-A*v;
%G = I_h_2h(n);
r2h = I_h_2h(n)*r;
%r2h = get_I_h_to_2h(n)*r;
e0 = zeros((n/2-1)*(n/2-1),1);
e2h = dampedJacobi(A2h, r2h, e0, 5);
e = I_2h_h(n)*e2h;
%e = get_I_2h_to_h(n/2)*e2h;
v = v+e;
v0 = v;
i = i+ 1;
plr = norm(F-A*v, 2);
ple = norm(u-v, 2);
fprintf('%13.9f    %13.9f\n',plr,ple)
end
g = [v, u];
plx =zeros(n-1);
ply =zeros(n-1);
for i=1:1:n-1
   for j=1:1:n-1
      plu(i,j) = u((i-1)*(n-1)+j);
      plv(i,j) = v((i-1)*(n-1)+j);
      ply(:,j) = [hx:hx:(n-1)*hx];
   end
   plx(i,:) = [hy:hy:(n-1)*hy]';
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
