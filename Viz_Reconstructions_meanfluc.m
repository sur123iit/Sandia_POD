%%
clear all;
%%
r = 6;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = 'vel_mean.txt';
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,r);

%%
finput = input('Which reconstruction you want? \n 1: Spatial 2: Spectral 3: Instantaneous 4: Other  ');
if finput == 1
    folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\';
    fileName = strcat('uv_rec_',int2str(r),'.txt');
elseif finput == 2
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\50percentEnergy_3\';
    fileName = strcat('uv_rec_',int2str(r),'.txt');
elseif finput == 3
    folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(r),'.txt');
else
    folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
    fileName = strcat('uv_rec_',int2str(r),'.txt');
end
completeName = strcat(folderName,fileName);
uv = load(completeName);
%%
uv1 = uv(:,10:4:34);
UV1 = uv1 + uvm1;
uv_max_lim = max(max(UV1));
c_lim = uv_max_lim/Uinf;
%%
clearvars uv1 UV1;
%%
k = 38;
%%
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
uv_min_inst = min(min(UV1));
%uv_max_inst = max(max(UV1));
%uv_lim = abs(uv_min_inst);
%c_lim = uv_lim/Uinf;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
colorbar
hold on
x2 = x1(2:4:106);
y2 = y1(2:2:30);
Uphi2 = Uphi(2:4:106,2:2:30);
Vphi2 = Vphi(2:4:106,2:2:30);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 1.5;
hold off
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
colormap(redblue)
%colorbar % depending on location
axis equal
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%set(gcf,'Position',[0 0 1300 420])
xticks(0:1:5), yticks(-0.5:0.5:0.5)
axis equal;
%%
clear all;
close all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\';
fileName = 'uv_rec_1.txt';
completeName = strcat(folderName,fileName);
uv = load(completeName);
[x1,y1,Uphi,Vphi] = cont_plot_uv( uv(:,12) );
Phi_viz = Vphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
%colorbar
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
q.AutoScaleFactor = 1.0;
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
colormap(redblue)
%colorbar % depending on location
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off