for r = 2000:500:6000
    v_fluc = uv(:,1:r);
    vel_mean = mean(v_fluc,2);
    v_fluc = v_fluc - repmat(vel_mean,1,r);
    [eigvec_ens, eigval_ens, PODcoeff_ens, Phi_ens] = POD_Snapshot(v_fluc);
    clearvars v_fluc vel_mean;
    Phi = Phi_ens(:,1:200);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('Phi_N_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    Phi = eigval_ens(1:200)/sum(eigval_ens);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('eigval_N_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    Phi = eigvec_ens(1:200,1:200);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('eigvec_N_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    Phi = PODcoeff_ens(1:200,1:200);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('PODcoeff_N_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    clearvars eigval_ens eigval_tr eigvec_ens eigvec_tr PODcoeff_ens PODcoeff_tr Phi_ens Phi_tr v_fluc vel_mena
end

%%