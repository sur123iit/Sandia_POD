%% This program compares the ensemble and time resolved modes achieved from the same number of runs
%% Saving the quantities of energy and Phi till 6360
clear all;
%%
%%
uv_tr = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\tr_POD\Mach0.8\vel_fluc.txt');
Ns_tr = 19300;
vel_fluc_tr = uv(:,1:Ns_tr);
[eigvec_tr, eigval_tr, PODcoeff_tr, Phi_tr] = POD_Snapshot(vel_fluc_tr);
%%
uv_ens = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\ensemble_POD\Mach0.8\vel_fluc.txt');
Ns_ens = 1150;
vel_fluc_ens = uv(:,1:Ns_ens);
[eigvec_ens, eigval_ens, PODcoeff_ens, Phi_ens] = POD_Snapshot(vel_fluc_ens);
%%

dot_Phi = dot(Phi_tr(:,1:200),Phi2(:,1:200));
plot(1:40,abs(dot_Phi(1:40)))
%%
grid_matrix =  (Phi_tr(:,1:200))'*(Phi_ens(:,1:200));
grid_mat = abs(grid_matrix);
c = gray(30);
c = flipud(c);
colormap(c);
h = pcolor(grid_mat(1:100,1:100));
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
set(gcf,'Position',[0 0 800 800])
%xticks(0:20:100), yticks(0:20:100)
xlabel('Ensemble (4000 snapshots)'), ylabel('Time Resolved (15000 snapshots)');
%%
grid_matrix =  (Phi_tr(:,1:200))'*(Phi2(:,1:200));
grid_mat = abs(grid_matrix);
c = gray(30);
c = flipud(c);
colormap(c);
h = pcolor(grid_mat(1:100,1:100));
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
set(gcf,'Position',[0 0 800 800])
%xticks(0:20:100), yticks(0:20:100)
xlabel('Ensemble (4000 snapshots)'), ylabel('Time Resolved (15000 snapshots)');

%%
save('Y:\rawdata\Sandia_cavity\ConvergencePhi\Phi_tr_runs_50.txt','Phi3','-ascii');
