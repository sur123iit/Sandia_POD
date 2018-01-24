% Standard DMD and Total DMD. The function used here is from Rowley's github codes
clear all;
%%
%DMD applied to pairs of data x = [x1 x2... xn-1] and y = [x2 x3... xn]
%Here n =  386 i.e. one full run
Mach = 0.8;
N = 386;
%%
ens_num = input('Enter the ensemble number whose DMD you need to calculate:  '); 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
x = reduce_cols(uv,1,1);
y = reduce_cols(uv,1,2);
r = N-1; % still hardcoded

%% Another Approach of pair collection to be inspected!
ens_num = 1;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
x = uv(:,1:200);
y = uv(:,101:300);
r = 200;
%%
%Another approach is to calculate what should be the rank here. That should
%be part of your future work!

%%
%Please do inspect this method of 
[tdmd_evals,~] = tdmd(x,y,r);
plot(real(tdmd_evals(1:50,1)),imag(tdmd_evals(1:50,1)),'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
pbaspect([1 1 1]), xlabel('Real part'),ylabel('Imaginary part')
%% Perform Standard DMD (with rank reduction) (Taken from Rowley's github)
[u, dmd_vec, dmd_evals] = std_dmd(x,y,r);
dmd_evals1 = diag(dmd_evals);
real_evals = real(dmd_evals1);
imag_evals = imag(dmd_evals1);
%% Plot eigen value circle
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
dmd_modes = u*dmd_vec;
dmd_amps = pinv(dmd_modes)*x(:,1);
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
xticks(-1:0.25:1); yticks(-1:0.25:1);
%% Save this plot
name = strcat('dmd_cross_lambda_real_imag_ens_',int2str(ens_num-1));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'real_evals','imag_evals');

%%
dt = 10.2*(10^-3)/386;
mode_frequencies = angle(dmd_evals1)/(2*pi*dt);
mode_growthrate = log(abs(dmd_evals1))/dt;
dmd_amps_norm = abs(dmd_amps);
x_max = max(mode_frequencies);
fact_xmax = 37500/(2*x_max);
fact_str = 25.4*10^-3/272.23;
%%
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

%%
close all;
plot(mode_growthrate(1:50,1),dmd_amps_norm(1:50,1),'*');
set(gca,'fontsize',15);
xlabel('Growth Rate (per sec)','FontSize',25), ylabel('Modal Amplitude','FontSize',25);
set(gcf,'Position',[0 0 800 800])
name = strcat('dmd_cross_first50_modeamp_growth_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_growthrate','dmd_amps_norm');
%%
%create contour plot for the modes
[x1,x2,Uphi,Vphi] = cont_plot_uv(Phi(:,10));
contourf(x1,x2,(abs(Uphi))',100,'LineStyle','none');
%title ('V Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal
%%
%Plotting a circle
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
%%
%h=plot(real(true_evals),imag(true_evals),'s'); setmarkers(h,'k'); hold on;
th = [0:.01:2*pi 0.01];
[setfonts] = @(h) set(h,'FontSize',14);
[setmarkers] = @(h,col2,col1) set(h,'MarkerSize',col2,'MarkerEdgeColor',...
                            col1,'MarkerFaceColor',col1);
h=plot(real(dmd_evals),imag(dmd_evals),'o'); setmarkers(h,4,'g');
hold on;
h=plot(real(tdmd_evals),imag(tdmd_evals),'^'); setmarkers(h,2,'m');
hold on;
plot(cos(th),sin(th),'k--'); % unit circle
hold on;
axis equal
h=xlabel('Re(\lambda)'); setfonts(h);
h=ylabel('Im(\lambda)'); setfonts(h);
h=legend('DMD','TDMD','Unit Circle'); setfonts(h);
setfonts(gca);
%%
%Calculating growth rate and frequency according to tsfp_new.pdf
fs = 37500;
g = log(abs(dmd_evals))*fs;
gr = diag(g);
plot(1:385,gr);
f = angle(dmd_evals)*37500/(2*pi);
f = abs(f);
f1 = diag(f);
plot(1:385,f1,'*');

%%
%Just the non factorized amplitude vs frequency
plot(mode_frequencies(1:50,1),dmd_amps_norm(1:50,1),'*');
set(gca,'fontsize',15);
xlabel('Frequency(Hz)','FontSize',25), ylabel('Modal Amplitude','FontSize',25),
pbaspect([1 1 1])
xlim([0 2*10^4]); ylim([0 4.5*10^4]);
set(gcf,'Position',[0 0 800 800])
name = strcat('dmd_cross_first50_modeamp_freq_ens_',int2str(ens_num-1));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_frequencies','dmd_amps_norm')
%%

