function [ r_freq ] = Ros_freq(Ma,n,L)
%UNTITLED5 Summary of this function goes here
%   Ma: mach number of the flow
%   n: how many Rossiter frequencies you require
%   k: empirical constant
%   a: phase difference
%   y: Ratio of specific heats of air 
%   r_freq: Rossiter frequencies
k = 0.57;
a = 0.25;
y = 1.4;
r_freq = zeros(n,1);
for i = 1:n
    r_freq(i,1) = (i - a)/(Ma/sqrt(1+((y-1)/2)*Ma^2)+1/k);
end
Uinf = Ma*340;
r_freq = r_freq*Uinf/L;
end