%This code is based on the DMD application to square cavities of Schmid
%% 
clear all;
%% Load parameters
[ L,D,Mach,Uinf,N,~] = load_parameters(1);
Fs = 37500;
%% Extraction 1
ens_num = 20;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
x = uv(:,1:385);
y = uv(:,2:386);
r = 25;
%% Perform Standard DMD
[u, dmd_vec, dmd_evals, dmd_modes] = std_dmd(x,y,r);
mode_frequencies = angle(dmd_evals)*37500/(2*pi);
%% Plot eigen value circle
close all;
real_evals = real(dmd_evals);
imag_evals = imag(dmd_evals);
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',28), ylabel('Imag(\lambda)','FontSize',28)
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
xticks(-1:0.25:1); yticks(-1:0.25:1);
%Extraction 2
%%
[a_sorted,a_order] = sort(mode_frequencies);
new_eigval = dmd_evals(a_order,1);
new_freq = mode_frequencies(a_order,1);
new_dmd_modes(:,:) = dmd_modes(:,a_order);
new_freq2 = new_freq;
%%
close all;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval1 = sum(eig_val);
sum_eigval2 = sum(sum_eigval1);
eigval = eig_val(1:4,:)/sum_eigval2;
eigval = eigval';
eigval_t(:,1) = sum(eig_val,1);
eigval_t = eigval_t/sum_eigval2;
eigval = horzcat(eigval_t,eigval);
plot_strouhal(eigval_t);
hold on
for ii = 1:size(new_freq2)
    if abs(new_eigval(ii))>0.96
    plot([new_freq2(ii)*D/Uinf new_freq2(ii)*D/Uinf],[0 0.1],'--');
    end
end

pbaspect([1 1 1]);
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28), ylabel('\eta_i','FontSize',28), xticks(0:0.1:0.5); yticks(0:0.02:0.1);
set(gcf,'Position',[0 0 700 700])
ylim([0 0.1])
%lgd = legend('\eta_t','\eta_1','\eta_2','\eta_3','\eta_4','RF_1','RF_2','RF_3','RF_4');
%lgd.FontSize = 12;
%%
close all;
plot(new_freq2*D/Uinf,abs(new_eigval),'o')
pbaspect([1 1 1]);
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28), ylabel('|\lambda|','FontSize',28), %xticks(0:0.1:0.5); yticks(0:0.02:0.1);
set(gcf,'Position',[0 0 700 700])
ylim([0 1.1])
xlim([0 0.5])
