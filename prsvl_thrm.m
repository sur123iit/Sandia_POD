function [kt,kf] = prsvl_thrm( ut,uf )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
kt(:,1) = ut.*ut;
kf(:,1) = uf;
sum1 = sum(kt);
sum2 = sum(kf);
disp(sum1/sum2);
if sum1 == sum2
    res = 0;
else
    res = 1;
end
end