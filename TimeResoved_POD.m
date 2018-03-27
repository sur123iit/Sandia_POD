%% APPLICATION OF POD TO DATA AT A SPACING OF 17 SNAPSHOTS
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Data collection
tic
for ens_num = 1:40
    folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    x = load(completeName);
    if ens_num == 1
        vel_fluc = x;
    else
        vel_fluc = horzcat(vel_fluc,x);
    end
    clearvars uv x;
end
toc
%% Save
clearvars -except vel_fluc;
save('C:\Users\surabhi123iit\Documents\MATLAB\Raw\tr_POD\Mach0.8\vel_fluc.txt','vel_fluc','-ascii');
%%
vel_fluc = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\tr_POD\Mach0.8\vel_fluc.txt');
vel_fluc1 = vel_fluc(:,1:6000);
vel_fluc2 = vel_fluc(:,1:6300);
[eigvec1, eigval1, PODcoeff1, Phi1 ] = POD_Snapshot(vel_fluc1); %Check 
[eigvec2, eigval2, PODcoeff2, Phi2 ] = POD_Snapshot(vel_fluc2);
Phi_dot = dot(Phi1(:,1:100),Phi2(:,1:100),1);
plot(1:100,abs(Phi_dot))
,1:100,eigval1(1:100),1:100,eigval2(1:100));
plot(1:100,eigval1(1:100),1:100,eigval2(1:100));
eigvec_dot = dot(eigvec1(1:6000,1:100),eigvec2(1:6000,1:100),1);
plot(1:100,abs(eigvec_dot))
%%