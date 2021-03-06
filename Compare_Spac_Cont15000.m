%%
clear all;
%%
load('Y:\rawdata\Sandia_cavity\Vel_spacN.mat');
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
uv = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\tr_POD\Mach0.8\vel_fluc.txt');
Ns3 = 19300;
vel_fluc3 = uv(:,1:Ns3);
[eigvec3, eigval3, PODcoeff3, Phi3] = POD_Snapshot(vel_fluc3);
%%
Phi_dot = dot(Phi2(:,1:200),Phi3(:,1:200));
plot(1:40,abs(Phi_dot(1:40)),'o-');
%%
grid_mat = (Phi3(:,1:200))'*(Phi2(:,1:200));
grid_mat = abs(grid_mat);
c = gray(30);
c = flipud(c);
colormap(c);
h = pcolor(grid_mat(1:100,1:100));
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
set(gcf,'Position',[0 0 800 800])
xticks(0:20:100), yticks(0:20:100)
%%
clearvars vel_fluc;
load('Y:\rawdata\Sandia_cavity\Vel_incrN.mat');
clearvars vel_mat vel_mean
%%
u3(:,:) = vel_fluc(:,3,:);
v3(:,:) = vel_fluc(:,4,:);
vel_fluc4 = vertcat(u3,v3);
%%
[eigvec4, eigval4, PODcoeff4, Phi4] = POD_Snapshot(vel_fluc4);
%%
grid_mat = (Phi3(:,1:200))'*(Phi2(:,1:200));
grid_mat = abs(grid_mat);
c = gray(30);
c = flipud(c);
colormap(c);
h = pcolor(grid_mat(1:100,1:100));
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
set(gcf,'Position',[0 0 800 800])

