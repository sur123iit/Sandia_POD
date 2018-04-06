%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach0.8\';
for r = 150:50:200
r = 200;
fileName = strcat('PhiDot_DecrEn_',int2str(r),'_',int2str(r+50),'.txt');
completeName = strcat(folderName,fileName);
Phi_dot = load(completeName);
plot(1:500,Phi_dot);
hold on;
clearvars Phi_dot
end
xlim([1 200]), ylim([0 1]);