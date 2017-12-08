function [x,y] = getxy(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[a, ~] = importdata('Y:\Data\PulsePIV_2015\pbl_cavity15_export\denoise_run=008_Cycle=00001\B00001.dat');
b = a.data;
x = b(1:106,1);
y = b(1:106:3180,2);
end

