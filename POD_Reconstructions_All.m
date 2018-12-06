%% grid matrix : eig4 is the final
%remains the same
clear all;
%%
%% Reconstruct velocity
load('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi2_280.mat');

%%
%%
%clearvars -except Phi2
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = eig1(:,1:193);
eig2(:,1) = zeros(280,1);
sum_eig4 = sum(sum(eig2));
eig2 = eig2/sum_eig4;
%%
m_lim = 1; % change this
eig3(:,1) = eig2(m_lim,1:193);
f_index = (1:193)';
m_index = m_lim;
eig4(:,1) = eig3;

%Rossiter frequencies

m_index = 1:5;
f_index = 6:9;

%
m_lim = 1:5;
f_lim = 24:27; 
% change this
[a1 a2] = size(m_lim);
[a3 a4] = size(f_lim);
f_index_t = repmat(f_lim,a2,1);
m_index_t = (repmat(m_lim,a4,1))';
f_index = reshape(f_index_t,[a2*a4, 1]);
m_index = reshape(m_index_t,[a2*a4, 1]);
eig_2 = eig2(m_lim,f_lim);
eig4 = reshape(eig_2,[a2*a4, 1]);

%First 50 modes

eig3 = reshape(eig2,[280*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig5(1:50,1);
m_index = m_index(1:50,1);
f_index = f_index(1:50,1);
%First 50 modes with reduced frequency
eig2(:,2) = zeros(280,1);
eig2(:,3) = zeros(280,1);
eig2(:,4) = zeros(280,1);
eig3 = reshape(eig2,[280*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig5(1:50,1);
m_index = m_index(1:50,1);
f_index = f_index(1:50,1);

%First 37 modes

eig3 = reshape(eig2,[280*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig5(1:37,1);
m_index = m_index(1:37,1);
f_index = f_index(1:37,1);

%First 30 modes

eig3 = reshape(eig2,[280*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig5(1:30,1);
m_index = m_index(1:30,1);
f_index = f_index(1:30,1);
%clearvars eig1 eig2 eig3;
en_frac = sum(eig4)/sum(sum(eig2));
%
%%
ens_num = 6;
%clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uvv = mean(uv,2);
uv = uv - uvv;
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
m_lim = 5;
for m = 1:m_lim
    Phi1(:,:) = Phi2(:,m,:);
    a_n1 = (uv_bar1*Phi1); %193 x 193
    a_n(:,m) = diag(a_n1);
    %clearvars Phi1 a_n1;
end
[m1, m2] = size(m_index);
[f1, f2] = size(f_index);
uv_rec = zeros(6360,N/2);
a_n2 = a_n(f_index,m_index);
for ii = 1:m2
    Phi1(:,:) = Phi2(:,m_index(ii),:);
    a_n2 = zeros(193,1);
    a_n2(f_index,1) = a_n(f_index,m);
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
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,ens_num);
UV = uv2 + uvm1;
%% POD Decreasing energy order 
ens_num = 6;
%clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uvv = mean(uv,2);
uv = uv - uvv;
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
m_lim = 5;
for m = 1:m_lim
    Phi1(:,:) = Phi2(:,m,:);
    a_n1 = (uv_bar1*Phi1); %193 x 193
    a_n(:,m) = diag(a_n1);
    %clearvars Phi1 a_n1;
end
a_n2 = zeros(193,5);
a_n2(f_index,m_index) = a_n(f_index,m_index);
uv_rec = zeros(6360,N/2);
clear a_n1;
for ii = 1:m_lim
    Phi1(:,:) = Phi2(:,ii,:);
    a_n4 = a_n2(:,ii);
    a_n3 = a_n4';
    a_n1 = repmat(a_n3,6360,1);
    uv_rec = uv_rec + (Phi1.*a_n1);
    clearvars Phi1 a_n1 a_n4 a_n3;
end

uv_rec2 = flip(uv_rec,2);
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,ens_num);
UV = uv2 + uvm1;

%%
%%
[m1, m2] = size(m_index);
[f1, f2] = size(f_index);
%
[~,m_lim] = size(eig5);


uv_rec = zeros(6360,N/2);
for m = 1:m_lim
    Phi1(:,:) = Phi2(:,m,:);
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
%%
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,ens_num);
UV = uv2 + uvm1;
%% Reconstruct measured velocity with bandpass filtering
ens_num = 6;
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_m  = mean(uv,2);
uv = uv - uv_m;
uv_f = fft(uv');
uv_f1 = zeros(386,6360);
uv_f1(24:27,:) = uv_f(24:27,:);
uv_f1(N-24+2-3:N-24+2,:) = uv_f(N-24+2-3:N-24+2,:);
uv_t = ifft(uv_f1,'symmetric');
uv2 = uv_t';
%%