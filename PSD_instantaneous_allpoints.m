%%
clear all; 
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
xcoor2 = 54;
ycoor2 = 17;
xcoor3 = 88;
ycoor3 = 29;
%%
uvswitch = 0;
jj = xcoor2+(106*ycoor2) + uvswitch;
%%
uv_psd = zeros(193,2);
%%
for r = 1:Nb
    fileName = strcat('ens_num_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd(:,1) = uv_psd(:,1) + u_psd(1:193);
end
%%
uvswitch = 3180;
jj = xcoor2 + (106*ycoor2) + uvswitch;
%%
for r = 1:Nb
    fileName = strcat('ens_num_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd(:,2) = uv_psd(:,2) + u_psd(1:193);
end
%%
psd1 = uv_psd(:,1)/sum(uv_psd(:,1));
psd2 = uv_psd(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd1,psd2);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('\eta_i','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 700 700],'OuterPosition',[0 0 900 900])
lgd = legend('Stream-wise','Wall-normal');
lgd.FontSize = 12;
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\';
uv_psd_spat50 = zeros(193,2);
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spat50(:,2) = uv_psd_spat50(:,2) + u_psd(1:193);
end
%%
uvswitch = 0;
jj = xcoor2 + (106*ycoor2) + uvswitch;
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spat50(:,1) = uv_psd_spat50(:,1) + u_psd(1:193);
end

%%
psd3 = uv_psd_spat50(:,1)/sum(uv_psd(:,1));
psd_draw = horzcat(psd1,psd3);
plot_strouhal(psd_draw);
%%
psd4 = uv_psd_spat50(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd2,psd4);
plot_strouhal(psd_draw);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\75PercentEnergy_31\';
uv_psd_spat75 = zeros(193,2);
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spat75(:,1) = uv_psd_spat75(:,1) + u_psd(1:193);
end
%%
uvswitch = 3180;
jj = xcoor2 + (106*ycoor2) + uvswitch;
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spat75(:,2) = uv_psd_spat75(:,2) + u_psd(1:193);
end
%% psd values
psd5 = uv_psd_spat75(:,1)/sum(uv_psd(:,1));
psd_draw = horzcat(psd1,psd3,psd5);
plot_strouhal(psd_draw);
%%
psd6 = uv_psd_spat75(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd2,psd4,psd6);
plot_strouhal(psd_draw);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\20PercentEnergy_1\';
uv_psd_spatm1 = zeros(193,2);
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spatm1(:,2) = uv_psd_spatm1(:,2) + u_psd(1:193);
end
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
plot_strouhal(psd8);
%%
psd_draw = horzcat(psd1,psd5,psd3);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.035:0.07);
set(gcf,'Position',[0 0 800 800],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy');
lgd.FontSize = 12;
%%
psd_draw = horzcat(psd2,psd6,psd4);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 800 00],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy');
lgd.FontSize = 12;
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\75percentEnergy_19\';
uv_psd_spec75 = zeros(193,2);
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spec75(:,2) = uv_psd_spec75(:,2) + u_psd(1:193);
end
%%
uvswitch = 0;
jj = xcoor2 + (106*ycoor2) + uvswitch;
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spec75(:,1) = uv_psd_spec75(:,1) + u_psd(1:193);
end
%%
psd9 = uv_psd_spec75(:,1)/sum(uv_psd(:,1));
psd_draw = horzcat(psd1, psd9);
plot_strouhal(psd_draw);
%%
psd10 = uv_psd_spec75(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd2,psd10);
plot_strouhal(psd_draw);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\50percentEnergy_3\';
uv_psd_spec50 = zeros(193,2);
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spec50(:,1) = uv_psd_spec50(:,1) + u_psd(1:193);
end
%%
uvswitch = 3180;
jj = xcoor2 + (106*ycoor2) + uvswitch;
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spec50(:,2) = uv_psd_spec50(:,2) + u_psd(1:193);
end
%%
psd1 = uv_psd(:,1)/sum(uv_psd(:,1));
psd2 = uv_psd_spec75(:,1)/sum(uv_psd(:,1));
psd3 = uv_psd_spec50(:,1)/sum(uv_psd(:,1));
psd_draw = horzcat(psd1,psd2,psd3);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.035:0.07);
set(gcf,'Position',[0 0 800 00],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy');
lgd.FontSize = 12;
%%
psd1 = uv_psd(:,2)/sum(uv_psd(:,2));
psd2 = uv_psd_spec75(:,2)/sum(uv_psd(:,2));
psd3 = uv_psd_spec50(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd1,psd2,psd3);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 800 00],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy');
lgd.FontSize = 12;
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\35percentEnergy_1\';
uv_psd_spec35 = zeros(193,2);
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spec50(:,2) = uv_psd_spec50(:,2) + u_psd(1:193);
end
%%
uvswitch = 0;
jj = xcoor2 + (106*ycoor2) + uvswitch;
%%
for r = 1:Nb
    fileName = strcat('uv_rec_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_spec35(:,1) = uv_psd_spec35(:,1) + u_psd(1:193);
end
%%
psd1 = uv_psd(:,2)/sum(uv_psd(:,2));
psd2 = uv_psd_spec75(:,2)/sum(uv_psd(:,2));
psd3 = uv_psd_spec50(:,2)/sum(uv_psd(:,2));
psd4 = uv_psd_spec35(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd1,psd2,psd3,psd4);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 800 00],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy','Mode 1');
lgd.FontSize = 12;
%%
psd1 = uv_psd(:,1)/sum(uv_psd(:,1));
psd2 = uv_psd_spec75(:,1)/sum(uv_psd(:,1));
psd3 = uv_psd_spec50(:,1)/sum(uv_psd(:,1));
psd4 = uv_psd_spec35(:,1)/sum(uv_psd(:,1));
psd_draw = horzcat(psd1,psd2,psd3,psd4);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.035:0.07);
set(gcf,'Position',[0 0 800 00],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy','Mode 1');
lgd.FontSize = 12;

%%
psd1 = uv_psd(:,1)/sum(uv_psd(:,1));
psd2 = uv_psd_spat75(:,1)/sum(uv_psd(:,1));
psd3 = uv_psd_spat50(:,1)/sum(uv_psd(:,1));
psd4 = uv_psd_spatm1(:,1)/sum(uv_psd(:,1));
psd_draw = horzcat(psd1,psd2,psd3,psd4);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.035:0.07);
set(gcf,'Position',[0 0 800 00],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy','Mode 1');
lgd.FontSize = 12;
%%
psd1 = uv_psd(:,2)/sum(uv_psd(:,2));
psd2 = uv_psd_spat75(:,2)/sum(uv_psd(:,2));
psd3 = uv_psd_spat50(:,2)/sum(uv_psd(:,2));
psd4 = uv_psd_spatm1(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd1,psd2,psd3,psd4);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 800 00],'OuterPosition',[0 0 900 900])
lgd = legend('Measured','75% energy','50% energy','Mode 1');
lgd.FontSize = 12;
%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
xcoor2 = 21;
ycoor2 = 17;
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
uv_psd_meas = zeros(193,2);
%%
uvswitch = 3180;
jj = xcoor2 + (106*ycoor2) + uvswitch;
%%
for r = 1:Nb
    fileName = strcat('ens_num_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_point(:,1) = uv(jj,:);
    uv_bar = fft(uv_point);
    u_psd = conj(uv_bar).*uv_bar;
    uv_psd_meas(:,2) = uv_psd_meas(:,2) + u_psd(1:193);
end
%% Plot these graphs
psd1 = uv_psd_meas(:,1)/sum(uv_psd_meas(:,1));
psd2 = uv_psd_spat35(:,1)/sum(uv_psd_meas(:,1));
psd3 = uv_psd_spec35(:,1)/sum(uv_psd_meas(:,1));
%psd4 = uv_psd_spatm1(:,2)/sum(uv_psd(:,2));
psd_draw = horzcat(psd1,psd2,psd3);
plot_strouhal(psd_draw);
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34,'FontWeight','Bold'), ylabel('PSD (1/Hz)','FontSize',34,'FontWeight','Bold'), xticks(0:0.25:0.5); yticks(0:0.05:0.1);
set(gcf,'Position',[0 0 800 800])
lgd = legend('Measured','Spatial','Spectral','RF1','RF2','RF3','RF4');
lgd.FontSize = 12;
%%


