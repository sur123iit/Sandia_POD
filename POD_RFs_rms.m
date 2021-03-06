%%
%This program plots RMS velocities for POD modes picked for rossiter
%frequencies
%%
clear all;
%% Load parameters for use
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);

%% loading singular vectors
load('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi2_280.mat');
%% loading singular values
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = eig1(:,1:193);
eig2(:,1) = zeros(280,1);
sum_eig4 = sum(sum(eig2));
eig2 = eig2/sum_eig4;
%% Reconstructing for RF3
%Rossiter frequencies

m_lim = 3;
%6:9 for RF1 1st mode captures 33 % of the energy 1:4 or 1:5 captures about
%60% of the energy
%15:17 or 15:18 for RF3 1st mode captures 60% of the energy
%24:27 for RF3 for 1:5 captures about 60% of the energy and 1 captures 35%
%energy
f_lim = 16; % change this
[a1 a2] = size(m_lim);
[a3 a4] = size(f_lim);
f_index_t = repmat(f_lim,a2,1);
m_index_t = (repmat(m_lim,a4,1))';
f_index = reshape(f_index_t,[a2*a4, 1]);
m_index = reshape(m_index_t,[a2*a4, 1]);
eig_2 = eig2(m_lim,f_lim);
eig4 = reshape(eig_2,[a2*a4, 1]);

%% POD Reconstruction
for ens_num = 6:6
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
m_lim = 3;
for m = 1:m_lim
    Phi1(:,:) = Phi2(:,m,:);
    a_n1 = (uv_bar1*Phi1); %193 x 193
    a_n(:,m) = diag(a_n1);
    %clearvars Phi1 a_n1;
end
a_n2 = zeros(193,1);
for ii = 1:size(f_index)
    a_n2(f_index(ii),m_index(ii)) = a_n(f_index(ii),m_index(ii));
end
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
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\RossiterModes\RossiterMode2\';
fileName = strcat('uv_rec3_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
end
%% Get the variance
%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var = zeros(6360,Nb);
for ens_num = 1:Nb
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\RossiterModes\RossiterMode1\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName, fileName);
uv = load(completeName);
uv_var1 = var(uv,1,2);
uv_var(:,ens_num) = uv_var1;
end
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uv_var','-ascii');
%% Get Rms from Variance
clear all;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\DecreasingEnergy\35Energy_37modes\';
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
uv_var = load(completeName);
uv_var1 = uv_var*N;
uv_rms1 = sum(uv_var1,2);
uv_rms1 = uv_rms1/(N*Nb);
uv_rms = sqrt(uv_rms1);
%%
%% Eigen Vector
[x1,y1,Uphi,Vphi] = cont_plot_uv(uv_rms);
%change this line only to toggle between Uphi and Vphi
Phi_viz = Uphi;
l1 = abs(max(max(Phi_viz))); %Vphi or Uphi
l2 = abs(min(min(Phi_viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
% depending on location
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
h = colorbar;
set(h,'LineWidth',2);
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
colormap(jet(256))
axis equal
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off





