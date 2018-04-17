%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv_spat = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\50percentEnergy_3\';
%fileName = strcat('ens_num_',int2str(r),'.txt');
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv_spec = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityAnimations\';
fileName = strcat('Urec_',int2str(r),'.avi');
completeName = strcat(folderName,fileName);
v = VideoWriter(completeName);
<<<<<<< HEAD
v.FrameRate = 2;
=======
>>>>>>> b60db244de0c79f70af91453f8845dffc49dcf99
open(v);
for k = 1:386  
[x1,y1,Uphi,Vphi] = cont_plot_uv(uv_t(:,k));
Phi_viz = Uphi/Uinf;
subplot(2,2,1);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
caxis([-1 1]);
colormap(redblue);
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
hold off
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
axis equal
xlim([0 5]), ylim([-1 1])
%set(gcf,'Position',[0 0 1200 400])
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
xticks(0:1:5), yticks(-0.5:0.5:0.5)
[x1,y1,Uphi,Vphi] = cont_plot_uv(uv_spec(:,k));
Phi_viz = Uphi/Uinf;
subplot(2,2,2)
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
caxis([-1 1])
colormap(redblue);
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
hold off
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
axis equal
xlim([0 5]), ylim([-1 1])
%set(gcf,'Position',[0 0 1200 400])
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%xticks(0:1:5), yticks(-0.5:0.5:0.5)
[x1,y1,Uphi,Vphi] = cont_plot_uv(uv(:,k));
Phi_viz = Uphi/Uinf;
subplot(2,2,3);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
caxis([-1 1])
colormap(redblue);
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
hold off
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
axis equal
xlim([0 5]), ylim([-1 1])
%set(gcf,'Position',[0 0 1200 400])
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%xticks(0:1:5), yticks(-0.5:0.5:0.5)
pause(0.25);
F = getframe(gcf);
writeVideo(v,F);
end
close(v);
%%

