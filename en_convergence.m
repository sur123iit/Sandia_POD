function [ b ] = en_convergence( a )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
[N1,N2] = size(a);
b = zeros(N1,1);
for i = 1:N1
    sum = sum + a(i,1);
    b(i,1) = sum;
end
end