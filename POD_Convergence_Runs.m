for r = 2000:500:6000
    v_fluc = vel_fluc(:,1:r);
    vel_mean = mean(v_fluc,2);
    v_fluc = v_fluc - repmat(vel_mean,1,r);
    [eigvec_tr, eigval_tr, PODcoeff_tr, Phi_tr] = POD_Snapshot(v_fluc);
    clearvars v_fluc vel_mean;
    Phi = Phi_tr(:,1:200);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('Phi_trN_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    Phi = eigval_tr(1:200)/sum(eigval_tr);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('eigval_trN_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    Phi = eigvec_tr(1:200,1:200);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('eigvec_trN_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    Phi = PODcoeff_tr(1:200,1:200);
    folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
    fileName = strcat('PODcoeff_trN_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi','-ascii');
    clearvars Phi
    clearvars eigval_tr eigval_tr eigvec_tr eigvec_tr PODcoeff_tr PODcoeff_tr Phi_tr Phi_tr v_fluc vel_mena
end