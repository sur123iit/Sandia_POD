function [ mode_frequencies,mode_growthrate ] = freq_growth( dmd_evals1 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
dt = 10.2*(10^-3)/386;
mode_frequencies = angle(dmd_evals1)/(2*pi*dt);
mode_growthrate = log(abs(dmd_evals1))/dt;


end

