%% Classical Spatial application of the POD
%%
clear all;
%% Load parameters for use
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%% Correlation Matrix
completeName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\ensemble_POD\Mach0.8\vel_fluc.txt';
uv1 = load(completeName);
uv = uv1(:,1:5000);
uv_m = mean(uv,2);
uv = uv - uv_m;
%% Classical POD application
[~,eigval,Phi,~] = POD_clas(uv);
%%
Phi1 = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt');
%% Apply to time resolved data

%% Classical Spatial application of the POD
%%
clear all;
%% Load parameters for use
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%% Correlation Matrix
completeName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\tr_POD\Mach0.8\vel_fluc.txt';
uv1 = load(completeName);
uv = uv1(:,1:5000);
uv_m = mean(uv,2);
uv = uv - uv_m;
%% Classical POD application
[~,eigval,Phi,~] = POD_clas(uv);
%%
Phi1 = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_trN_5000.txt');
%%
%% Classical Spatial application of the POD
%%
clear all;
%% Load parameters for use
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%% Correlation Matrix
completeName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\tr_POD\Mach0.8\vel_fluc.txt';
uv1 = load(completeName);
uv = uv1(:,1:100);
uv_m = mean(uv,2);
uv = uv - uv_m;
%% Classical POD application
[~,eigval,Phi,~] = POD_clas(uv);
save('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_clasN_19300.txt','Phi','-ascii');
%%
Phi1 = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_trN_5000.txt');
Phi2 = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt');