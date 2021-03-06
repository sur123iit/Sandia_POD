%% 
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
for r = 50:50:200
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
    fileName = strcat(int2str(r),'.mat');
    completeName = strcat(folderName,fileName);
    load(completeName);
    Phi1(:,:) = Phi(:,1,:);
    Phi2(:,:) = Phi(:,2,:);
    Phi3(:,:) = Phi(:,3,:);
    clearvars Phi;
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_';
    fileName = strcat(int2str(r+50),'.mat');
    completeName = strcat(folderName,fileName);
    load(completeName);
    Phi11(:,:) = Phi(:,1,:);
    Phi21(:,:) = Phi(:,2,:);
    Phi31(:,:) = Phi(:,3,:);
    clearvars Phi;
    Phi_dot1 = dot(Phi1,Phi11);
    Phi_dot2 = dot(Phi2,Phi21);
    Phi_dot3 = dot(Phi3,Phi31);
    Dot1 = abs(Phi_dot1);
    Dot2 = abs(Phi_dot2);
    Dot3 = abs(Phi_dot3);
    Dot1 = Dot1';
    Dot2 = Dot2';
    Dot3 = Dot3';
    Phi_dot = horzcat(Dot1,Dot2,Dot3);
    folderName = 'Y:\rawdata\Sandia_cavity\SPODConvergencePlots\Mach0.8\';
    fileName = strcat('Phi_dot_Mode123_',int2str(r),'_',int2str(r+50),'.txt');
    completeName = strcat(folderName,fileName);
    save(completeName,'Phi_dot','-ascii');
    clearvars Phi1 Phi2 Phi3 Phi11 Phi21 Phi31 Phi_dot Phi_dot1 Phi_dot2 Phi_dot3 Dot1 Dot2 Dot3
end
%%
legend('1','2','3');

