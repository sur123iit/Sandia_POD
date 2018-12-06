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
%for r = 1:280  
r = 6;
clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
m_lim = 1;
for m = 1:m_lim
    Phi1(:,:) = Phi(:,m,:);
    a_n1 = (uv_bar1*Phi1); %193 x 193
    a_n(:,m) = diag(a_n1);
    %clearvars Phi1 a_n1;
end
uv_rec = zeros(6360,N/2);
for m = 1:m_lim
    Phi1(:,:) = Phi(:,m,:);
    a_n2 = a_n(:,m);
    a_n3 = a_n2';
    a_n1 = repmat(a_n3,6360,1);
    uv_rec = uv_rec + (Phi1.*a_n1);
    clearvars Phi1 a_n1 a_n2 a_n3;
end
uv_rec2 = flip(uv_rec,2);
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
end
%%
 
r = 6;
%clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
m_lim = 4;
for m = 1:m_lim
    Phi1(:,:) = Phi(:,m,:);
    a_n1 = (uv_bar1*Phi1); %193 x 193
    a_n(:,m) = diag(a_n1);
    clearvars Phi1 a_n1;
end
uv_rec = zeros(6360,N/2);
for m = 1:m_lim
    Phi1(:,:) = Phi(:,m,:);
    a_n2 = a_n(:,m);
    a_n3 = a_n2';
    a_n1 = repmat(a_n3,6360,1);
    uv_rec = uv_rec + (Phi1.*a_n1);
    clearvars Phi1 a_n1 a_n2 a_n3;
end
uv_rec(:,41:193)=zeros(6360,153);
uv_rec2 = flip(uv_rec,2);
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');

%%
r = 6;
%clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
m_lim = 1;
for m = 1:m_lim
    Phi1(:,:) = Phi(:,m,:);
    a_n1 = (uv_bar1*Phi1); %193 x 193
    a_n(:,m) = diag(a_n1);
    clearvars Phi1 a_n1;
end
uv_rec = zeros(6360,N/2);
for fm_index = 1:50
    Phi1(:,:) = Phi(:,m_index(fm_index),f_index(fm_index));
    a_n2 = a_n(f_index(fm_index),m_index(fm_index));
    a_n3 = a_n2';
    a_n1 = repmat(a_n3,6360,1);
    uv_rec = uv_rec + (Phi1.*a_n1);
    clearvars Phi1 a_n1 a_n2 a_n3;
end
uv_rec(:,41:193)=zeros(6360,153);
uv_rec2 = flip(uv_rec,2);
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
%%
r = 6;
%clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
m_lim = 1;
%for m = 1:m_lim
for f_index = 1:193
    Phi1(:,:) = Phi(:,m_lim,:);
    a_n1 = uv_bar1(f_index,:)*Phi1(:,f_index); %193 x 193
    a_n(:,m_lim) = a_n1;
    clearvars Phi1 a_n1;
end
uv_rec = zeros(6360,N/2);
for f_index = 1:193
    Phi1(:,:) = Phi(:,1,f_index);
    a_n2 = a_n(f_index(fm_index),m_index(f_omdex);
    a_n3 = a_n2';
    a_n1 = repmat(a_n3,6360,1);
    uv_rec = uv_rec + (Phi1.*a_n1);
    clearvars Phi1 a_n1 a_n2 a_n3;
end
uv_rec(:,41:193)=zeros(6360,153);
uv_rec2 = flip(uv_rec,2);
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';

