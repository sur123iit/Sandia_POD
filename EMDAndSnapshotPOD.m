%%
clear all;
load('Y:\rawdata\Sandia_cavity\uv_matEMD.mat');
%%
[~,eval,~,evec] = POD_Snapshot(uv_mt);
%%