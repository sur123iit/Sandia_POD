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
%%

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
fileName = 'ens_num_4.txt';
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');
uv_bar1(:,:) = uv_bar(1:193,:);
p = [1+i 2-i];
uv_rec_bar = zeros(6360,193,'like',p);
for ii = 1:118
    a_temp = uv_bar1(f_index(ii),:)*Phi(:,m_index(ii),f_index(ii));
    uv_rec_bar(:,f_index(ii))= uv_rec_bar (:,f_index(ii))+ (a_temp*Phi(:,m_index(ii),f_index(ii)));
    clearvars a_temp;
end
uv_t = ifft(uv_rec_bar',386,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
%% Plot comparisons
eig11 = sum(eig1,1)/sum(sum(eig1));
eig11 = eig11';
eig12 = horzcat(eig11,eig6);
plot_strouhal(eig12)
eig13 = sum(eig1(1:3,:),1)/sum(sum(eig1));
eig13 = eig13';
eig12 = horzcat(eig11,eig6,eig13);
plot_strouhal(eig12);
xticks(0:0.25:0.5), yticks(0:0.04:0.08)
set(gca,'LineWidth',2,'FontSize',18,'FontWeight','Bold');
lgd = legend('Total','DecrEn','Presented');
lgd.FontSize = 12;
set(gcf,'Position',[0 0],[800 800]);
xlabel('St_D','FontSize',34),
ylabel('\eta','FontSize',34);
pbaspect([1 1 1]);
%% Plot these values
plot(f_index(1:118,1)*97.15*D/Uinf,eig4(1:118,1),'*')
pbaspect([1 1 1])
xticks(0:0.25:0.5)
xlim([0 0.5])
yticks(0:0.02:0.04)