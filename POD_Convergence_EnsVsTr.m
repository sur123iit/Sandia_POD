%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Time Resolved POD
%% Load Data
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\tr_POD\Mach',num2str(Mach),'\');
fileName = 'vel_fluc.txt';
completeName = strcat(folderName,fileName);
uv_tr = load(completeName);
%% Snapshot POD for Ns
Ns = 4000;
vel_fluc_tr = uv_tr(:,1:Ns);
[eigvec_tr, eigval_tr, PODcoeff_tr, Phi_tr] = POD_Snapshot(vel_fluc_tr);
%% Ensemble POD
%% Load Data 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\ensemble_POD\Mach',num2str(Mach),'\');
fileName = 'vel_fluc.txt';
completeName = strcat(folderName,fileName);
uv_ens = load(completeName);
%% Snapshot POD for Ns
Ns = 4000;
vel_fluc_ens = uv_ens(:,1:Ns);
[eigvec_ens, eigval_ens, PODcoeff_ens, Phi_ens] = POD_Snapshot(vel_fluc_ens);
%% Dot product plot
Phi_dot = dot(Phi_tr(:,1:200),Phi_ens(:,1:200));
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
cbh = colorbar;
set(cbh,'XTick',0:0.2:1);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xticks(0:20:100), yticks(0:20:100)
xlabel('Ensemble(N = 4000)','FontSize',34), ylabel('Time Resolved(N = 4000)','FontSize',34);
%%








