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
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28), ylabel('\eta_i','FontSize',28), xticks(0:0.1:0.5); yticks(0:0.02:0.1);
set(gcf,'Position',[0 0 700 700])
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
[~,eigval,~,~] = POD_Snapshot(c1,c2);
eigval1 = sum(eigval);
eigval = eigval/eigval1;
eigval_conv = en_cnvr_ary(eigval);

%
close all;
plot(1:100,sum_eigval5(1:100,1),'LineWidth',2,'Color','b');
hold on
plot(1:100,eigval_conv(1:100,1),'LineWidth',2,'Color','r');
plot([25 25],[0 sum_eigval5(25,1)],'--','LineWidth',2);
plot([1 5:5:100],[eigval_conv(1,1) eigval_conv(5:5:100,1)'],'o','MarkerSize',4,'MarkerFaceColor','r','MarkerEdgeColor','r')
plot([1 5:5:100],[sum_eigval5(1,1) sum_eigval5(5:5:100,1)'],'o','MarkerSize',4,'MarkerFaceColor','b','MarkerEdgeColor','b')
xlim([1 100]), ylim([0 1])
pbaspect([1 1 1]);
set(gca,'fontsize',15);
xlabel('Mode Number (i)','FontSize',28), ylabel('Energy Fraction (\eta)','FontSize',28), xticks(0:20:100), yticks(0:0.2:1);
lgd = legend('Spectral','Snapshot','Location','east');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 700 700])
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
plot(1:100, eigval_1_conv(1:100,1),'LineWidth',1,'Color','y') ,ylim([0 1]), xlim([1 100])
hold on
plot(1:100, eigval_2_conv(1:100,1),'LineWidth',1,'Color','r') ,ylim([0 1]), xlim([1 100])
plot(1:100, eigval_3_conv(1:100,1),'LineWidth',1,'Color','g') ,ylim([0 1]), xlim([1 100])
plot(1:100, eigval_4_conv(1:100,1),'LineWidth',1,'Color','m') ,ylim([0 1]), xlim([1 100])
plot(1:100, sum_eigval5(1:100,1),'LineWidth',2,'Color','b') ,ylim([0 1]), xlim([1 100])
plot([25 25],[0 eigval_2_conv(25,1)],'--','LineWidth',2,'Color',[0.3 0.3 0.3])
plot([0 25],[eigval_1_conv(25,1) eigval_1_conv(25,1)],'--','LineWidth',1,'Color',[0.3 0.3 0.3]);
plot([0 25],[eigval_2_conv(25,1) eigval_2_conv(25,1)],'--','LineWidth',1,'Color',[0.3 0.3 0.3]);
plot([0 25],[eigval_3_conv(25,1) eigval_3_conv(25,1)],'--','LineWidth',1,'Color',[0.3 0.3 0.3]);
plot([0 25],[eigval_4_conv(25,1) eigval_4_conv(25,1)],'--','LineWidth',1,'Color',[0.3 0.3 0.3]);
plot([0 25],[sum_eigval5(25,1) sum_eigval5(25,1)],'--','LineWidth',2,'Color',[0 0.3 0.3]);
plot([1 5:5:100],[eigval_1_conv(1,1) eigval_1_conv(5:5:100,1)'],'o','MarkerSize',3,'MarkerFaceColor','y','MarkerEdgeColor','y')
plot([1 5:5:100],[eigval_2_conv(1,1) eigval_2_conv(5:5:100,1)'],'o','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r')
plot([1 5:5:100],[eigval_3_conv(1,1) eigval_3_conv(5:5:100,1)'],'o','MarkerSize',3,'MarkerFaceColor','g','MarkerEdgeColor','g')
plot([1 5:5:100],[eigval_4_conv(1,1) eigval_4_conv(5:5:100,1)'],'o','MarkerSize',3,'MarkerFaceColor','m','MarkerEdgeColor','m')
plot([1 5:5:100],[sum_eigval5(1,1) sum_eigval5(5:5:100,1)'],'o','MarkerSize',4,'MarkerFaceColor','b','MarkerEdgeColor','b')

pbaspect([1 1 1]);
set(gca,'fontsize',15);
xlabel('Mode Number (i)','FontSize',28), ylabel('\eta_f','FontSize',28), 
lgd = legend('\eta_R_F_1','\eta_R_F_2','\eta_R_F_3','\eta_R_F_4','\eta_T','Location','east');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 700 700]),xticks(0:20:100); yticks(0:0.2:1);
%% Graph Name: SpectralModes_vs_SnapshotModes_normalized.png
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
set(gca,'fontsize',15);
xlabel('Mode Fraction (i/N)','FontSize',28), ylabel('Energy Fraction (\eta)','FontSize',28), xticks(0:0.2:1), yticks(0:0.2:1);
lgd = legend('Spectral','Snapshot','Location','east');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 700 700])
%% Contour Plots SPOD folder
%Check if Cont_plot_SPOD_AIAA.mat is there in Raw folder or not
clear all;
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Cont_plot_SPOD_AIAA.mat');
%2 6 9: indices
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
index_freq = 9;
index_mode = 3;
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(cont_plot_mat(:,index_mode,index_freq)));
%Decide if you want Uphi or Vphi and use it till the next percentage sign
l1 = abs(max(max(Uphi)));
l2 = abs(min(min(Uphi)));
contourf(x1/D,y1/D,Uphi',100,'LineStyle','none');
%See l1 and l2 and use the larger one for caxis limits
caxis([-l1 l1]);
colormap(redblue)
set(gca,'FontSize',20,'FontWeight','Bold');
%Decide the location of the image wrt the paper and choose labels
xlabel('x/D','FontSize',40,'FontWeight','Bold'), 
ylabel('y/D','FontSize',40,'FontWeight','Bold'),
axis equal
%Change 400 to 420 if x/D is not fitting
set(gcf,'Position',[0 0 1200 400]), 
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%%