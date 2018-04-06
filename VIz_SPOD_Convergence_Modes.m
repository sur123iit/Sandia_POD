%% Program to visualize the SPOD Mode Convergence
%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach',num2str(Mach),'\');
m = 1;
counter = 0;
for r = 50:50:150
    counter = counter + 1;
fileName = strcat('Phi_dot_Mode123_',int2str(r),'_',int2str(r+50),'.txt');
    completeName = strcat(folderName,fileName);
    Dot_Phi = load(completeName);
    Phi(:,counter) = Dot_Phi(:,m);
end
plot_strouhal(Phi);
legend('50-100','100-150','RF1','RF2','RF3')
%%
%Try and understand what it means for the convergence to become similar or
%equal for two different modes
close all;
folderName = strcat('Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach',num2str(Mach),'\');
r = 200;
fileName = strcat('Phi_dot_Mode123_',int2str(r),'_',int2str(r+50),'.txt');

    completeName = strcat(folderName,fileName);
    Dot_Phi = load(completeName);
plot_strouhal(Dot_Phi);
pbaspect([ 1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xlabel('St_D','FontSize',34), ylabel('<\Phi_r_1 . \Phi_r_2>','FontSize',34);%Change this!
lgd = legend('Mode 1','Mode 2','Mode 3','RF1','RF2','RF3','RF4','Location','East')
lgd.FontSize = 12;
xticks(0:0.25:0.5), yticks(0:0.5:1.0)
%% 
