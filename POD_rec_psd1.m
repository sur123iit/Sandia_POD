%%
psd_fin = zeros(6360,193);
%%
tic
for ens_num = 201:280
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

psd_uv = conj(uv_rec).*uv_rec;
psd_uv = 2*psd_uv;
psd_uv = psd_uv/(386*37500);
psd_fin = psd_fin + psd_uv;
end
toc
%%
psd_fin = psd_fin/280;
psd_fin = psd_fin';
save('Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\Reconstruction_PSD\Percent35\psd_avg.mat','psd_fin');
