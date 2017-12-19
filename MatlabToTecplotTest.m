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