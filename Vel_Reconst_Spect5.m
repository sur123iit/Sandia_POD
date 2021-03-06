%% Velocity Reconstructions
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'Phi_280.mat';
completeName = strcat(folderName,fileName);
load(completeName);
%%
for r = 1:280  
clearvars -except Phi r a_n
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
m_lim = 3;
for m = 1:m_lim
    Phi1(:,:) = Phi(:,m,:);
    a_n1 = (uv_bar1*Phi1);
    a_n(:,m,r) = diag(a_n1);
    clearvars Phi1 a_n1;
end
end
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\';
fileName = 'a_n.mat';
completeName = strcat(folderName,fileName);
save(completeName,'a_n');
%%