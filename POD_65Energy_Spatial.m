%%
%This program plots RMS velocities for spatial POD for 35% energy
%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%Spatial POD
%%
%load('Y:\rawdata\Sandia_cavity\ConvergenceResults\eigval_lf_N5000.mat');
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\');
fileName = 'eigval_lf_N5000.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig1 = eig1';
eig2 = eig1(:,1:193);
eig2(:,1) = zeros(200,1);
sum_eig4 = sum(sum(eig2));
eig2 = eig2/sum_eig4;

%First 50 modes

eig3 = reshape(eig2,[200*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,200);
f_index = floor(index_eig/200) + 1;
eig4 = eig5(1:50,1);
m_index = m_index(1:50,1);
f_index = f_index(1:50,1);

%%
Phi2 = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt');
m_lim = 8;
for ens_num = 1:280
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
a_t = uv'*Phi2;
a_f = fft(a_t);
a_l_f = zeros(193,8);
for ii = 1:50
    a_l_f(f_index(ii),m_index(ii)) = a_f(f_index(ii),m_index(ii));
end
uv_rec1 = zeros(193,6360);
for m = 1:m_lim
    a_l_f1 = a_l_f(:,m); %193x1
    Phi1 = Phi2(:,m); %6360x1
    uv_rec1 = uv_rec1 + a_l_f1*Phi1'; % 
end
uv_rec = uv_rec1.';
uv_rec2 = conj(flip(uv_rec,2));
uv_t_bar = horzcat(uv_rec,uv_rec2(:,193),uv_rec2(:,1:192));
uvt_bar = uv_t_bar.';
uv_t = ifft(uvt_bar,'symmetric');
uv2 = uv_t';
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\DecreasingEnergy\35Energy_50modes\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv2','-ascii');
end





%% Get variance of these

%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var = zeros(6360,Nb);
for ens_num = 1:Nb
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\DecreasingEnergy\35Energy_50modes\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName, fileName);
uv = load(completeName);
uv_var1 = var(uv,1,2);
uv_var(:,ens_num) = uv_var1;
end
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uv_var','-ascii');
%%



