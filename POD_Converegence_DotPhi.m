%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach',num2str(Mach),'\');
%%
for r = 4500:500:5500
    fileName = strcat('Phi_trN_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    Phi1 = load(completeName);
    
    fileName = strcat('Phi_trN_',int2str(r+500),'.txt');
    completeName = strcat(folderName,fileName);
    Phi2 = load(completeName);
    
    dot_Phi = dot(Phi1,Phi2);
    dot_Phi = abs(dot_Phi);
    
    if r == 4500
        plot(1:100,dot_Phi(1:100));
    elseif r == 5000
        plot(1:100,dot_Phi(1:100));
    else
        plot(1:100,dot_Phi(1:100));
    end
    hold on;
end
xlim([1 100])
ylim([0 1])
legend('4500','5000','5500')
%%

r = 6000;
fileName = strcat('Phi_ensN_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
Phi_ens = load(completeName);
