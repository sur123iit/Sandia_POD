%This program is a test program that saves a .dat for plotting dot_product
folder_nm = 'Y:\rawdata\Sandia_cavity\SpectralVelocityAnimations\';
r = 1;
file_nm = strcat(folder_nm,'Uphi_',int2str(r),'.dat');
datfile = fopen(file_nm,'w+');

fprintf(datfile,'VARIABLES = "dot_product1" "mode_num" \n');

[I,I1] = size(dot_product1);
J = 1;
K = 1;

fprintf(datfile, 'ZONE T = "Time" \n');
fprintf(datfile, 'I = %i, J = %i, K = %i \n',I,J,K);

for u = 1:I
    fprintf(datfile,'%f  %f',mode_num(u,1), dot_product1(u,1));
    fprintf(datfile,'\n');
end
fclose(datfile);
%%