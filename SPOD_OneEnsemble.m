%%
clear all;
%% Load parameters
Mach = 0.8;
N = 386;
D = 25.4*10^-3;
L = 127*10^-3;
Uinf = 272.23;
%%
ens_num = input('Enter the ensemble number whose DMD you need to calculate:  '); 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
qj = load(completeName);
qj_bar = fft(qj');
clear qj;
qj_bar_t = qj_bar';
clearvars qj_bar;
qj_bar_ens(:,:) = qj_bar_t(:,1:193);
clearvars qj_bar_t;
%% SPOD application to one block -- discuss
n = 193;
for f = 1:n
qj_bar_inst(:,1) = qj_bar_ens(:,f);
qj_mat = qj_bar_inst'*qj_bar_inst;
[eigvec,eigval,eigvec_rt] = svd(qj_mat);
eigen_val(:,f) = eigval;
POD_spect_inst = qj_bar_inst*eigvec*1/sqrt(eigval);
POD_spect_coeff(:,f) = POD_spect_inst;
clearvars POD_spect_inst;
end
%% SPOD application - your way
%qj_bar_ens
%% Contour plot
close all;
index_freq = 7;
[x1,y1,Uphi,Vphi] = cont_plot_uv(abs(POD_spect_coeff(:,index_freq)));
contourf(x1*10^-3/D,y1*10^-3/D,Uphi',100,'LineStyle','none');
set(gca,'fontsize',15);
xlabel('x/D','FontSize',25), ylabel('y/D','FontSize',25),
colorbar
axis equal
set(gcf,'Position',[0 0 1200 400])
%% 