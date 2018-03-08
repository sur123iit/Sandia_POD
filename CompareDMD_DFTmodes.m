%%
clear all;
%% Load parameters
[ L,D,Ma,Uinf,N,~] = load_parameters(1);
%%
ens_num = input('Enter the ensemble number whose DMD you need to calculate:  '); 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
qj = load(completeName);
qj = qj(:,1:385);
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
clearvars -except new_freq 
%% Contour plot
close all;
index_freq = 26;
[x1,y1,Uphi,Vphi] = cont_plot_uv(abs(modes_dmd(:,index_freq)));
contourf(x1*10^-3/D,y1*10^-3/D,Uphi',100,'LineStyle','none');
set(gca,'fontsize',15);
xlabel('x/D','FontSize',25), ylabel('y/D','FontSize',25),
colorbar
axis equal
set(gcf,'Position',[0 0 1200 400])
[x1,y1,Uphi,Vphi] = cont_plot_uv(abs(POD_spect_coeff(:,index_freq)));
contourf(x1*10^-3/D,y1*10^-3/D,Uphi',100,'LineStyle','none');
set(gca,'fontsize',15);
xlabel('x/D','FontSize',25), ylabel('y/D','FontSize',25),
colorbar
axis equal
set(gcf,'Position',[0 0 1200 400])
%% 
close all;
del_f = new_freq2(2:193) - new_freq2(1:192);
delf = 37500/385*ones(192,1);
plot(1:192,del_f,'.-',1:192,delf);
hold on
%plot([7 7],[0 200],'--',[15 15],[0 200],'--',[25 25],[0 200],'--',[34 34],[0 200],'--')
set(gca,'fontsize',15);
lgd = legend('DMD modes','DFT modes');
lgd.FontSize = 10;
xlabel('i','FontSize',25), ylabel('\Deltaf','FontSize',25),
set(gcf,'Position',[0 0 800 800])
xlim([1 193]);
ylim([0 200]);
%%
close all;
freq_spod = 0:37500/385:37500/2;
freq_spod = freq_spod';
freq_ros = Ros_freq(0.8,5,L);
plot(1:193,new_freq2,'.-',1:193,freq_spod,'.-');
xlim([1 60]);
hold on
for ii = 1:5
plot([1 60],[freq_ros(ii) freq_ros(ii)],'--')
end
set(gca,'fontsize',15);
lgd = legend('DMD modes','DFT modes','RF 1','RF 2','RF 3','RF 4','RF 5','Location','Northwest');
lgd.FontSize = 10;
xlabel('i','FontSize',28), ylabel('f (Hz)','FontSize',28),
set(gcf,'Position',[0 0 800 800])
%%