%% Graph name: Spect_POD_ModeVsStrouhal
%Description: Spectral POD eigen-value plot of Mode 1..4 and Total vs Strouhal Number containing Rossiter Mode frequencies
clear all;
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval1 = sum(eig_val);
sum_eigval2 = sum(sum_eigval1);
eigval = eig_val(1:4,:)/sum_eigval2;
eigval = eigval';
eigval_t(:,1) = sum(eig_val,1);
eigval_t = eigval_t/sum_eigval2;
eigval = horzcat(eigval_t,eigval);
%Whenever you apply this, please change the Line width property of the
%first plot which represents total
plot_strouhal(eigval);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('\eta_i','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 700 700],'OuterPosition',[0 0 900 900])
lgd = legend('\eta_t','\eta_1','\eta_2','\eta_3','\eta_4');
lgd.FontSize = 35;
%% Graph name: Spect_POD_ModeVsStrouhal Normalized
%Description: Spectral POD eigen-value plot of Mode 1..4 and Total vs Strouhal Number containing Rossiter Mode frequencies
clear all;
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
for m = 1:4
eigval(m,:) = eig_val(m,:)/sum(eig_val(m,:));
end
eigval = eigval';
eigval_t(:,1) = sum(eig_val,1);
eigval_t = eigval_t/sum(eigval_t);
eigval = horzcat(eigval_t,eigval);
%Whenever you apply this, please change the Line width property of the
%first plot which represents total
plot_strouhal(eigval);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('\eta_i','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.075:0.15);
set(gcf,'Position',[0 0 700 700],'OuterPosition',[0 0 900 900])
lgd = legend('\eta_t','\eta_1','\eta_2','\eta_3','\eta_4','RF_1','RF_2','RF_3','RF_4');
lgd.FontSize = 12;
%% Graph name: SpectralModes_vs_SnapshotModes.png
%Description: Energy Comparison of SPOD vs POD vs Mode Number
clear all;
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval3 = sum(eig_val,2);
sum_eigval4 = sum(sum_eigval3);
sum_eigval3 = sum_eigval3/sum_eigval4;
sum_eigval5 = en_cnvr_ary(sum_eigval3);
clearvars -except sum_eigval5;
%
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Vel_spacN.mat');
clearvars vel_mat vel_mean;
c1(:,:) = vel_fluc(:,3,:);
c2(:,:) = vel_fluc(:,4,:);
c = vertcat(c1,c2);
[~,eigval,~,~] = POD_Snapshot(c);
eigval1 = sum(eigval);
eigval = eigval/eigval1;
eigval_conv = en_cnvr_ary(eigval);

%
close all;
plot(1:100,sum_eigval5(1:100,1),'LineWidth',2,'Color','b');
hold on
plot(1:100,eigval_conv(1:100,1),'LineWidth',2,'Color','r');
plot([1 5:5:100],[eigval_conv(1,1) eigval_conv(5:5:100,1)'],'o','MarkerSize',4,'MarkerFaceColor','r','MarkerEdgeColor','r')
plot([1 5:5:100],[sum_eigval5(1,1) sum_eigval5(5:5:100,1)'],'o','MarkerSize',4,'MarkerFaceColor','b','MarkerEdgeColor','b')
xlim([1 100]), ylim([0 1])
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('Mode Number (i)','FontSize',34), ylabel('Energy Fraction (\eta)','FontSize',34), xticks(0:20:100), yticks(0:0.2:1);
lgd = legend('Spectral','Snapshot','Location','east');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
%% Graph Name: EnCnvr_SPOD_RFs.png
%Description: This graph plots energy fraction of mode1, mode 2, mode 3,..
%etc vs total energy for Rossiter Frequency 2
clear all;
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval1 = sum(eig_val);
sum_eigval2 = sum(sum_eigval1);
sum_eigval3 = sum(eig_val,2);
sum_eigval4 = sum(sum_eigval3);
sum_eigval3 = sum_eigval3/sum_eigval4;
sum_eigval5 = en_cnvr_ary(sum_eigval3);
eigval = eig_val/sum_eigval2;
eigval = eigval';
eigval_t(:,1) = sum(eig_val,1);
eigval_t = eigval_t/sum_eigval2;
%
eigval_1(:,1) = eigval(6,:)+eigval(7,:)+eigval(8,:);
eigval_1t = eigval_t(6,1)+eigval_t(7,1)+eigval_t(8,1);
eigval_1 = eigval_1/eigval_1t;
%
eigval_2(:,1) = eigval(14,:)+eigval(15,:)+eigval(16,:);
eigval_2t = eigval_t(14,1)+eigval_t(15,1)+eigval_t(16,1);
eigval_2 = eigval_2/eigval_2t;
%
eigval_3(:,1) = eigval(24,:)+eigval(25,:)+eigval(26,:);
eigval_3t = eigval_t(24,1)+eigval_t(25,1)+eigval_t(26,1);
eigval_3 = eigval_3/eigval_3t;
%
eigval_4(:,1) = eigval(33,:)+eigval(34,:)+eigval(35,:);
eigval_4t = eigval_t(33,1)+eigval_t(34,1)+eigval_t(35,1);
eigval_4 = eigval_4/eigval_4t;

%
eigval_1_conv = en_cnvr_ary(eigval_1);
eigval_2_conv = en_cnvr_ary(eigval_2);
eigval_3_conv = en_cnvr_ary(eigval_3);
eigval_4_conv = en_cnvr_ary(eigval_4);
plot(1:100, eigval_1_conv(1:100,1),'LineWidth',2,'Color','c') ,ylim([0 1]), xlim([1 100])
hold on
plot(1:100, eigval_2_conv(1:100,1),'LineWidth',2,'Color','r') ,ylim([0 1]), xlim([1 100])
plot(1:100, eigval_3_conv(1:100,1),'LineWidth',2,'Color','g') ,ylim([0 1]), xlim([1 100])
plot(1:100, eigval_4_conv(1:100,1),'LineWidth',2,'Color','m') ,ylim([0 1]), xlim([1 100])
plot(1:100, sum_eigval5(1:100,1),'LineWidth',3,'Color','b') ,ylim([0 1]), xlim([1 100])
plot([1 5:5:100],[eigval_1_conv(1,1) eigval_1_conv(5:5:100,1)'],'o','MarkerSize',5,'MarkerFaceColor','c','MarkerEdgeColor','c')
plot([1 5:5:100],[eigval_2_conv(1,1) eigval_2_conv(5:5:100,1)'],'o','MarkerSize',5,'MarkerFaceColor','r','MarkerEdgeColor','r')
plot([1 5:5:100],[eigval_3_conv(1,1) eigval_3_conv(5:5:100,1)'],'o','MarkerSize',5,'MarkerFaceColor','g','MarkerEdgeColor','g')
plot([1 5:5:100],[eigval_4_conv(1,1) eigval_4_conv(5:5:100,1)'],'o','MarkerSize',5,'MarkerFaceColor','m','MarkerEdgeColor','m')
plot([1 5:5:100],[sum_eigval5(1,1) sum_eigval5(5:5:100,1)'],'o','MarkerSize',5,'MarkerFaceColor','b','MarkerEdgeColor','b')
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta_f','FontSize',34), 
lgd = legend('\eta_R_F_1','\eta_R_F_2','\eta_R_F_3','\eta_R_F_4','\eta_T','Location','east');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800]),xticks(0:20:100); yticks(0:0.2:1);
%% Graph Name: SpectralModes_vs_SnapshotModes_normalized.png
%{ 
clear all;
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval3 = sum(eig_val,2);
sum_eigval4 = sum(sum_eigval3);
sum_eigval3 = sum_eigval3/sum_eigval4;
sum_eigval5 = en_cnvr_ary(sum_eigval3);
clearvars -except sum_eigval5;
%
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Vel_spacN.mat');
clearvars vel_mat vel_mean;
c1(:,:) = vel_fluc(:,3,:);
c2(:,:) = vel_fluc(:,4,:);
[~,eigval,~,~] = POD_Snapshot(c1,c2);
eigval1 = sum(eigval);
eigval = eigval/eigval1;
eigval_conv = en_cnvr_ary(eigval);
%
close all;
plot(1/280:1/280:1,sum_eigval5,'LineWidth',2,'Color','b');
hold on
plot(1/4000:1/4000:1,eigval_conv,'LineWidth',2,'Color','r');
xlim([1/4000 1]), ylim([0 1])
pbaspect([1 1 1]);
set(gca,'fontsize',18);
xlabel('Mode Fraction (i/N)','FontSize',34), ylabel('Energy Fraction (\eta)','FontSize',34), xticks(0:0.2:1), yticks(0:0.2:1);
lgd = legend('Spectral','Snapshot','Location','east');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
%}
%% Contour Plots SPOD folder
%Check if Cont_plot_SPOD_AIAA.mat is there in Raw folder or not
clear all;
close all;
load('Y:\rawdata\Sandia_cavity\Cont_plot_SPOD_AIAA.mat');
%2 6 9: indices
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
index_freq = 9;
index_mode = 3;
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(cont_plot_mat(:,index_mode,index_freq)));
l1 = abs(max(max(Vphi))); %Vphi or Uphi
l2 = abs(min(min(Vphi))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l l]);%pick l1 or l2 (larger of the two)
colormap(redblue)
 % depending on location
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
%h = colorbar;
%set(h,'LineWidth',2);
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
axis equal
set(gcf,'Position',[0 0 1200 420]), %depending on location (400 or 420) 
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%% AutoCorr folder (Part 1)
%Check if Auto_corr_tr.mat and Auto_corr_ens.mat are in the Raw folder's
%GraphData folder or not
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\GraphData\Auto_corr_tr.mat');
[x1,y1,Uphi,Vphi] = cont_plot_uv(R);
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none'); %Vphi or Uphi
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
caxis([0 1]);
%colorbar % depending on location
axis equal
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 400])
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%% AutoCorr folder (Part2)
%Check if Auto_corr_tr.mat and Auto_corr_ens.mat are in the Raw folder's
%GraphData folder or not
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\GraphData\Auto_corr_ens.mat');
[x1,y1,Uphi,Vphi] = cont_plot_uv(R);
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none'); %Vphi or Uphi
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
caxis([0 1]);
%colorbar % depending on location
axis equal
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 420])
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%% Ensemble POD modes folder
clear all;
close all;
%path = 'C:\Users\surabhi123iit\Dropbox (UFL)\Spring 2018\Spring 2018 documents\Spring 2018 weekly updates\AIAA paper final documents\Images\Ensemble POD modal shapes\';
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'Phi_ens_280.txt';
completeName = strcat(folderName,fileName);
Phi = load(completeName);
m = 9;%CHANGE
Phim = Phi(:,m);
[x1,y1,Uphi,Vphi] = cont_plot_uv(Phim);
Phi_viz = Vphi;%CHANGE
l1 = abs(max(max(Phi_viz))); %Vphi or Uphi
l2 = abs(min(min(Phi_viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
caxis([-l l]);
colormap(redblue)
%colorbar % depending on location
axis equal
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 420])
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%% 
%% Time Resolved POD modes folder
clear all;
close all;
%path = 'C:\Users\surabhi123iit\Dropbox (UFL)\Spring 2018\Spring 2018 documents\Spring 2018 weekly updates\AIAA paper final documents\Images\Ensemble POD modal shapes\';
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'Phi_ens_280.txt';
completeName = strcat(folderName,fileName);
Phi = load(completeName);
m = 9;%CHANGE
Phim = Phi(:,m);
[x1,y1,Uphi,Vphi] = cont_plot_uv(Phim);
Phi_viz = Vphi;%CHANGE
l1 = abs(max(max(Phi_viz))); %Vphi or Uphi
l2 = abs(min(min(Phi_viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
caxis([-l l]);
colormap(redblue)
%colorbar % depending on location
axis equal
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 420])
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%% Convergence of POD modes
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');

r = 70;
fileName = strcat('Phi_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_tr = load(completeName);

r = 6000;
fileName = strcat('Phi_ensN_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_ens = load(completeName);
dot_Phi = dot(Phi_tr,Phi_ens);
dot_Phi = abs(dot_Phi);
clearvars Phi_ens;
plot(1:100,dot_Phi(1:100),'o-','LineWidth',2);
hold on
r = 6000;
fileName = strcat('Phi_trN_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_ens = load(completeName);

dot_Phi = dot(Phi_tr,Phi_ens);
dot_Phi = abs(dot_Phi);

plot(1:100,dot_Phi(1:100),'^-','LineWIdth',2);

xlim([1 25]), ylim([0 1.1]);

pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('Mode Number (i)','FontSize',34), ylabel('<\Phi_i . \Phi_j>','FontSize',34), xticks(0:5:25), yticks(0:0.2:1);
lgd = legend('Ensemble POD (N = 6000)', 'Time Resolved POD (N = 6000)');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
%% Grid plot TrEns70 vs TrN6000
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');

r = 70;
fileName = strcat('Phi_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_tr = load(completeName);
r = 6000;
fileName = strcat('Phi_trN_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_ens = load(completeName);

grid_mat = Phi_tr'*Phi_ens;
grid_mat = abs(grid_mat);
c = gray(10);
c = flipud(c);
colormap(c);
h = pcolor(grid_mat(1:40,1:40));
caxis([0 1]);
pbaspect([1 1 1])
%colorbar;
xticks(0:10:40), yticks(0:10:40);
set(gca,'fontsize',17,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xlabel('Time Resolved(6000 snapshots)','FontSize',31), ylabel('Time Resolved (70 runs)','FontSize',31);
%% Grid plot TrEns70 vs EnsN6000
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');

r = 70;
fileName = strcat('Phi_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_tr = load(completeName);
r = 6000;
completeName = strcat(folderName,fileName);
Phi_ens = load(completeName);

grid_mat = Phi_tr'*Phi_ens;
grid_mat = abs(grid_mat);
c = gray(10);
c = flipud(c);
colormap(c);
h = pcolor(grid_mat(1:40,1:40));
caxis([0 1]);
pbaspect([1 1 1])
c = colorbar;
c.LineWidth = 2;
c.Ticks = 0:0.2:1.0;
xticks(0:10:40), yticks(0:10:40);
set(gca,'fontsize',17,'FontWeight','Bold','LineWidth',2);
<<<<<<< HEAD
set(gcf,'Position',[0 0 800 800])
xlabel('Ensemble(6000 snapshots)','FontSize',31), ylabel('Time Resolved (70 runs)','FontSize',31);%Change this!
<<<<<<< HEAD
%% Convergence with number of snapshots
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\'
fileName = 
=======
%% SPOD Convergence vs Frequency (For mode 1,2 and 3 separately)
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach',num2str(Mach),'\')
m = 1;
counter = 0;
for r = 50:50:200
    counter = counter + 1;
fileName = strcat('Phi_dot_Mode123_',int2str(r),'_',int2str(r+50),'.txt');
    completeName = strcat(folderName,fileName);
    Dot_Phi = load(completeName);
    Phi(:,counter) = Dot_Phi(:,m);
end
plot_strouhal(Phi);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xlabel('St_D','FontSize',34), ylabel('<\Phi_r_1 . \Phi_r_2>','FontSize',34);%Change this!
lgd = legend('50-100','100-150','150-200','200-250','RF1','RF2','RF3','RF4','Location','East')
lgd.FontSize = 12;
xticks(0:0.25:0.5), yticks(0:0.5:1.0)
%% SPOD Convergence vs Frequency (For Mode 1, 2 and 3 separately) - Energy
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
m = 1;
counter = 0;
for r = 50:50:200
    fileName = strcat('eigval_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    eig1 = load(completeName);
    eig2(:) = eig1(m,:);
    eig3 = sum(sum(eig1));
    eig4 = eig2/eig3;
    counter = counter + 1;
    eigm (:,counter) = eig4;
    clearvars eig1 eig2 eig3;
end
plot_strouhal(eigm);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xlabel('St_D','FontSize',34), ylabel('\eta_f','FontSize',34);%Change this!
lgd = legend('r = 50','r = 100','r = 150','r = 200','RF1','RF2','RF3','RF4','Location','East')
lgd.FontSize = 12;
xticks(0:0.25:0.5), yticks(0:0.025:0.05)
%% POD Convergence with runs
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
r = [3500 4000 4500 5500];
for ii = 1:4
fileName = strcat('Phi_trN_',int2str(r(ii)),'.txt');
completeName = strcat(folderName,fileName);
Phi1 = load(completeName);
fileName = strcat('Phi_trN_',int2str(r(ii)+500),'.txt');
completeName = strcat(folderName,fileName);
Phi2 = load(completeName);
dot_Phi = abs(dot(Phi1,Phi2));
if ii == 4
    plot(1:200,dot_Phi,'o-','LineWidth',3);
    plot([23 23],[0 dot_Phi(23)],'--','LineWidth',2,'Color',[0 0.5 0.5]);
elseif ii == 1
    plot(1:200,dot_Phi,'s-','LineWidth',2);
elseif ii == 2
    plot(1:200,dot_Phi,'^-','LineWidth',2);
else
    plot(1:200,dot_Phi,'>-','LineWidth',2);
end
hold on
clearvars Phi1 Phi2 dot_Phi;
end
xlim([1 30]), ylim([0 1.3]),xticks(0:10:30),yticks(0:0.25:1.0)
lgd = legend('3500-4000','4000-4500','4500-5000','5000-5500','Location','NorthEast')
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('Mode Number (i)','FontSize',34), ylabel('<\Phi_N_1 . \Phi_N_2>','FontSize',34), 
%% POD Convergence with runs
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
r = [3500 4000 4500 5000];
for ii = 1:4
fileName = strcat('Phi_ensN_',int2str(r(ii)),'.txt');
completeName = strcat(folderName,fileName);
Phi1 = load(completeName);
if ii == 2
fileName = strcat('Phi_ensN_',int2str(r(ii)+200),'.txt');
completeName = strcat(folderName,fileName);
Phi2 = load(completeName);
else
fileName = strcat('Phi_ensN_',int2str(r(ii)+500),'.txt');
completeName = strcat(folderName,fileName);
Phi2 = load(completeName);    
end
dot_Phi = abs(dot(Phi1,Phi2));
if ii == 4
    plot(1:200,dot_Phi,'o-','LineWidth',3);
    plot([51 51],[0 dot_Phi(51)],'--','LineWidth',2,'Color',[0 0.5 0.5]);
elseif ii == 1
    plot(1:200,dot_Phi,'s-','LineWidth',2);
elseif ii == 2
    plot(1:200,dot_Phi,'^-','LineWidth',2);
else
    plot(1:200,dot_Phi,'>-','LineWidth',2);
end
hold on
clearvars Phi1 Phi2 dot_Phi;
end
xlim([1 60]), ylim([0 1.3]), xticks(0:20:60), yticks(0:0.25:1.0)
lgd = legend('3500-4000','4000-4500','4500-5000','5000-5500','Location','NorthEast')
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('Mode Number (i)','FontSize',34), ylabel('<\Phi_i^N^1 . \Phi_i^N^2>','FontSize',34),
%% POD convergence with Runs based on energy (Time Resolved)
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
r = [1000 2000 3000 4000 5000];
for ii = 1:5
fileName = strcat('eigval_trN_',int2str(r(ii)),'.txt');
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = eig1/sum(eig1);
eig3 = en_convergence(eig2);
if ii == 1
    eig_plot = eig3;
end
plot(1:200,eig3(1:200),'LineWidth',2);
hold on
clearvars eig1 eig2;
end
hold on
line([1 1 20 20 0],[0 1 1 0 0],'Color','r','LineWidth',2)
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlim([1 100]), ylim([0 1.3]), xticks(0:20:100), yticks([0:0.25:1.0])
lgd = legend('1000','2000','3000','4000','5000','Location','NorthEast')
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta','FontSize',34),
%% POD convergence with Runs based on energy (Time Resolved)
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
r = [1000 2000 3000 4000 5000];
for ii = 1:5
fileName = strcat('eigval_trN_',int2str(r(ii)),'.txt');
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = eig1/sum(eig1);
eig3 = en_convergence(eig2);
if ii == 1
    plot(1:200,eig3(1:200),'o-','LineWidth',2);
elseif ii == 2
    plot(1:200,eig3(1:200),'s-','LineWidth',2);
elseif ii == 3
    plot(1:200,eig3(1:200),'^-','LineWidth',2);
elseif ii == 4
plot(1:200,eig3(1:200),'>-','LineWidth',2);
else
    plot(1:200,eig3(1:200),'<-','LineWidth',2);

end
hold on
clearvars eig1 eig2;
end
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlim([1 20]), ylim([0 1]), xticks(0:5:20), yticks([0:0.25:1.0])
lgd = legend('1000','2000','3000','4000','5000','Location','NorthEast')
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta','FontSize',34),
%% POD convergence with Runs based on energy (Ensemble) 
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
r = [1000 2000 3000 4000 5000];
for ii = 1:5
fileName = strcat('eigval_ensN_',int2str(r(ii)),'.txt');
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig3 = en_convergence(eig1);
plot(1:200,eig3(1:200),'LineWidth',2);
hold on
clearvars eig1 eig2;
end
line([1 1 20 20 0],[0 1 1 0 0],'Color','r','LineWidth',2)
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlim([1 100]), ylim([0 1.3]), xticks(0:20:100), yticks([0:0.25:1.0])
lgd = legend('1000','2000','3000','4000','5000','Location','NorthEast')
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta','FontSize',34),
%%
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
r = [1000 2000 3000 4000 5000];
for ii = 1:5
fileName = strcat('eigval_ensN_',int2str(r(ii)),'.txt');
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig3 = en_convergence(eig1);
if ii == 1
    plot(1:200,eig3(1:200),'o-','LineWidth',2);
elseif ii == 2
    plot(1:200,eig3(1:200),'s-','LineWidth',2);
elseif ii == 3
    plot(1:200,eig3(1:200),'^-','LineWidth',2);
else
plot(1:200,eig3(1:200),'>-','LineWidth',2);
end
hold on
clearvars eig1 eig2;
end
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlim([1 20]), ylim([0 1]), xticks(0:5:20), yticks([0:0.25:1.0])
lgd = legend('1000','2000','3000','4000','5000','Location','NorthEast')
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta','FontSize',34),
%% POD Energy Convergence 70 runs vs Ensemble and Time Resolved
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\');
fileName = 'eigval_tr_70.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\');
fileName = 'eigval_trN_6000.txt';
completeName = strcat(folderName,fileName);
eig2 = load(completeName);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\');
fileName = 'eigval_ensN_6000.txt';
completeName = strcat(folderName,fileName);
eig3 = load(completeName);
loglog(1:100,eig1(1:100),'o-',1:100,eig3(1:100),'s-',1:100,eig2(1:100),'^-','LineWidth',2);
xlim([1 25]), ylim([0 0.2]);
pbaspect([1 1 1])
%xticks(0:5:25), yticks(0:0.04:0.2)
set(gcf,'Position',[0 0 800 800])
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta','FontSize',34), 
lgd = legend('Snapshot POD (70 runs)','Ensemble POD (N = 6000)','Time Resolved POD (N = 6000)');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
%% Convergence of modes based on energy
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach0.8\';
r = 200;
fileName = strcat('PhiDot_DecrEn_',int2str(r),'_',int2str(r+50),'.txt');
completeName = strcat(folderName,fileName);
Phi_dot = load(completeName);
fig = figure;
left_color = [0.3 0.3 0];
right_color = [.41 .31 .54];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
yyaxis left
plot(1:500,Phi_dot,'o-','LineWidth',2,'Color',left_color);
ylim([0 1.01]); yticks(0:0.2:1.0);
ylabel('<\Phi_r_1 . \Phi_r_2>','FontSize',34), 
clearvars Phi_dot
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = reshape(eig1,[size(eig1,1)*size(eig1,2),1]);
eig3 = sort(eig2,'desc');
eig3 = eig3/sum(eig3);
yyaxis right
bar(eig3(1:500),'FaceColor',right_color)
xlim([0 50]), ylim([0 0.05]),
xticks(10:10:50), yticks(0:0.01:0.05)
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta','FontSize',34), 
set(gcf,'Position',[0 0 900 800])
pbaspect([1 1 1])
<<<<<<< HEAD
%% Convergence with number of snapshots
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = reshape(eig1,[size(eig1,1)*size(eig1,2),1]);
eig3 = sort(eig2,'desc');
eig3 = eig3/sum(eig3);
eig4 = en_convergence(eig3);
plot(1:200,eig4(1:200),'LineWidth',2);
xlim([1 200]), ylim([0 1])
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xticks(0:50:200),yticks(0:0.25:1.0)
xlabel('Mode Number (i)','FontSize',34), ylabel('\eta','FontSize',34), 
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 1])
%% Spectral POD decreasing energy convergence
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'Phi_DecrEn.mat';
completeName = strcat(folderName,fileName);
load(completeName);
folderName = 'C:\Users\surabhi123iit\Dropbox (UFL)\Spring 2018\Spring 2018 documents\Spring 2018 weekly updates\Meeting Documents and Graphs\Meeting\SPOD_ContPlot_DecrEn\';
for index_plot = 1:50
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(Phi_en(:,index_plot)));
Phi_viz = Uphi;
l1 = abs(max(max(Phi_viz))); %Vphi or Uphi
l2 = abs(min(min(Phi_viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l l]);%pick l1 or l2 (larger of the two)
colormap(redblue)
 % depending on location
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
%h = colorbar;
%set(h,'LineWidth',2);
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
axis equal
set(gcf,'Position',[0 0 1200 420]), %depending on location (400 or 420) 
xticks(0:1:5), yticks(-0.5:0.5:0.5);
fileName = strcat('Uphi_en_',int2str(index_plot));
completeName =  strcat(folderName,fileName);
saveas(gca,completeName,'png')
end
%% Spectrum of a
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
for r = 1:Nb
    folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\a_n\';
    fileName = strcat('a_n',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    %%CODING IS LEFT
end

