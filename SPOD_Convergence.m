%%
clear all;
%% Loading flow parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Loading Data for Spectral POD based on runs
%Define the type of convergence
for r = 10:10:280
folderName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach',num2str(Mach),'\');
for ens_num = r-9:r
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    qj_bar = fft(uv');
    clear uv;
    qj_bar_t = qj_bar';
    clearvars qj_bar;
    qj_bar_ens(:,:,ens_num) = qj_bar_t(:,1:N/2);
    clearvars qj_bar_t;
end
%% Apply POD in Spectral Domain
for f = 1:N/2
qj_bar_inst(:,:) = qj_bar_ens(:,f,:);
qj_mat = qj_bar_inst'*qj_bar_inst;
[eigvec,eigval] = svd(qj_mat);
eigen_val(:,f) = diag(eigval);
POD_spect_inst = qj_bar_inst*eigvec*1/sqrt(eigval);
clearvars eigvec eigval;
Phi(:,:,f) = POD_spect_inst;
clearvars POD_spect_inst;
clearvars qj_mat qj_bar_inst;
end
%% Save data
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = strcat('eigval_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'eigen_val','-ascii');
fileName = strcat('Phi_',int2str(r),'.mat');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-v7.3');
%%
clearvars eigen_val POD_spect_coeff Phi
end