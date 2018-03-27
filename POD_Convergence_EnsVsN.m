%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Ensemble POD
%% Load Data 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\ensemble_POD\Mach',num2str(Mach),'\');
fileName = 'vel_fluc.txt';
completeName = strcat(folderName,fileName);
uv_ens = load(completeName);
%% Snapshot POD for Ns1
Ns1 = 4000;
vel_fluc1 = uv_ens(:,1:Ns1);
[eigvec1, eigval1, PODcoeff1, Phi1] = POD_Snapshot(vel_fluc1);
Ns2 = 4500;
vel_fluc2 = uv_ens(:,1:Ns2);
[eigvec2, eigval2, PODcoeff2, Phi2] = POD_Snapshot(vel_fluc2);
%% Dot product plot
Phi_dot = dot(Phi1(:,1:200),Phi2(:,1:200));
plot(1:100,abs(Phi_dot(1:100)));
%% Grid Matrix
grid_mat = (Phi_tr(:,1:200))'*(Phi_ens(:,1:200));
grid_mat = abs(grid_mat);
c = gray(30);
c = flipud(c);
colormap(c);
h = pcolor(grid_mat(1:100,1:100));
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
set(gcf,'Position',[0 0 800 800])
xticks(0:20:100), yticks(0:20:100)
xlabel('Ensemble (4000 snapshots)'), ylabel('Time Resolved (15000 snapshots)');
%%








