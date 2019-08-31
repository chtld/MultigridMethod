function [ v ] = dampedJacobi( A, f, v0, k)
 %[v,flag,relres,iter,resvec] = bicgstab(A,f,1e-6,k,[],[],v0);
[row, column] = size(A);
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
H = inv(D);
Rj = H*(-L-U);
w = 2/3;
G = (1-w)*eye(row);
for i = 1: 1: k
    v = (G+w*Rj)*v0+w*H*f;
    v0 = v;
end
end

