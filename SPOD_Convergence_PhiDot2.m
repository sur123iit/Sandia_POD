%% 
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
%for r = 50:50:200
    r = 200;
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
    fileName = strcat(int2str(r),'.mat');
    completeName = strcat(folderName,fileName);
    load(completeName);
    Phi1 = cat(3,Phi(:,:,6:8),Phi(:,:,14:16),Phi(:,:,24:26),Phi(:,:,33:35));
    clearvars Phi;
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
    fileName = strcat(int2str(r+10),'.mat');
    completeName = strcat(folderName,fileName);
    load(completeName);
    Phi2 = cat(3,Phi(:,:,6:8),Phi(:,:,14:16),Phi(:,:,24:26),Phi(:,:,33:35));
    clearvars Phi;
    for ii = 1:12
        Dot_phi(:,ii) = dot(Phi1(:,1:r,ii),Phi2(:,1:r,ii));
    end
    Phi_dot = abs(Dot_phi);
    plot(1:r,Phi_dot(:,6),1:r,Phi_dot(:,9),1:r,Phi_dot(:,1))
    xlim([1 20]), ylim([0 1])
    folderName = 'Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach0.8\';
    fileName = strcat('Phi_dot_',int2str(r),'_',int2str(r+50),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi_dot','-ascii');
    clearvars Phi1 Phi2 Phi_dot Dot_phi;
end
%%
legend('1','2','3');