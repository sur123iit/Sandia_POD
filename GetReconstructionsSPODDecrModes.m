% Understanding IFFT
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = eig1(:,1:193);
eig2(:,1) = zeros(280,1);
%eig2(:,2) = zeros(280,1);
%eig2(:,3) = zeros(280,1);
%eig2(:,4) = zeros(280,1);
eig3 = reshape(eig2,[280*193 ,1]);
[eig4,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
%clearvars eig1 eig2 eig3;
%37 with 35 % energy
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'Phi_280.mat';
completeName = strcat(folderName,fileName);
load(completeName);
%%

%% Calculating Phi iteratively exactly at f etc
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
ens_num = 6;
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uvm = mean(uv,2);
uv = uv - uvm;
uv_bar = fft(uv');
%% Reconstruction with just ordering
uv_bar1(:,:) = uv_bar(1:193,:);
uv_rec_bar = zeros(6360,193);
for ii = 1:50
    a_temp = uv_bar1(f_index(ii,1),:)*Phi(:,m_index(ii,1),f_index(ii,1));
    uv_rec_bar(:,f_index(ii,1)) = uv_rec_bar(:,f_index(ii,1)) + (a_temp*Phi(:,m_index(ii,1),f_index(ii,1)));
    clearvars a_temp;
end
uv_rec2 = conj(flip(uv_rec_bar,2));
uv_t_bar = horzcat(uv_rec_bar,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
%% Reconstruction with ordering but with frequency
uv_bar1(:,:) = uv_bar(1:193,:);
uv_rec_bar = zeros(6360,193);
m_index1 = 1;
for f_index1 = 2:193
    a_temp = uv_bar1(f_index1,:)*Phi(:,m_index1,f_index1);
    uv_rec_bar(:,f_index1) = uv_rec_bar(:,f_index1) + (a_temp*Phi(:,m_index1,f_index1));
    clearvars a_temp;
end

uv_rec2 = flip(uv_rec_bar,2);
uv_t_bar = horzcat(uv_rec_bar,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
%%
uv_bar1(:,:) = uv_bar(1:193,:);
uv_rec_bar =zeros(6360,193);
m_index1 = 2;
    for f_index1 = 2:193
    a_temp = uv_bar1(f_index1,:)*Phi(:,m_index1,f_index1);
    uv_rec_bar(:,f_index1)= uv_rec_bar (:,f_index1)+ (a_temp*Phi(:,m_index1,f_index1));
    clearvars a_temp;
    end
uv_rec2 = conj(flip(uv_rec_bar,2));
uv_t_bar = horzcat(uv_rec_bar,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
fileName = strcat('uv_mode2_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');

%%
uv_rec_tr = conj(flip(uv_rec_bar,2));
%uv_dc = uv10^-8*(0.0001+0.0001i)*ones(6360,1);
%uv_rec = horzcat(uv_rec_bar,uv_rec_tr(:,193),uv_rec_tr(:,1:192),);
uv_t = ifft(uv_rec','symmetric');
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