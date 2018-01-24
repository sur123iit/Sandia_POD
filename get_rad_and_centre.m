function [ xc,yc,R ] = get_rad_and_centre( x,y)
%UNTITLED7 Summary of this function goes here
%   This function calculates centre and radius of curvature from a given
%   set of points represented by [x1 y1; x2 y2; ...]
n1 = length(x);
n2 = length(y);
if n1 == n2
    n = n1;
xx = x.*x;
yy = y.*y;
xy = x.*y;
A = [sum(x) sum(y) n; sum(xy) sum(yy) sum(y); sum(xx) sum(xy) sum(x)];
B = [-sum(xx + yy); -sum(xx.*y + yy.*y); -sum(xx.*x + xy.*y)];
a = A\B;
xc = -0.5*a(1);
yc = -0.5*a(2);
R = sqrt((a(1)^2 + a(2)^2)/4-a(3));
else
    xc = 0;
    yc = 0;
    R = 0;
    disp('length of the two vectors dont match. Please check again and proceed');
end
end

