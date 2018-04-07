%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(2);
%%
r = 10;
%%
folderName = strcat('Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach',num2str(Mach),'\');
for ens_num =  1:r
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv_tr = load(completeName);
    if ens_num == 1
        vel_fluc = uv_tr;
    else
        vel_fluc = horzcat(vel_fluc,uv_tr);
    end
    clearvars uv_tr;
end
%%
v_fluc = vel_fluc;
vel_mean = mean(v_fluc,2);
v_fluc = v_fluc - repmat(vel_mean,1,386*r);
[eigvec_tr, eigval_tr, PODcoeff_tr, Phi_tr] = POD_Snapshot(v_fluc);
clearvars v_fluc vel_mean;
%%
uv = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\ensemble_POD\Mach0.8\vel_fluc.txt');
%%
r = 100;
v_fluc = uv(:,1:23*r);
vel_mean = mean(v_fluc,2);
v_fluc = v_fluc - repmat(vel_mean,1,23*r);
[eigvec_ens, eigval_ens, PODcoeff_ens, Phi_ens] = POD_Snapshot(v_fluc);
clearvars v_fluc vel_mean;
%% 
Phi_dot = dot(Phi_tr(:,1:200),Phi_ens(:,1:200));
plot(1:40, abs(Phi_dot(1:40)));
plot(1:40,eigval_tr(1:40)/sum(eigval_tr),1:40,eigval_ens(1:40)/sum(eigval_ens));
%% Save Phi
Phi = Phi_ens(:,1:200);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('Phi_ens_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi

%% Save Eigval
Phi = eigval_ens(1:200)/sum(eigval_ens);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('eigval_ens_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi

%% Save Eigvec
Phi = eigvec_ens(1:200,1:200);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('eigvec_ens_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi

%% Save PODcoeff
Phi = PODcoeff_ens(1:200,1:200);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('PODcoeff_ens_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi
clearvars eigval_ens eigval_tr eigvec_ens eigvec_tr PODcoeff_ens PODcoeff_tr Phi_ens Phi_tr v_fluc vel_mena
%%
Phi = Phi_tr(:,1:200);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('Phi_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi;
%%
Phi = eigval_tr(1:200)/sum(eigval_tr);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('eigval_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi;
%%
Phi = eigvec_tr(1:200,1:200);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('eigvec_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi;
%%
Phi = PODcoeff_tr(1:200,1:200);
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = strcat('PODcoeff_tr_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'Phi','-ascii');
clearvars Phi;
%%




