%% this code is to extract modes till 50% energy and the getting velocity reconstructions and power spectra etc
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = reshape(eig1,[280*193 ,1]);
[eig3,index_eig] = sort(eig2,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'Phi_280.mat';
completeName = strcat(folderName,fileName);
load(completeName);
%% cut off values for indices
eig4 = eig3/sum(eig3);
eig5 = en_cnvr_ary(eig4);
for ii = 1:600
    if eig5(ii,1)>0.5
        break;
    end
end
%At 118 we get 50% energy
eig5(117,1)
for ii = 1:1500
    if eig5(ii,1)>0.75
        break;
    end
end
%At 1407 we get 75% energy
%% Spectrum of 50% energy
plot(f_index(1:118,1),eig4(1:118,1),'*');
eig6 = zeros(193,1);
for ii = 1:193
    for jj = 1:118
        if f_index(jj,1) == ii
            eig6(ii,1) = eig6(ii,1) + eig4(jj,1);
        end
    end
end
plot_strouhal(eig6)
fileName = 'eigval_decrNvsfreq_50Percent.txt';
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
completeName = strcat(folderName,fileName);
save(completeName,'eig6','-ascii');
%% Spectrum of 75% energy
plot(f_index(1:118,1),eig4(1:118,1),'*');
eig6 = zeros(193,1);
for ii = 1:193
    for jj = 1:1407
        if f_index(jj,1) == ii
            eig6(ii,1) = eig6(ii,1) + eig4(jj,1);
        end
    end
end
plot_strouhal(eig6)
fileName = 'eigval_decrNvsfreq_75Percent.txt';
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
completeName = strcat(folderName,fileName);
save(completeName,'eig6','-ascii');
%% Calculating Phi iteratively exactly at f etc
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = 'ens_num_6.txt';
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
uv_rec_bar = zeros(6360,193);
for ii = 1:118
    a_temp = uv_bar1(f_index(ii),:)*Phi(:,m_index(ii),f_index(ii));
    uv_rec_bar(:,f_index(ii))= uv_rec_bar (:,f_index(ii))+ (a_temp*Phi(:,m_index(ii),f_index(ii)));
    clearvars a_temp;
end
uv_rec2 = flip(uv_rec_bar,2);
uv_t_bar = horzcat(uv_rec_bar,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
