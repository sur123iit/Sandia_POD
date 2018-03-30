%% This program is for Convergence
clear all;
%% Spac
vel_fluc_ens = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\ensemble_POD\Mach0.8\vel_fluc.txt');
Ns1 = 230;
vel_fluc1 = vel_fluc_ens(:,1:Ns1);
vel_mean1 = mean(vel_fluc1,2);
vel_fluc1 = vel_fluc1 - vel_mean1;
[eigvec1,eigval1,PODcoeff1,Phi1] = POD_Snapshot(vel_fluc1);
%% Contour Plot
vel_fluc_tr = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\ensemble_POD\Mach0.8\vel_fluc.txt');
Ns2 = 3860;
vel_fluc2 = vel_fluc(:,1:Ns2);
vel_mean2 = mean(vel_fluc2,2);
vel_fluc2 = vel_fluc2 - vel_mean2;
[eigvec2,eigval2,PODcoeff2,Phi2] = POD_Snapshot(vel_fluc2);
%% Contour Plot
Phi_dot = dot(Phi1(:,1:200),Phi2(:,1:200));
plot(1:100,abs(Phi_dot(1:100)));
ylim([0 1])
%%