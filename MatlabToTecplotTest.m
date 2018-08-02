%% 2 D velocity field
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);

%% Load mean field
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = 'vel_mean.txt';
completeName = strcat(folderName,fileName);
uvm1 = load(completeName);
uvm = uvm1(:,6);

%% Load fluctuation
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\35percentEnergy_1\';
fileName = 'uv_rec_6.txt';
completeName = strcat(folderName,fileName);
uv = load(completeName);

%% Total velocity and X and Y
UV = uv + uvm;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\';
fileName = 'B00001.dat';
completeName = strcat(folderName,fileName);
[a, ~] = importdata(completeName);
b = a.data;
x1 = b(:,1);
y1 = b(:,2);
[X1,Y1] = getxy();
%% Start writing the file
UV1 = horzcat(x1,y1,UV(1:3180,:));
I = size(X1,1);
J = size(Y1,1);
c = 3;
UVrec = UV1';
%%
for frames = 1:1:size(UVrec,1)-2
    if frames == 1
        fid = fopen('C:\Users\surabhi123iit\Documents\MATLAB\Raw\test.txt','wt');

header1 = 'Variables = "X", "Y", "T" \nZone T = "Zone1" \nZoneType=Ordered';
header2 = ['\nI=' num2str(I) ' \nJ=' num2str(J) ' \nDataPacking=Block'];
header3 = ['\nSolutionTime=' num2str(1 + 1/Fs) ' \n StrandId=1 \n'];
fprintf(fid,'%f \n',[header1 header2 header3]);
fprintf(fid,'%f \n',[UVrec(1,:),UVrec(2,:),UVrec(c,:)]');
    else
        c = c + 1;
        header1 = [' \nZONE T="Zone ' num2str(c-3) '" \nZoneType=Ordered'];
        header3 = ['\nSolutionTime=' num2str(1+((c-3)/Fs)) ' \nStrandId=1 \nVARSHARELIST=([1-2]=1) \n'];
        fprintf(fid,[header1 header2 header3]);
        fprintf(fid, '%f \n', [UVrec(c,:)]);
    end
end
fclose(fid);
   
  

    