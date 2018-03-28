%%
clear all;
%%
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Vel_spacN.mat');
clearvars -except vel_fluc
%% Snapshot POD for Ns1
Ns1 = 3500;
u1(:,:) = vel_fluc(:,3,1:Ns1);
v1(:,:) = vel_fluc(:,4,1:Ns1);
vel_fluc1 = vertcat(u1,v1);
[eigvec1, eigval1, PODcoeff1, Phi1] = POD_Snapshot(vel_fluc1);
Ns2 = 4000;
u2(:,:) = vel_fluc(:,3,1:Ns2);
v2(:,:) = vel_fluc(:,4,1:Ns2);
vel_fluc2 = vertcat(u2,v2);
[eigvec2, eigval2, PODcoeff2, Phi2] = POD_Snapshot(vel_fluc2);
%%
Phi_dot = dot(Phi1(:,1:200),Phi2(:,1:200));
plot(1:40,abs(Phi_dot(1:40)),'o-');
pbaspect([ 1 1 1]);
%%
clear all;
%%
uv = load('Z:\rawdata\Sandia_cavity\Denoise velocity data\tr_POD\Mach0.8\vel_fluc.txt');
Ns3 = 15000;
vel_fluc3 = uv(:,1:Ns3);
[eigvec3, eigval3, PODcoeff3, Phi3] = POD_Snapshot(vel_fluc3);
%%
Phi_dot = dot(Phi2(:,1:200),Phi3(:,1:200));
plot(1:40,abs(Phi_dot(1:40)),'o-');
%%

