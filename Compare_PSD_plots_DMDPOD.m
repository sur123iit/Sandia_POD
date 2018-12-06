%%
clear all; 
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
xcoor2 = 54;
ycoor2 = 17;
xcoor3 = 88;
ycoor3 = 29;
%%

uvswitch = 0;
jj = xcoor2+(106*ycoor2) + uvswitch;

%%
uvswitch = 3180;
jj = xcoor2 + (106*ycoor2) + uvswitch;

%%
load('Y:\rawdata\Sandia_cavity\Spectral velocity data\Reconstruction_PSD\psd_avg.mat');
psd_msd = psd_fin;
clear psd_fin;

load('Y:\rawdata\Sandia_cavity\DMD\Reconstructions_OneBlock\Energy35\psd_avg.mat');
psd_dmd = psd_fin;
clear psd_fin;

load('Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\Reconstruction_PSD\Percent35\psd_avg.mat');
psd_pod = psd_fin;
clear psd_fin;

load('Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\Reconstruction_PSD\psd_avg.mat');
psd_spod = psd_fin;
clear psd_fin;

%%

psd_mat = horzcat(psd_msd(:,jj),psd_pod(:,jj), psd_spod(:,jj),psd_dmd(:,jj));
%%

plot_strouhal(psd_mat);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.75:1.5);
set(gcf,'Position',[0 0 1000 1000])
legend('Measured','POD','Spatial POD','DMD');
%%
psd8 = uv_psd_spatm1(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd2,psd6,psd4,psd8);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('\eta_i','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 700 700],'OuterPosition',[0 0 900 900])
lgd = legend('Instantaneous','75% energy','50% energy');
lgd.FontSize = 12;
