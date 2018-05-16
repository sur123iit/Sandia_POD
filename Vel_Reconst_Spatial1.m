%% Velocity Reconstructions
clear all;
%%
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'Phi_ens_280.txt';
completeName = strcat(folderName,fileName);
Phi = load(completeName);
%%
for r = 1:280  
clearvars -except Phi r
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
uv_rec = zeros(6360,N);
for m = 1:m_lim
    Phi1(:,1) = Phi(:,m);
    a_n2 = a_n(:,m);
    a_n3 = a_n2';
    uv_rec = uv_rec + (Phi1*a_n3);
    clearvars Phi1 a_n1 a_n2 a_n3;
end
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\35PercentEnergy_3\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv_rec','-ascii');
end
%%