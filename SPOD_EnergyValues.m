%% 
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
r = 280;
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = reshape(eig1,[280*193 ,1]);
[eig3,index_eig] = sort(eig2,'desc');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig3/sum(eig3);
eig5 = en_convergence(eig4);
plot(1:1000,eig5(1:1000));
%%
for ii = 1:750
    eig_index(ii,1) = eig1(m_index(ii,1),f_index(ii,1));
end
plot(eig1(m_index(
plot(1:9,eig_view,'*');
%%
for r = 50:50:150
fileName = strcat('eigval_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
eig = load(completeName);
eig_m(:,r/50) = eig(m,:)/sum(eig(m,:));
end