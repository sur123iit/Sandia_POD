%% Standard DMD. The function used here is from Rowley's github codes
%The codes below implement DMD technique to one block of data
%Rank reduction is not done here
clear all;
%% Load parameters
[L,D,Mach,Uinf,Fs,N,~] = load_parameters(1);
%% Load x and y for one ensemble/block 
ens_num = input('Enter the ensemble number whose DMD you need to calculate:  '); 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
x = reduce_cols(uv,1,1);
y = reduce_cols(uv,1,2);
r = N-1; 
%% Perform Standard DMD  (std_dmd function's algorithm taken from Rowley's github) (r = N-1)
[u, dmd_vec, dmd_evals, dmd_modes,mode_frequencies] = std_dmd(x,y,r,Fs);
[dmd_freq,dmd_eval,dmd_mode] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
%% Plot eigen value circle
close all;
real_evals = real(dmd_eval);
imag_evals = imag(dmd_eval);
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',28), ylabel('Imag(\lambda)','FontSize',28)
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
xticks(-1:0.25:1); yticks(-1:0.25:1);
%% Reconstruction of the data in time and it's visualization




