%% This program is for modal reconstructions
%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%
vel_fluc = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ens_280.txt');
vel_mean = mean(vel_fluc,2);
vel_fluc = vel_fluc - vel_mean;
[eigvec,eigval,PODcoeff,Phi] = POD_Snapshot(vel_fluc);
%% Contour plot
m = 3;
Phi_viz = Phi(:,m);
cont_plot_POD(Phi_viz,2);