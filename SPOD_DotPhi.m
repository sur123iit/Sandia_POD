%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
r = 10;
%%
for r = 40:10:70
fileName = strcat('Phi_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_tr = load(completeName);

fileName = strcat('Phi_ens_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_ens = load(completeName);

dot_Phi = dot(Phi_tr,Phi_ens);
dot_Phi = abs(dot_Phi);

plot(1:100,dot_Phi(1:100));
hold on

clearvars Phi_tr Phi_ens;
end

%%
xlim([1 50]);
pbaspect([1 1 1])
legend('40','50','60','70');
