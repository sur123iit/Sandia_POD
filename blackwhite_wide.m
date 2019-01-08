function c = blackwhite_wide(m)
%REDBLUE    Shades of red and blue color map
%   REDBLUE(M), is an M-by-3 matrix that defines a colormap.
%   The colors begin with bright blue, range through shades of
%   blue to white, and then through shades of red to bright red.
%   REDBLUE, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(redblue)
%
%   See also HSV, GRAY, HOT, BONE, COPPER, PINK, FLAG, 
%   COLORMAP, RGBPLOT.

%   Adam Auton, 9th October 2009

if nargin < 1, m = size(get(gcf,'colormap'),1); end

if (mod(m,2) == 0)
<<<<<<< HEAD
    % From [1 1 1] to [0 1 0] to [0 0 1] to [1 0 0] to [0 0 0];
    m1 = m;
    r1 = (1:m1-1)'/(max(m1-1,1));
    r = [1; 0.85*(ones(m1-1,1)-r1); zeros(m1,1);0; r1; 1; ones(m1-1,1)-r1];
    g = [ones(m1,1); (ones(m1-1,1)-r1); 0; zeros(m1,1); zeros(m1,1)];
    b = [1; 0.85*(ones(m1-1,1)-r1); 0; r1; 1; ones(m1-1,1)-r1; zeros(m1,1)];
=======
    % From [1 1 1] to [1 1 1], then [1 1 1] to [1 0 0];
    m1 = m;
    r1 = (1:m1-1)'/(max(m1-1,1));
    r = [1; 0.85*(ones(m1-1,1)-r1); ];
    g = [1; 0.85*(ones(m1-1,1)-r1); ];
    b = [1; 0.85*(ones(m1-1,1)-r1); ];
>>>>>>> f7c00c47eef2e11b834876c3b91cf69d73e565b3
else
    % From [0 0 1] to [1 1 1] to [1 0 0];
    %m1 = floor(m*0.5);
    m1 = m;
    %r = (0:m1-1)'/max(m1,1);
    r1 = (1:m1-1)'/(max(m1-1,1));

    %g = r;
    r = [1; 0.85*(ones(m1-1,1)-r1)];
    g = [1; 0.85*(ones(m1-1,1)-r1)];
    b = [1; 0.85*(ones(m1-1,1)-r1)];
    %r = [r; ones(m1+1,1)];
    %g = [g; 1; flipud(g)];
    %b = flipud(r);
end
c = [r g b]; 
