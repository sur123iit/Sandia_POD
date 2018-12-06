%% Reconstruction of velocity animations (measured and reconstructed)
clear all;
%% 
[ L,D,Ma,Uinf,Fs,N,Nb ] = load_parameters(1);
%%
ens_num = 6;
%folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\35PercentEnergy_3\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
%fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
%%
uvm = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\vel_mean.txt');
uvm1 = uvm(:,ens_num);
c_lim_max = 1.2575;
%%
%uv_lim = uv + uvm1;
%c_lim_max = max(max(uv_lim))/Uinf;
%c_lim_min = min(min(uv_lim))/Uinf;
%%
%%for k = 1:5
folderName = 'C:\Users\surabhi123iit\Dropbox (UFL)\Spring 2018\Spring 2018 documents\Sandia Work\Fall2018\VelocityReconstructions_Seminar_Sept4\';
fileName = strcat('Urec_spat35_',int2str(ens_num),'.avi');
completeName = strcat(folderName,fileName);
v = VideoWriter(completeName);
v.FrameRate = 2;
open(v);
for k = 1:386
    uv1 = uv(:,k);
    UV1 = uv1 + uvm1;
    [x1,y1,Uphi,Vphi] = cont_plot_uv(UV1);
    Phi_viz = Uphi/Uinf;
    contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
    caxis([-c_lim_max c_lim_max]);
    colormap(jet(256))
    x2 = x1(2:4:106);
    y2 = y1(2:2:30);
    Uphi2 = Uphi(2:4:106,2:2:30);
    Vphi2 = Vphi(2:4:106,2:2:30);
    hold on;
    q = quiver(x2/D,y2/D,Uphi2',Vphi2');
    q.Color = [0 0 0];
    q.AutoScaleFactor = 1.5;
    q.LineWidth = 1.5;
    set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
    set(gcf,'Position',[0 0 1265 540])
    xlim([-0.2 5.2]), ylim([-1.1 1.1])
    pbaspect([5.4 2.2 1])
    xticks(0:1:5), yticks(-1:1:1)
    line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
    hold off
    F = getframe(gcf);
    writeVideo(v,F);
end
close(v);
%%