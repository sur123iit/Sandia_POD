% Standard DMD and Total DMD. The function used here is from Rowley's github codes
clear all;
%% Load parameters
Mach = 0.8;
N = 386;
D = 25.4*10^-3;
L = 127*10^-3;
Uinf = 272.23;
%% Load x and y for one ensemble
ens_num = input('Enter the ensemble number whose DMD you need to calculate:  '); 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
x = reduce_cols(uv,1,1);
y = reduce_cols(uv,1,2);
r = N-1; % still hardcoded
%% Perform Standard DMD (with rank reduction) (Taken from Rowley's github)
[u, dmd_vec, dmd_evals] = std_dmd(x,y,r);
dmd_evals1 = diag(dmd_evals);
real_evals = real(dmd_evals1);
imag_evals = imag(dmd_evals1);
dmd_modes = u*dmd_vec;
dmd_amps = pinv(dmd_modes)*x(:,1); %CHECK!!
%% Calculate frequency, growth rate and some other parameters required for plotting
del_t = 10.2*(10^-3)/386;
mode_frequencies = angle(dmd_evals1)*37500/(2*pi);
mode_growthrate = log(abs(dmd_evals1))/del_t; %CHECK!!
dmd_amps_norm = abs(dmd_amps); %CHECK!!
x_max = max(mode_frequencies);
fact_str = D/Uinf;
%% Sort
[a_sorted,a_order] = sort(mode_frequencies);
new_eigval = dmd_evals1(a_order,1);
new_freq = mode_frequencies(a_order,1);
new_dmd_modes(:,:) = dmd_modes(:,a_order);
%% Comparison with SPOD
freq_dmd = new_freq(193:385);
modes_dmd = new_dmd_modes(:,193:385);
eigval_dmd = new_eigval(:,193:385);
%% Plot eigen value circle
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
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

%% Plot dmd_amps vs mode_frequencies
close all;
plot(mode_frequencies,dmd_amps_norm,'*');
set(gca,'fontsize',15);
xlabel('Frequency(Hz)','FontSize',25), ylabel('Modal Amplitude','FontSize',25),
pbaspect([1 1 1])
ymax = input('Enter max limit of y from the graph');
ylim([0 ymax]);
xlim([0 x_max]);
set(gcf,'Position',[0 0 800 800])
%% Plot dmd_amp_norm vs mode_frequency strouhal number
close all;
plot(mode_frequencies*fact_str,dmd_amps_norm,'*')
ylim([0 ymax]);
pbaspect([1 1 1])
ymax = input('Enter max limit of y from the graph');
rfreq = Ros_freq(0.8,8,L);
hold on;
for rfreq_i = 1:8
    plot([rfreq(rfreq_i,1)*fact_str rfreq(rfreq_i,1)*fact_str],[0 ymax],'--')
end
set(gca,'fontsize',15);
lgd = legend('Modal Amplitudes','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3','Rossiter Mode 4','Rossiter Mode 5','Rossiter Mode 6','Rossiter Mode 7','Rossiter Mode 8');
lgd.FontSize = 10;
xlabel('St','FontSize',25), ylabel('Modal Amplitude','FontSize',25),
set(gcf,'Position',[0 0 800 800])
xlim([0 0.8]);
ylim([0 ymax]);
%% Save this plot
name = '' ;
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_frequencies','dmd_amps_norm','rfreq','fact_xmax','fact_str','xmax','ymax');
%% Plot amp_norm vs mode_growthrate
close all;
plot(mode_growthrate,dmd_amps_norm,'*');
set(gca,'fontsize',15);
xlabel('Growth Rate (per sec)','FontSize',25), ylabel('Modal Amplitude','FontSize',25);
set(gcf,'Position',[0 0 800 800])
name = strcat('dmd_cross_first50_modeamp_growth_ens_',int2str(ens_num));
fpath = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\graphs\';
saveas(gca, fullfile(fpath, name),'png');
save(strcat(fpath,name,'.mat'),'mode_growthrate','dmd_amps_norm');
%% Plot difference between tdmd and dmd
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


%% Another Approach of pair collection to be inspected!
ens_num = 1;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
x = uv(:,1:200);
y = uv(:,101:300);
r = 200;
%% tdmd 
[tdmd_evals,~] = tdmd(x,y,r);
plot(real(tdmd_evals(1:50,1)),imag(tdmd_evals(1:50,1)),'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
pbaspect([1 1 1]), xlabel('Real part'),ylabel('Imaginary part')
%% Contour plot for dmd_modes
close all;
%13, 31, 81
index_freq = 81 ;
[x1,y1,Uphi,Vphi] = cont_plot_uv(abs(dmd_modes(:,index_freq)));
contourf(x1*10^-3/D,y1*10^-3/D,Uphi',100,'LineStyle','none');
set(gca,'fontsize',15);
xlabel('x/D','FontSize',25), ylabel('y/D','FontSize',25),
colorbar
axis equal
set(gcf,'Position',[0 0 1200 400])
%% Calculating growth rate and frequency according to tsfp_new.pdf
fs = 37500;
g = log(abs(dmd_evals))*fs;
gr = diag(g);
plot(1:385,gr);
f = angle(dmd_evals1)*37500/(2*pi);
f = abs(f);
f1 = diag(f);
plot(1:385,f1,'*');
%% ydmd vs mode frequencies
close all;
for ii = 1:r
    ydmd(ii) = norm(dmd_modes(:,ii)).*abs(dmd_evals1(ii));
end
ydmd = ydmd./max(ydmd);
plot(mode_frequencies,ydmd,'*'), xlim([0 2*10^4]);
set(gca,'fontsize',15);
xlabel('Frequency(Hz)','FontSize',25), ylabel('ydmd','FontSize',25),
%% ydmd vs strouhal mode numbers
close all;
plot(mode_frequencies*fact_str,ydmd,'*')
pbaspect([1 1 1])
rfreq = Ros_freq(0.8,8,L);
hold on;
for rfreq_i = 1:8
    plot([rfreq(rfreq_i,1)*fact_str rfreq(rfreq_i,1)*fact_str],[0 1.01],'--')
end
set(gca,'fontsize',15);
lgd = legend('y_d_m_d','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3','Rossiter Mode 4','Rossiter Mode 5','Rossiter Mode 6','Rossiter Mode 7','Rossiter Mode 8','Location','East');
lgd.FontSize = 12;
xlabel('St_D','FontSize',25), ylabel('y_d_m_d','FontSize',25),
set(gcf,'Position',[0 0 800 800])
xlim([0 0.8]);
ylim([0 1.01]);
%% Find indices near Rossiter frequencies
for ii = 1:385
    if mode_frequencies(ii,1) > 2310 && mode_frequencies(ii,1) < 2380
        disp(ii);
    end
end

%% Find indices for lower and higher ymd

for ii = 1:385
    if ydmd(ii) >0.998
        disp(ii);
    end
end
%%


