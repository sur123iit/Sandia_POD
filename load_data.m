function [ Ma,L,D ] = load_data( opn )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Ma = 0;
L = 0;
D = 0;
if opn == 1
    Mach = 0.8;
    L = 127*10^-3;
    D = 25.4*10^-3;
end
if opn == 2
    Mach = 0.6;
    L = 127*10^-3;
    D = 25.4*10^-3;
end
if opn == 3
    Mach = 0.94;
    L = 127*10^-3;
    D = 25.4*10^-3;
end

end

