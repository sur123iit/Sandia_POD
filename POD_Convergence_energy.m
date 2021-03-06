%% This program plots energy convergence plots for the ensemble and continous cases
clear all;
%%
uv = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\tr_POD\Mach0.8\vel_fluc.txt');
%%
r = 2000;
v_fluc = uv(:,1:r);
[~, eigval, ~, ~] = POD_Snapshot(v_fluc);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('eigval_trN_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'eigval','-ascii');
%%
clearvars v_fluc eigval
%% ENSEMBLE
clear all;
%%
uv = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\ensemble_POD\Mach0.8\vel_fluc.txt');
%%
r = 1500;
v_fluc = uv(:,1:r);
[~, eigval, ~, ~] = POD_Snapshot(v_fluc);
eigval = eigval/sum(eigval);
eig1 = eigval(1:200);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('eigval_ensN_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'eig1','-ascii');
%%
clearvars v_fluc eigval eig1;