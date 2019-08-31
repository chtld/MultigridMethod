function [ B ] = diagonalB( a, b, c, n )
%GETB 此处显示有关此函数的摘要
%   此处显示详细说明
B=zeros(n-1,n-1);
for i = 2: 1: n-2
    B(i, i-1: i+1) = [a, b, c];
end
B(1, 1: 2) = [b c];
B(n-1, n-2: n-1) = [a, b];
end

