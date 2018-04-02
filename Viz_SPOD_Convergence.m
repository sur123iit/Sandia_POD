%% Program to observe the Spectral POD Convergence 
clear all
%% Convergence with frequency
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
for r = 50:10:90
fileName = strcat('eigval_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
e1 = sum(eig1,1);
e1 = e1/sum(e1);
plot(1:193,e1);
hold on;
end
%% Convergence with modes
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
for r = 50:10:90
fileName = strcat('eigval_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
e1 = sum(eig1,2);
e1 = e1/sum(e1);
plot(1:10,e1(1:10));
hold on;
end
%%
