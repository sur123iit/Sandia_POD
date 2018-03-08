clear all;
%% Load parameters
[

%% Exact dmd pairs
ens_num = 1;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
x = load(completeName);

ens_num = 2;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
y = load(completeName);

r = N;
ens_num = ens_num - 1;
%% Perform Exact DMD
[u, dmd_vec, dmd_evals] = exact_dmd(x,y,r);
dmd_evals1 = diag(dmd_evals);
real_evals = real(dmd_evals1);
imag_evals = imag(dmd_evals1);
%% Plot Real vs Imaginary parts of the eigen-values
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
dmd_modes = u*dmd_vec;
dmd_amps = pinv(dmd_modes)*x(:,1);
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
%% Saving this graph. Take care of the name that you give it
name = %based on ens_num
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'real_evals','imag_evals');
%% Plot Real vs Imaginary parts of eigen-values of first few modes
close all;
plot(real_evals(1:50,1),imag_evals(1:50,1),'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
dmd_modes = u*dmd_vec;
dmd_amps = pinv(dmd_modes)*x(:,1);
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
%% Save this plot
name = strcat('dmd_cross_first50_lambda_real_imag_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'real_evals','imag_evals');
%% Find parameters (growth and frequency)
[mode_frequencies,mode_growthrate] = freq_growth(dmd_evals1);
dmd_amps_norm = abs(dmd_amps);

%% Find axis parameters
x_max = max(mode_frequencies);
fact_xmax = 37500/(2*x_max);
fact_str = 25.4*10^-3/272.23;
%% Just the non factorized amplitude vs frequency for all modes
close all;
plot(mode_frequencies,dmd_amps_norm,'*');
set(gca,'fontsize',15);
xlabel('Frequency(Hz)','FontSize',25), ylabel('Modal Amplitude','FontSize',25),
pbaspect([1 1 1])
xlim([0 2*10^4]); ylim([0 (max(dmd_amps_norm)+10^3)]);
set(gcf,'Position',[0 0 800 800])
%% Saving this plot
name = strcat('dmd_cross_modeamp_freq_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_frequencies','dmd_amps_norm')
%% Just the non factorized amplitude vs frequency for first few modes
close all;
plot(mode_frequencies(1:50,1),dmd_amps_norm(1:50,1),'*');
set(gca,'fontsize',15);
xlabel('Frequency(Hz)','FontSize',25), ylabel('Modal Amplitude','FontSize',25),
pbaspect([1 1 1])
xlim([0 2*10^4]); ylim([0 (max(dmd_amps_norm)+10^3)]);
set(gcf,'Position',[0 0 800 800])
%% Saving this plot
name = strcat('dmd_cross_first50_modeamp_freq_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_frequencies','dmd_amps_norm')
%% Plot using Rossiter modes vs Strouhal number
close all;
ymax = 4.5*10^4;
plot(mode_frequencies*fact_xmax*fact_str,dmd_amps_norm,'*')
set(gca,'fontsize',15);
xlim([0 8000*fact_str]); ylim([0 ymax]);
xmax = 8000*fact_str;
pbaspect([1 1 1])
rfreq = Ros_freq(0.8,8);
hold on;
for rfreq_i = 1:8
    plot([rfreq(rfreq_i,1)*fact_str rfreq(rfreq_i,1)*fact_str],[0 ymax],'--')
end
lgd = legend('Modal Amplitudes','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3','Rossiter Mode 4','Rossiter Mode 5','Rossiter Mode 6','Rossiter Mode 7','Rossiter Mode 8');
lgd.FontSize = 10;
xlabel('St','FontSize',25), ylabel('Modal Amplitude','FontSize',25),
set(gcf,'Position',[0 0 800 800])
name = strcat('dmd_cross_modeamp_st_ross_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_frequencies','dmd_amps_norm','rfreq','fact_xmax','fact_str','xmax','ymax');
%% Growth Rate Plot for all modes
close all;
plot(mode_growthrate,dmd_amps_norm,'*');
set(gca,'fontsize',15);
xlabel('Growth Rate (per sec)','FontSize',25), ylabel('Modal Amplitude','FontSize',25);
xlim([-14*10^4 2*10^4]), ylim([0 10000])
set(gcf,'Position',[0 0 800 800])
%% Save this plot
name = strcat('dmd_cross_modeamp_growth_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_growthrate','dmd_amps_norm');
%% Growth Rate Plot for first 50 modes
close all;
plot(mode_growthrate(1:50,1),dmd_amps_norm(1:50,1),'*');
set(gca,'fontsize',15);
xlabel('Growth Rate (per sec)','FontSize',25), ylabel('Modal Amplitude','FontSize',25);
xlim([-14*10^4 2*10^4]), ylim([0 10000])
set(gcf,'Position',[0 0 800 800])
%% Save this plot
name = strcat('dmd_cross_first50_modeamp_growth_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_growthrate','dmd_amps_norm');
%%

