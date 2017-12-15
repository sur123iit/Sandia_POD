function [ a2 ] = chk_ros_indx( a1,N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   a1 is the array which comes from ros_freq function
%   N is the length of one sided spectrum
[n1,n2] = size(a1);
a2 = zeros(n1,1);
Fs = input('Enter the sampling frequency');
Fs = Fs/2;
df = Fs/N;
for i = 1:n1
    a2(i,1) = round(a1(i,1)/df)+ 1;
end
end

