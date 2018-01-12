%This program is a test program that saves a .dat for plotting dot_product
%for first 100 modes
folder_nm = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\';
file_nm = strcat(folder_nm,'test_dot','.dat');
datfile = fopen(file_nm,'w+');

fprintf(datfile,'VARIABLES = "dot_product1" "mode_num" \n');

[I,I1] = size(dot_product1);
J = 1;
K = 1;

fprintf(datfile, 'ZONE T = "DotProduct" \n');
fprintf(datfile, 'I = %i, J = %i, K = %i \n',I,J,K);

for u = 1:I
    fprintf(datfile,'%f  %f',mode_num(u,1), dot_product1(u,1));
    fprintf(datfile,'\n');
end
fclose(datfile);
%%
% This section hasn't been run completely yet. Wait for compiler
clear all;
close all;
clc;

z = 160*membrane(1,100); %This is a 201x201 matrix as membrane creates a 2*m +1 by 2*m +1 matrix
s = surface(z);
s.EdgeColor = 'none';
view(3)

I = size(z,1); J = size(z,2); K =1;
total_points = I*J*K;

x = linspace(1,I,I);
y = linspace(1,J,J);
[X, Y] = meshgrid(x,y);

X = reshape(X,total_points,1);%make it linear
Y = reshape(Y,total_points,1);%make it linear
z = reshape(z,total_points,1);%make it linear
vars = [X,Y,z];

tecplot_home = 'C:\Program Files\Tecplot\Tecplot 360 EX 2015 R1';
tecio_path = strcat(tecplot_home,'tecutilinternal_tecio_exer.dll');
tecio_header_path = strcat(tecplot_home,'\include\TECIO.h');

if ~libisloaded('tecio')
    [notfound,warnings] = loadlibrary(tecio_path, tecio_header_path, ...
        'alias','tecio');
end

libfunctionsview('tecio')
