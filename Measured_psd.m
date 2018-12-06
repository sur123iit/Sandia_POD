%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
psd_fin = zeros(193,6360);
%%
tic
for ens_num = 221:280
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_m = mean(uv,2);
    uv_rec = uv - uv_m;
    [N1,N2] = size(uv_rec);
    uv_f = fft(uv_rec'); %NxM
    psd_uv = conj(uv_f).*uv_f; %NxM
    psd_uv = 2*psd_uv; %NxM
    psd_uv = psd_uv/(N2*Fs); %N
    osd_uv(:,:) = psd_uv(1:193,:); %193xM
    psd_fin = psd_fin + osd_uv;
end
toc;
%%
psd_fin = psd_fin/280;
%%
save('Y:\rawdata\Sandia_cavity\Spectral velocity data\Reconstruction_PSD\psd_avg.mat','psd_fin');