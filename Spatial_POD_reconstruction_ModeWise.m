%% Spatial POD Mode 2
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%
m_lim = 1;
Phi = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt');
Phi1 = Phi(:,m_lim);
ens_num 
uv = 
