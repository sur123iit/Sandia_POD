%% 
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(2);
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach\',num2str(Mach),'\');
for ens_num = 10:10:Nb
    
    fileName = strcat('ens_num_',int2str(ens_num),'.txt')
end