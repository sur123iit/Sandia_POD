%% Ensemble 
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\ensemble_POD\Mach0.8\';
fileName = 'vel_fluc.txt';
completeName = strcat(folderName,fileName);
uv = load(completeName);
%% Apply Snapshot POD. Determine what all N's are required
uv1 = uv(:,1:4000);
uv2 = uv(:,1:4200);
uvm1 = mean(uv1,2);
uvm2 = mean(uv2,2);
uv1 = uv1 - uvm1;
uv2 = uv2 - uvm2;
%%
[ eigvec1, eigval1, PODcoeff1, Phi1 ] = POD_Snapshot(uv1);
[ eigvec2, eigval2, PODcoeff2, Phi2 ] = POD_Snapshot(uv2);
%%
dot_phi = abs(dot(Phi1(:,1:200),Phi2(:,1:200)));
plot(1:60,dot_phi(1:60),'^-','LineWidth',2);
%%
N = 4200;
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('Phi_ensN_',int2str(N),'.txt');
completeName = strcat(folderName,fileName);
Phi1 = load(completeName);
fileName = strcat('Phi_ensN_',int2str(N+500),'.txt');
completeName = strcat(folderName,fileName);
Phi2 = load(completeName);
phi_dot = abs(dot(Phi1(:,1:200),Phi2(:,1:200)));
plot(1:60,phi_dot(1:60),'o-','LineWidth',3);
hold on;
%%
plot([51 51],[0 phi_dot(51)],'--','LineWidth',2);
%%
xlim([1 60]), ylim([0 1.2]), xticks(0:20:60), yticks([0:0.25:1.0])
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('Mode Number (i)','FontSize',34), ylabel('<\Phi_i^N^1 . \Phi_i^N^2>','FontSize',34), 
lgd = legend('3500-4000','4000-4500','4500-5000','5000-5500','Location','NorthEast')
lgd.FontSize = 12;
%%
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'Phi_ensN_4000.txt';
completeName = strcat(folderName,fileName);
Phi = Phi1(:,1:200);
save(completeName,'Phi','-ascii');
