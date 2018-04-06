%% Viz_SPOD_Convergence_Energy
%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
m = 1;
for r = 50:50:150
fileName = strcat('eigval_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
eig = load(completeName);
eig_m(:,r/50) = eig(m,:)/sum(eig(m,:));
end
%%
plot_strouhal(eig_m);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xlabel('St_D','FontSize',34), ylabel('\eta','FontSize',34);%Change this!
lgd = legend('50-100','100-150','150-200','RF1','RF2','RF3','RF4','Location','East')
lgd.FontSize = 12;
xticks(0:0.25:0.5), yticks(0:0.05:0.1)
%%