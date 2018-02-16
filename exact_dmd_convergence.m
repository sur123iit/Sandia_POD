%% EXACT DMD CONVERGENCE PLOTS
clear all;
%% Load parameters
[ L,D,Ma,Uinf,N,~] = load_parameters(1);
freq_conv = zeros(N,10);
%%
for ens_num = 1:100
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
x = load(completeName);

folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num+1),'.txt');
completeName = strcat(folderName,fileName);
y = load(completeName);

r = 386;
% Exact DMD
[u, dmd_vec, dmd_evals, dmd_modes] = exact_dmd(x,y,r);
for ii = 1:386
    dmd_modes(:,ii) = dmd_modes(:,ii)/dmd_evals(ii,ii);
end
dmd_evals1 = diag(dmd_evals);
% Frequency 
mode_frequencies = angle(dmd_evals1)*37500/(2*pi);
% Sorting in right order
[a_sorted,a_order] = sort(mode_frequencies);
new_eigval = dmd_evals1(a_order,1);
new_freq = mode_frequencies(a_order,1);
new_dmd_modes(:,:) = dmd_modes(:,a_order);

freq_conv(:,ens_num) = new_freq;
clearvars x y
end
%%
freq_conv_sum = zeros(386,10);
sum = zeros(386,1);
for ii = 1:10
    sum = sum + freq_conv(:,ii);
    freq_conv_sum(:,ii) = sum;
end
for ii = 1:10
    freq_conv_sum(:,ii) = freq_conv_sum(:,ii)/ii;
end
plot(1:386,freq_conv_sum(:,1),'.-',1:386,freq_conv_sum(:,2),'.-',1:386,freq_conv_sum(:,3),'.-',1:386,freq_conv_sum(:,4),'.-',1:386,freq_conv_sum(:,5),'.-',1:386,freq_conv_sum(:,6),'.-',1:386,freq_conv_sum(:,7),'.-',1:386,freq_conv_sum(:,8),'.-');
legend('1','2','3','4','5','6','7','8');
xlim([194 230])
plot(1:386,freq_conv_sum(:,10),'.-')
%%
clearvars x y
%% Data collection 2
ens_num = 2;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
x = load(completeName);

ens_num = 3;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
y = load(completeName);

r = 386;
%% Exact DMD Application
[u, dmd_vec, dmd_evals, dmd_modes] = exact_dmd(x,y,r);
for ii = 1:386
    dmd_modes(:,ii) = dmd_modes(:,ii)/dmd_evals(ii,ii);
end
dmd_evals1 = diag(dmd_evals);
%% Frequency and Growth Rate
mode_frequencies = angle(dmd_evals1)*37500/(2*pi);
%% Sorting in right order
[a_sorted,a_order] = sort(mode_frequencies);
new_eigval = dmd_evals1(a_order,1);
new_freq = mode_frequencies(a_order,1);
new_dmd_modes(:,:) = dmd_modes(:,a_order);
%%
jj = 2;
freq_conv(:,jj) = (freq_conv(:,1)+new_freq)/jj;
%%
clearvars x y
%% Data collection 3
ens_num = 3;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
x = load(completeName);

ens_num = 4;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
y = load(completeName);

r = 386;
%% Exact DMD Application
[u, dmd_vec, dmd_evals, dmd_modes] = exact_dmd(x,y,r);
for ii = 1:386
    dmd_modes(:,ii) = dmd_modes(:,ii)/dmd_evals(ii,ii);
end
dmd_evals1 = diag(dmd_evals);
%% Frequency and Growth Rate
mode_frequencies = angle(dmd_evals1)*37500/(2*pi);
%% Sorting in right order
[a_sorted,a_order] = sort(mode_frequencies);
new_eigval = dmd_evals1(a_order,1);
new_freq = mode_frequencies(a_order,1);
new_dmd_modes(:,:) = dmd_modes(:,a_order);
%%
jj = 3;
freq_conv(:,jj) = (freq_conv(:,1)+freq_conv(:,1)+new_freq)/jj;
%%
clearvars x y
%% Data collection 4
ens_num = 4;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
x = load(completeName);

ens_num = 5;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
y = load(completeName);

r = 386;
%% Exact DMD Application
[u, dmd_vec, dmd_evals, dmd_modes] = exact_dmd(x,y,r);
for ii = 1:386
    dmd_modes(:,ii) = dmd_modes(:,ii)/dmd_evals(ii,ii);
end
dmd_evals1 = diag(dmd_evals);
%% Frequency and Growth Rate
mode_frequencies = angle(dmd_evals1)*37500/(2*pi);
%% Sorting in right order
[a_sorted,a_order] = sort(mode_frequencies);
new_eigval = dmd_evals1(a_order,1);
new_freq = mode_frequencies(a_order,1);
new_dmd_modes(:,:) = dmd_modes(:,a_order);
%%
jj = 4;
freq_conv(:,jj) = (freq_conv(:,1)+freq_conv(:,1)+new_freq)/jj;