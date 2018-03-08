%EXACT DMD APPLIED TO THE DATASETS BASED ON ALGORITHM 2 OF TU ET AL
clear all;
%% Load parameters
[ L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%% Data collection
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

%% Exact DMD Application
[u, dmd_vec, dmd_evals, dmd_modes] = exact_dmd(x,y,r);
for ii = 1:386
    dmd_modes(:,ii) = dmd_modes(:,ii)/dmd_evals(ii,1);
end
%% Frequency and Growth Rate
mode_frequencies = angle(dmd_evals)*37500/(2*pi);
%% Sort according to frequency
[a_sorted,a_order] = sort(mode_frequencies);
new_eigval = dmd_evals1(a_order,1);
new_freq = mode_frequencies(a_order,1);
new_dmd_modes(:,:) = dmd_modes(:,a_order);
plot(1:386,new_freq);

%% Contour plot
%new_freq(197,1)
%new_freq(196,1)
%203
close all;
%13, 31, 81
index_freq = 210;
[x1,y1,Uphi,Vphi] = cont_plot_uv(abs(new_dmd_modes(:,index_freq)));
contourf(x1*10^-3/D,y1*10^-3/D,Vphi',100,'LineStyle','none');
set(gca,'fontsize',15);
xlabel('x/D','FontSize',25), ylabel('y/D','FontSize',25),
colorbar
axis equal
set(gcf,'Position',[0 0 1200 400])
%%
