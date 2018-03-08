%% SOVING THE SPECTRAL POD EQUATION CLASSICALLY
clear all;
%% Loading flow parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Load and save data

for ens_num = 1:10
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');

end
%% Save data


