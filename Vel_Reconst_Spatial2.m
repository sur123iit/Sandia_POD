%% Velocity Reconstructions
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'Phi_ens_280.txt';
completeName = strcat(folderName,fileName);
Phi = load(completeName);
%%
for r = 1:Nb  
clearvars -except Phi r Nb
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
m_lim = 3;
for m = 1:m_lim
    Phi1(:,1) = Phi(:,m);
    a_n1 = (uv'*Phi1);
    a_n(:,m) = a_n1;
    clearvars Phi1 a_n1;
end
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\';
fileName = strcat('a_n',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'a_n','-ascii');
end
%%
