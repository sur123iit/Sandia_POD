%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%
a_n_f = zeros(193,200);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
Phi = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt');
for ens_num = 1:Nb
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_m = mean(uv,2);
    uv = uv - uv_m;
    a_n1 = (uv'*Phi);
    a_nf = fft(a_n1);
    a_nf1 = a_nf(1:193,:);
    a_n_f = a_n_f + a_nf1;
end
%%
a_n_f = a_n_f/280;
completeName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\eigval_lf_N5000.mat';
save(completeName,'a_n_f');


