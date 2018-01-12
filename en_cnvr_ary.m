function [conv_array] = en_cnvr_ary(frac_array)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% you need to input fraction array and not the actual array here
%  The form of fractional array must be N1x1
[N1,N2] = size(frac_array);
sum1 = 0;
conv_array = zeros(N1,1);
for i = 1:N1
    sum1 = sum1 + frac_array(i,1);
    conv_array(i,1) = sum1;
end
end

