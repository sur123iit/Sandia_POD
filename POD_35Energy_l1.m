%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%% Frequency POD
%%
load('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi2_280.mat');
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = eig1(:,1:193);
eig2(:,1) = zeros(280,1);
sum_eig4 = sum(sum(eig2));
eig2 = eig2/sum_eig4;
%%
%Select L

m_lim = 1; % change this
eig3(:,1) = eig2(m_lim,1:193);
f_index = 1:193';
m_index = m_lim*ones(193,1);
eig4(:,1) = eig3;

%%
for ens_num = 1:Nb
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
m_lim = 1;
for m = 1:m_lim
    Phi1(:,:) = Phi2(:,m,:); %6360
    a_n1 = (uv_bar1*Phi1); %193 x 193
    a_n(:,m) = diag(a_n1);
    %clearvars Phi1 a_n1;
end
%a_n2 = zeros(193,5);
%for ii = 1:37
 %   a_n2(f_index(ii),m_index(ii)) = a_n(f_index(ii),m_index(ii));
%end
a_n2 = a_n;
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

uv_rec2 = conj(flip(uv_rec,2));
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\35percentEnergy_1\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
end