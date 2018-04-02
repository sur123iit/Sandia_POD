%% 
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
r = 280;
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
fileName = strcat(int2str(r),'.mat');
completeName = strcat(folderName,fileName);
load(completeName);
Phi1(:,:) = Phi(:,1,:);
clearvars Phi;
%%
r = 200;
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
fileName = strcat(int2str(r),'.mat');
completeName = strcat(folderName,fileName);
load(completeName);
Phi2(:,:) = Phi(:,1,:);
clearvars Phi;
%%
Phi_dot = dot(Phi1,Phi2);
plot(1:193,abs(Phi_dot),'o-');
hold on
%%
