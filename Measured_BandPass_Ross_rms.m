%%
%This program plots RMS velocities for POD modes picked for rossiter
%frequencies
%%
clear all;
%% Load parameters for use
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%
for ens_num = 1:Nb
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
uv_bar = fft(uv');
%6:9 for RF1 
%15:18 for RF2 
%24:27 for RF3
index_ross = 24:27;
uv_bar1 = zeros(size(uv_bar));
uv_bar1(index_ross,:) = uv_bar (index_ross,:);
uv_bar1(N+2 - index_ross,:) = uv_bar(N+2 - index_ross,:);
uv_t = ifft(uv_bar1,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\RossiterMode3\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
end
%% Calculate Variance
clear all;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var = zeros(6360,Nb);
for ens_num = 1:Nb
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\RossiterMode2\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName, fileName);
uv = load(completeName);
uv_var1 = var(uv,1,2);
uv_var(:,ens_num) = uv_var1;
end
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uv_var','-ascii');

