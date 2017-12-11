function [ ] = chk_psv_th( a,psd_a )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%   a: has to be a column vector i.e Nx1
%   psd_a: has to be a column vector i.e. (N/2)x1
sum1 = sum(a.^2);
sum2 = sum(psd_a);
disp(sum1/sum2);
if chk_psv == 1
    disp('Ok!');
else
    disp('Not Ok. Check!');
end
end

