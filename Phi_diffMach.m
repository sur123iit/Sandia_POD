clear all;
Phi_spat1 = zeros(6360,193,3);
Phi_spat2 = zeros(6360,193,3);
%% Load Ma = 0.8 Phi
ens_num = 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi2_280.mat';
load(completeName1);
Phi_spat1(:,:,ens_num) = Phi2(:,1,:);
Phi_spat2(:,:,ens_num) = Phi2(:,2,:);
clear Phi2
%% Load Ma = 0.6 Phi
ens_num = ens_num + 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.6\Phi_260.mat';
load(completeName1);
Phi_spat1(:,:,ens_num) = Phi(:,1,:);
Phi_spat2(:,:,ens_num) = Phi(:,2,:);
clear Phi
%%
ens_num = ens_num + 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.94\Phi_240.mat';
load(completeName1);
Phi_spat1(:,:,ens_num) = Phi(:,1,:);
Phi_spat2(:,:,ens_num) = Phi(:,2,:);
clear Phi
%% save Phi mat
save('Y:\rawdata\Sandia_cavity\Phi_Mcomp11.mat','Phi_spat1','-v7.3');
save('Y:\rawdata\Sandia_cavity\Phi_Mcomp12.mat','Phi_spat2','-v7.3');
%% Dot product cross spat 1 Mach 0.8 Mach 0.6
Phi1 = Phi_spat1(:,:,2);
Phi2 = Phi_spat1(:,:,1);
Phi_m86 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a86 = angle(Phi1'*Phi2);
%% Dot product cross spat 1 Mach 0.94 Mach 0.8
Phi1 = Phi_spat1(:,:,1);
Phi2 = Phi_spat1(:,:,3);
Phi_m98 = abs(Phi1'*Phi2); % rows: 0.8 columns: 0.94
Phi_a98 = angle(Phi1'*Phi2);
%% Dot product cross spat 1 Mach 0.94 Mach 0.8
Phi1 = Phi_spat1(:,:,2);
Phi2 = Phi_spat1(:,:,3);
Phi_m96 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.94
Phi_a96 = angle(Phi1'*Phi2);
%% Dot product cross spat 2 Mach 0.8 Mach 0.6
%Phi1 =  Phi_spat2(
save('Y:\rawdata\Sandia_cavity\PhiCorr_spat1.mat','Phi_a86','Phi_a98','Phi_a96','Phi_m86','Phi_m98','Phi_m96');
%% Dot product cross spat 1 Mach 0.8 Mach 0.6
Phi1 = Phi_spat2(:,:,2);
Phi2 = Phi_spat2(:,:,1);
Phi_m86 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a86 = angle(Phi1'*Phi2);
%% Dot product cross spat 1 Mach 0.94 Mach 0.8
Phi1 = Phi_spat2(:,:,1);
Phi2 = Phi_spat2(:,:,3);
Phi_m98 = abs(Phi1'*Phi2); % rows: 0.8 columns: 0.94
Phi_a98 = angle(Phi1'*Phi2);
%% Dot product cross spat 1 Mach 0.94 Mach 0.8
Phi1 = Phi_spat2(:,:,2);
Phi2 = Phi_spat2(:,:,3);
Phi_m96 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.94
Phi_a96 = angle(Phi1'*Phi2);
%% Dot product cross spat 2 Mach 0.8 Mach 0.6
%Phi1 =  Phi_spat2(
save('Y:\rawdata\Sandia_cavity\PhiCorr_spat2.mat','Phi_a86','Phi_a98','Phi_a96','Phi_m86','Phi_m98','Phi_m96');
%% Phi l for different Rossiter modes
clear all;
Phi_RM1 = zeros(6360,50,3);
Phi_RM2 = zeros(6360,50,3);
Phi_RM3 = zeros(6360,50,3);
%% Load Phi l for all RMs of Mach 0.8
ens_num = 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_280.mat';
load(completeName1);
Phi_RM1(:,:,ens_num) = Phi(:,1:50,7);
Phi_RM2(:,:,ens_num) = Phi(:,1:50,16);
Phi_RM3(:,:,ens_num) = Phi(:,1:50,25);
clear Phi
%% Mach = 0.6
ens_num = ens_num + 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.6\Phi_260.mat';
load(completeName1);
Phi_RM1(:,:,ens_num) = Phi(:,1:50,6);
Phi_RM2(:,:,ens_num) = Phi(:,1:50,14);
Phi_RM3(:,:,ens_num) = Phi(:,1:50,21);
clear Phi
%% Mach = 0.94
ens_num = ens_num + 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.94\Phi_240.mat';
load(completeName1);
Phi_RM1(:,:,ens_num) = Phi(:,1:50,8);
Phi_RM2(:,:,ens_num) = Phi(:,1:50,18);
Phi_RM3(:,:,ens_num) = Phi(:,1:50,27);
clear Phi
%% Dot product cross RM 1 Mach 0.8 Mach 0.6
Phi1 = Phi_RM1(:,:,2);
Phi2 = Phi_RM1(:,:,1);
Phi_m86 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a86 = angle(Phi1'*Phi2);

%% Dot product cross RM 1 Mach 0.94 Mach 0.8
Phi1 = Phi_RM1(:,:,1);
Phi2 = Phi_RM1(:,:,3);
Phi_m98 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a98 = angle(Phi1'*Phi2);

%% Dot product cross RM 1 Mach 0.94 Mach 0.6
Phi1 = Phi_RM1(:,:,2);
Phi2 = Phi_RM1(:,:,3);
Phi_m96 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a96 = angle(Phi1'*Phi2);
%% Save the correlation matrix
save('Y:\rawdata\Sandia_cavity\PhiCorr_RM1.mat','Phi_a86','Phi_a98','Phi_a96','Phi_m86','Phi_m98','Phi_m96');
%% Dot product cross RM 2 Mach 0.8 Mach 0.6
Phi1 = Phi_RM2(:,:,2);
Phi2 = Phi_RM2(:,:,1);
Phi_m86 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a86 = angle(Phi1'*Phi2);

%% Dot product cross RM 2 Mach 0.94 Mach 0.8
Phi1 = Phi_RM2(:,:,1);
Phi2 = Phi_RM2(:,:,3);
Phi_m98 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a98 = angle(Phi1'*Phi2);

%% Dot product cross RM 2 Mach 0.94 Mach 0.6
Phi1 = Phi_RM2(:,:,2);
Phi2 = Phi_RM2(:,:,3);
Phi_m96 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a96 = angle(Phi1'*Phi2);
%% Save the correlation matrix
save('Y:\rawdata\Sandia_cavity\PhiCorr_RM2.mat','Phi_a86','Phi_a98','Phi_a96','Phi_m86','Phi_m98','Phi_m96');
%% Dot product cross RM 3 Mach 0.8 Mach 0.6
Phi1 = Phi_RM3(:,:,2);
Phi2 = Phi_RM3(:,:,1);
Phi_m86 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a86 = angle(Phi1'*Phi2);

%% Dot product cross RM 3 Mach 0.94 Mach 0.8
Phi1 = Phi_RM3(:,:,1);
Phi2 = Phi_RM3(:,:,3);
Phi_m98 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a98 = angle(Phi1'*Phi2);

%% Dot product cross RM 3 Mach 0.94 Mach 0.6
Phi1 = Phi_RM3(:,:,2);
Phi2 = Phi_RM3(:,:,3);
Phi_m96 = abs(Phi1'*Phi2); % rows: 0.6 columns: 0.8
Phi_a96 = angle(Phi1'*Phi2);
%% Save the correlation matrix
save('Y:\rawdata\Sandia_cavity\PhiCorr_RM3.mat','Phi_a86','Phi_a98','Phi_a96','Phi_m86','Phi_m98','Phi_m96');
%%
clear all;
Phi_cont = zeros(6360,9);
%%
ens_num = 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi2_280.mat';
load(completeName1);
Phi_cont(:,ens_num) = Phi2(:,1,7);
Phi_cont(:,ens_num+1) = Phi2(:,1,16);
Phi_cont(:,ens_num+2) = Phi2(:,1,25);
clear Phi2
%% 
ens_num = 4;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.6\Phi_260.mat';
load(completeName1);
Phi_cont(:,ens_num) = Phi(:,1,6);
Phi_cont(:,ens_num+1) = Phi(:,1,14);
Phi_cont(:,ens_num+2) = Phi(:,1,21);
%% 
ens_num = 7;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.94\Phi_240.mat';
load(completeName1);
Phi_cont(:,ens_num) = Phi(:,1,8);
Phi_cont(:,ens_num+1) = Phi(:,1,18);
Phi_cont(:,ens_num+2) = Phi(:,1,27);
%% Save Phi values
save('Y:\rawdata\Sandia_cavity\Phi_cont.mat','Phi_cont');
%%
clear all;
Phi_cont = zeros(6360,9);
%%
ens_num = 1;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi2_280.mat';
load(completeName1);
Phi_cont(:,ens_num) = Phi2(:,1,16);
Phi_cont(:,ens_num+1) = Phi2(:,2,16);
Phi_cont(:,ens_num+2) = Phi2(:,3,16);
clear Phi2
%%
ens_num = 4;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.6\Phi_260.mat';
load(completeName1);
Phi_cont(:,ens_num) = Phi(:,1,14);
Phi_cont(:,ens_num+1) = Phi(:,2,14);
Phi_cont(:,ens_num+2) = Phi(:,3,14);
clear Phi
%%
ens_num = 7;
completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults_Mach0.94\Phi_240.mat';
load(completeName1);
Phi_cont(:,ens_num) = Phi(:,1,18);
Phi_cont(:,ens_num+1) = Phi(:,2,18);
Phi_cont(:,ens_num+2) = Phi(:,3,18);
clear Phi
%%
save('Y:\rawdata\Sandia_cavity\Phi_contLvar.mat','Phi_cont');
%%

