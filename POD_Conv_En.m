%% Viz_SPOD_Convergence_Energy
%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\');
fileName = 'eigval_tr_70.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\');
fileName = 'eigval_trN_6000.txt';
completeName = strcat(folderName,fileName);
eig2 = load(completeName);
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\');
fileName = 'eigval_ensN_6000.txt';
completeName = strcat(folderName,fileName);
eig3 = load(completeName);
plot(1:100,eig1(1:100),'o-',1:100,eig3(1:100),'s-',1:100,eig2(1:100),'^-');
legend('70 runs','ens','tr');
xlim([1 25])
%% Convergence Plots
eigval1 = en_convergence(eig1);
eigval2 = en_convergence(eig2);
eigval3 = en_convergence(eig3);
plot(1:200,eigval1,'o-',1:200,eigval3,'s-')%,1:200,eigval2,'^-');
xlim([1 25]), ylim([0 1])
pbaspect([1 1 1])
%%
