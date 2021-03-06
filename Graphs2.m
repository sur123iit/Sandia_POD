%% SPOD modes streamwise
clear all;
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Cont_plot_SPOD_AIAA.mat');
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
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
colormap(redblue)
%c = colorbar;
%c.LineWidth = 2;
% depending on location
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% POD ensemble modes
clear all;
close all;
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'Phi_ens_280.txt';
completeName = strcat(folderName,fileName);
Phi  = load(completeName);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
k = 9;
[x1,y1,Uphi,Vphi] = cont_plot_uv(Phi(:,k));
Phi_viz = Vphi;
l1 = abs(max(max(Phi_viz))); %Vphi or Uphi
l2 = abs(min(min(Phi_viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l l]);%pick l1 or l2 (larger of the two)
colormap(redblue)
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
colormap(redblue)
%c = colorbar;
%c.LineWidth = 2;
% depending on location
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Reconstruction Spect and Spatial instantaneous
clear all;
r = 6;
folderName = 'X:\Data - Surabhi\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'X:\Data - Surabhi\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
k = 34;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
colormap(jet(256))
%colorbar
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
[x3,y3] = meshgrid(x1,y1);
h = streamline(x2/D,y2/D,Uphi2',Vphi2',[x2(1)/D x2(1)/D x2(1)/D x2(1)/D x2(1)/D x2(1)/D x2(1)/D x2(1)/D x2(1)/D x2(1)/D], [y2(1)/D y2(2)/D y2(3)/D y2(4)/D y2(5)/D y2(6)/D y2(7)/D y2(8)/D y2(9)/D y2(10)/D])
set(h,'LineWidth',1,'Color', [0 0 0]);
%h.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2);
hold off
%% Reconstruction Spect 50 percent energy
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\ens_num_';
fileName = strcat(int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
%%
k = 14;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
c = colorbar;
c.LineWidth = 2;
colormap(jet(256))
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
startx = (x1(1)/D)*ones(30,1);
sty = y1(30)/D*ones(106,1);
stx = x1/D;
sttx = vertcat(startx,stx);
starty = y1/D;
stty = vertcat(starty,sty);
[x3,y3] = meshgrid(x1(2:6:106),y1(2:3:30));
%s = streamline(x1/D,y1/D,Uphi',Vphi',x3/D,y3/D);
%set(s,'Color',[0.5 0.5 0.5],'LineWidth',1.5);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
%plot(plot::streamlines2d(Uphi',Vphi',x1/D,y1/D));

set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 1265 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Spect Reconstruction 75 percent energy
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\75percentEnergy_19\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
k = 34;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
%colorbar
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Spect Reconstruction Mode 1
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\35percentEnergy_1\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
k = 34;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
%colorbar
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Spatial Reconstructions 50 percent energy
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
k = 34;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
%colorbar
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Spatial Reconstructions Mode 1
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\20PercentEnergy_1\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
k = 34;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
%colorbar
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Spatial Reconstructions 75 percent energy
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\75PercentEnergy_31\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
k = 34;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
%colorbar
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Reconstructions colorbar
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\75PercentEnergy_31\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
%%
k = 34;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
c = colorbar;
c.LineWidth = 2;
% depending on location
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 1265 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Autocorrelation plots Time Resolved
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\GraphData\Auto_corr_tr.mat');
[x1,y1,Uphi,Vphi] = cont_plot_uv(R);
Phi_viz = Vphi;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
caxis([0 1]);
%colorbar % depending on location
axis equal
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Autocorrelation plots Ensemble
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\GraphData\Auto_corr_ens.mat');
[x1,y1,Uphi,Vphi] = cont_plot_uv(R);
Phi_viz = Vphi;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
caxis([0 1]);
%colorbar % depending on location
axis equal
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Autocorrelation plots colorbar
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\GraphData\Auto_corr_ens.mat');
[x1,y1,Uphi,Vphi] = cont_plot_uv(R);
Phi_viz = Vphi;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
c = colorbar;
c.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
caxis([0 1]);
%colorbar % depending on location
axis equal
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1265 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%% Comparison
close all;
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'eigval_ens_280.txt';
completeName = strcat(folderName,fileName);
eig2 = load(completeName);
%%
eig3 = eig1(:,7);
eig3 = eig3/sum(eig3);
eig4 = eig1(:,15);
eig4 = eig4/sum(eig4);
eig5 = eig1(:,25);
eig5 = eig5/sum(eig5);
%plot(1:100,eig2(1:100),'o-',1:100,eig3(1:100),'o-',1:100,eig4(1:100),'o-',1:100,eig5(1:100),'o-','LineWidth',2);
%plot(1:100,eig2(1:100),'o-',1:100,eig4(1:100),'o-','LineWidth',2);
plot(1:100,eig5(1:100),'o','MarkerSize',5,'Color',[0 0 0],'LineWidth',2);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('l','FontSize',34), ylabel('\lambda','FontSize',34),% xticks(0:0.25:0.5), yticks([10^-4 10^-2 10^0])
%lgd = legend('Spatial','RF1','RF2','RF3','Location','NorthEast');
%lgd = legend('Spatial','RF2','Location','NorthEast');
%lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
xlim([1 100]);
xticks([10^0 10^1 10^2]), yticks([10^-4 10^-2 10^0])
ylim([10^-4 10^0])
%yticks([10^-2 10^-1 10^0])
%ylim([10^-2 10^0]);
set(gca,'yscale','log','xscale','log');
%%
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\35PercentEnergy_1\uv_rec_';
fileName = strcat(int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 1.2575;
%%
k = 54;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
%c = colorbar;
%c.LineWidth = 2;
colormap(jet(256))
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
Uphi2 = Uphi(2:6:106,2:3:30);
Vphi2 = Vphi(2:6:106,2:3:30);
startx = (x1(1)/D)*ones(30,1);
sty = y1(30)/D*ones(106,1);
stx = x1/D;
sttx = vertcat(startx,stx);
starty = y1/D;
stty = vertcat(starty,sty);
[x3,y3] = meshgrid(x1(2:6:106),y1(2:3:30));
s = streamline(x1/D,y1/D,Uphi',Vphi',x3/D,y3/D);
set(s,'Color',[0.4 0.4 0.4],'LineWidth',1);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
%plot(plot::streamlines2d(Uphi',Vphi',x1/D,y1/D));
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%%