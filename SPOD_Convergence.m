%%
clear all;
%% Loading flow parameters
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%% Loading Data for Spectral POD based on runs
%Define the type of convergence
R = 50;
folderName = '';
for ens_num = 1:R
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    
end
