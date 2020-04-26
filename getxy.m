function [x,y] = getxy(  )
%UNTITLED3 Summary of this function goes here
%   Gives x and y values of the cavity for Sandia_POD
[a, ~] = importdata('X:\Data - Surabhi\Sandia_cavity\B00001.dat');
b = a.data;
x = b(1:106,1);
y = b(1:106:3180,2);
x = x*10^-3;
y = y*10^-3;
end

