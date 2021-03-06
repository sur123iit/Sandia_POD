clear all;
r = 2;
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\20PercentEnergy_1\uv_rec_';
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
k = 42;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
%%
[x1,y1,Uphi,Vphi] = cont_plot_uv( uv_rms );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
%Uphi all frequencies
%c_lim = 54.8754/Uinf;
%Vphi all frequencies
%c_lim = 37.7095/Uinf;
%c_lim = 0.15;
%c_lim = 0.08;
%c_lim = 0.07;
%caxis([0 c_lim]);
%c = colorbar;
%c.LineWidth = 2;
colormap(jet(256))
hold on
%x2 = x1(1:6:106);
%y2 = y1(3:3:30);
%Uphi2 = Uphi(1:6:106,3:3:30);
%Vphi2 = Vphi(1:6:106,3:3:30);
%[x3,y3] = meshgrid(x2,y2);
%s = streamline(x1/D,y1/D,Uphi',Vphi',x3/D,y3/D);
%set(s,'Color',[0.2 0.2 0.2],'LineWidth',1);
%{
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 0.9;
q.LineWidth = 2;
%}
%plot(plot::streamlines2d(Uphi',Vphi',x1/D,y1/D));
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off