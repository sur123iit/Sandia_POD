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
%%
for r = 100:50:200
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
    fileName = strcat(int2str(r),'.mat');
    completeName = strcat(folderName,fileName);
    load(completeName);
    for ii = 1:500
        Phi1(:,ii) = Phi(:,m_index(ii,1),f_index(ii,1));
    end
    clearvars Phi;
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
    fileName = strcat(int2str(r+50),'.mat');
    completeName = strcat(folderName,fileName);
    load(completeName);
    for ii = 1:500
        Phi2(:,ii) = Phi(:,m_index(ii,1),f_index(ii,1));
    end
    clearvars Phi;
    Phi_dot = dot(Phi1,Phi2);
    Dot_Phi = abs(Phi_dot);
    Dot_Phi = Dot_Phi';
    folderName = 'Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach0.8\';
    fileName = strcat('PhiDot_DecrEn_',int2str(r),'_',int2str(r+50),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Dot_Phi','-ascii');
    clearvars Phi1 Phi2 Phi_dot Dot_Phi;
end