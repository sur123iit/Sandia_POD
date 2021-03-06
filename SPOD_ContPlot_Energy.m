%% Plot convergence based on energy
%% 
clear all;
%% Loading parameters
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
m_ind = m_index(1:50);
f_ind = f_index(1:50);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'Phi_280.mat';
completeName = strcat(folderName,fileName);
load(completeName);
%%
for ii = 1:50
    Phi_en(:,ii) = Phi(:,m_ind(ii),f_ind(ii));
end
%%
fileName = 'Phi_DecrEn.mat';
completeName = strcat(folderName,fileName);
save(completeName,'Phi_en');
%%

