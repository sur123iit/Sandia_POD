%% This program calculates Reconstructions based on Frequency dependent POD mode wise
clear all;
m_lim = 9;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = strcat('eigval_280.txt');
completeName = strcat(folderName, fileName);
eiglf = load(completeName);
eiglf(:,1) = zeros(280,1);
[eigdec, m_index, f_index] = DecEn_eigval(eiglf);
% Phi
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'Phi2_280.mat';
completeName = strcat(folderName,fileName);
load(completeName);
%
Phi1 = Phi2(:,m_index(m_lim),f_index(m_lim));
for ens_num = 1:Nb
    uv = load('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_1.txt');
    uv_f = fft(uv');
    a_f = Phi1'*uv_f.';
    uv2 = Phi1*a_f;
    uvt = ifft(uv2.','symmetric');
    uv1 = uvt';
    folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\Mode',int2str(m_lim),'\');
    fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'uv1','-ascii');
end
%% Get the variance
clear all;
%%
m_lim = 9;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var = zeros(6360,Nb);
for ens_num = 1:Nb
    uv = zeros(6360,386);
    for ii = 1:m_lim
        folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\Mode',int2str(ii),'\');
        fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
        completeName = strcat(folderName, fileName);
        uv1 = load(completeName);
        if ii == 1
            uv = uv1;
        else
            uv = uv + uv1;
        end
    end
uv_var1 = var(uv,1,2);
uv_var(:,ens_num) = uv_var1;
end
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\Mode',int2str(m_lim),'\');fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uv_var','-ascii');
%% Get the variance
%%
clear all;
%%
m_lim = 9;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var = zeros(6360,Nb);
for ens_num = 1:Nb
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\Mode',int2str(m_lim),'\');
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName, fileName);
uv = load(completeName);
uv_var1 = var(uv,1,2);
uv_var(:,ens_num) = uv_var1;
end
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\ModeWiseVariances\Mode',int2str(m_lim),'\');
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uv_var','-ascii');

