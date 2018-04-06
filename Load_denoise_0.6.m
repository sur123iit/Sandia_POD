%%
clear all;
%% Loading flow parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(2);
%%
folderName = 'Y:\rawdata\Sandia_cavity\';
fileName = 'den6ens3.mat';
completeName = strcat(folderName,fileName);
load(completeName);
clearvars den6ens_mat den6ens_mean;
folderName = strcat('Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach',num2str(Mach),'\');
for ens_num = 1:50
    u1(:,:) = den6ens_fluc(:,3,(ens_num-1)*N + 1:ens_num*N);
    v1(:,:) = den6ens_fluc(:,4,(ens_num-1)*N + 1:ens_num*N);
    uv = vertcat(u1,v1);
    fileName = strcat('ens_num_',int2str(100 + ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'uv','-ascii');
end