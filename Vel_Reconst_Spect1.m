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
for r = 52:53
clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);s
for m = 1:25
    Phi1(:,:) = Phi(:,m,:);
    a_n(:,:,m) = (uv_bar1*Phi1);
    clearvars Phi1;
end
uv_rec = zeros(6360,N/2);
for m = 1:25
    Phi1(:,:) = Phi(:,m,:);
    a_n1(:,:) = a_n(:,:,m);
    uv_rec = uv_rec + (Phi1*a_n1);
end
uv_rec2 = flip(uv_rec,2);
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
end
%%