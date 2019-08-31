clc
clear
close all
format long e
epsilon = 0.01;
a = 0.1;
l = 1;
n = 32;
multigrid2(epsilon, a, n, l);
fprintf('...............................\n');
%%%%%%%%%%%%%%%%%%%%%%%%
epsilon = 0.1;
a = 1;
l = 3;
n = 64;
multigrid2(epsilon, a, n, l);
fprintf('...............................\n');
%%%%%%%%%%%%%%%%%%%%%%%%%
epsilon = 1;
a = 10;
l = 16;
n = 128;
multigrid2(epsilon, a, n, l);
fprintf('...............................\n');