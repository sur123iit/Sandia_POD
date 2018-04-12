%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
for r = 1:10
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv_t = load(completeName);
cmax1 = max(max(uv_t));
cmin1 = min(min(uv_t));
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
cmax2 = max(max(uv));
cmin2 = min(min(uv));
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityAnimations\';
fileName = strcat('Uphi_',int2str(r),'.avi');
completeName = strcat(folderName,fileName);
v = VideoWriter(completeName);
open(v);
for k = 1:386  
[x1,y1,Uphi,Vphi] = cont_plot_uv(uv_t(:,k));
Phi_viz = Uphi;
subplot(2,1,1);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
caxis([cmin1 cmax1]);
colormap(redblue);
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
hold off
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
axis equal
xlim([min(x1/D)-0.1 max(x1/D)+0.1]), ylim([min(y1/D)-0.05 max(y1/D)+0.05])
%set(gcf,'Position',[0 0 1200 400])
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%xticks(0:1:5), yticks(-0.5:0.5:0.5)
[x1,y1,Uphi,Vphi] = cont_plot_uv(uv(:,k));
Phi_viz = Uphi;
subplot(2,1,2)
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
caxis([cmin2 cmax2])
colormap(redblue);
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
hold off
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
axis equal
xlim([min(x1/D)-0.1 max(x1/D)+0.1]), ylim([min(y1/D)-0.05 max(y1/D)+0.05])
%set(gcf,'Position',[0 0 1200 400])
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%xticks(0:1:5), yticks(-0.5:0.5:0.5)
pause(0.25);
F = getframe(gcf);
writeVideo(v,F);
end
close(v);
end
%%

