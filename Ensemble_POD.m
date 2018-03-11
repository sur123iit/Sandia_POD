%% APPLICATION OF POD TO DATA AT A SPACING OF 17 SNAPSHOTS
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Data collection
tic
for ens_num = 201:280
    folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    x = uv(:,2:17:N);
    if ens_num == 1
        vel_mat = x;
    else
        vel_mat = horzcat(vel_mat,x);
    end
end
toc
%%
clearvars -except vel_mat;
save('C:\Users\surabhi123iit\Documents\MATLAB\Raw\ensemble_POD\Mach0.8\vel_mat.txt');
%% Convergence with N
vel_fluc = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\ensemble_POD\Mach0.8\vel_mat.txt');
vel_fluc1 = vel_mat(:,1:6000);
vel_fluc2 = vel_mat(:,1:6300);
[eigvec1, eigval1, PODcoeff1, Phi1 ] = POD_Snapshot(vel_fluc1); %Check 
[eigvec2, eigval2, PODcoeff2, Phi2 ] = POD_Snapshot(vel_fluc2);
Phi_dot = dot(Phi1(:,1:100),Phi2(:,1:100),1);
plot(1:100,abs(Phi_dot));
plot(1:100,eigval1(1:100);