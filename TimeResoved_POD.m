%% APPLICATION OF POD TO DATA AT A SPACING OF 17 SNAPSHOTS
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Data collection
for ens_num = 1:r
    %data pair extraction
    folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    x = uv(:,1:N);
    en_array((ens_num-1)*r + 1: ens_num*r,1) = abs(new_eigval);
    num_array_pdf ((ens_num-1)*r + 1: ens_num*r,1) = discretize(dmd_freq,edges);
    clearvars uv x y new_dmd_modes dmd_freq
end

%%
