%Implementing Section 4.2 from Colonius Spectral POD paper
%Section Name: 4.2 An ensemble DMD problem for stationary flows
M = 386; % you need to automate this
Ne =  280; % Number of blocks or ensembles
Ng = 6360; % Number of gridpoints * flow variables
Tx = eye(M-1);
Ty = eye(M-1);
cat_mat = zeros(1,M-1);
Tx = vertcat(Tx,cat_mat);
Ty = vertcat(cat_mat,Ty);
clearvars cat_mat;
x = zeros(Ng,M-1,Ne);
y = zeros(Ng,M-1,Ne);
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\fill8ens1.mat');
clearvars fill8ens_mean fill8ens_mat;
for ens_num = 1:50
    temp_vel(:,:) = vertcat(fill8ens_fluc(:,3,(M*(ens_num-1))+1:M*ens_num),fill8ens_fluc(:,4,(M*(ens_num-1))+1:M*ens_num));
    x(:,:,ens_num) = temp_vel*Tx;
    y(:,:,ens_num) = temp_vel*Ty;
    clear temp_vel;
end
clearvars fill8ens_fluc;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\fill8ens2.mat');
clearvars fill8ens_mean fill8ens_mat;
for ens_num = 1:50
    temp_vel(:,:) = vertcat(fill8ens_fluc(:,3,(M*(ens_num-1))+1:M*ens_num),fill8ens_fluc(:,4,(M*(ens_num-1))+1:M*ens_num));
    x(:,:,ens_num+50) = temp_vel*Tx;
    y(:,:,ens_num+50) = temp_vel*Ty; 
    clear temp_vel;
end
clearvars fill8ens_fluc;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\fill8ens3.mat');
clearvars fill8ens_mean fill8ens_mat;
for ens_num = 1:50
    temp_vel(:,:) = vertcat(fill8ens_fluc(:,3,(M*(ens_num-1))+1:M*ens_num),fill8ens_fluc(:,4,(M*(ens_num-1))+1:M*ens_num));
    x(:,:,ens_num+100) = temp_vel*Tx;
    y(:,:,ens_num+100) = temp_vel*Ty;
    clear temp_vel;
end
clearvars fill8ens_fluc;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\fill8ens4.mat');
clearvars fill8ens_mean fill8ens_mat;
for ens_num = 1:50
    temp_vel(:,:) = vertcat(fill8ens_fluc(:,3,(M*(ens_num-1))+1:M*ens_num),fill8ens_fluc(:,4,(M*(ens_num-1))+1:M*ens_num));
    x(:,:,ens_num+150) = temp_vel*Tx;
    y(:,:,ens_num+150) = temp_vel*Ty;
    clear temp_vel;
end
clearvars fill8ens_fluc;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\fill8ens5.mat');
clearvars fill8ens_mean fill8ens_mat;
for ens_num = 1:50
    temp_vel(:,:) = vertcat(fill8ens_fluc(:,3,(M*(ens_num-1))+1:M*ens_num),fill8ens_fluc(:,4,(M*(ens_num-1))+1:M*ens_num));
    x(:,:,ens_num+200) = temp_vel*Tx;
    y(:,:,ens_num+200) = temp_vel*Ty;
    clear temp_vel;
end
clearvars fill8ens_fluc;
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\fill8ens6.mat');
clearvars fill8ens_mean fill8ens_mat;
for ens_num = 1:30
    temp_vel(:,:) = vertcat(fill8ens_fluc(:,3,(M*(ens_num-1))+1:M*ens_num),fill8ens_fluc(:,4,(M*(ens_num-1))+1:M*ens_num));
    x(:,:,ens_num+250) = temp_vel*Tx;
    y(:,:,ens_num+250) = temp_vel*Ty;
    clear temp_vel;
end
clearvars fill8ens_fluc;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\ens_dmd\x\';
for ens_num = 1:280
    fileName = strcat('ens_dmd_x_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    X(:,:) = x(:,:,ens_num);
    save(completeName,'X','-ascii');
    clearvars X;
end
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\ens_dmd\y\';
for ens_num = 1:280
    fileName = strcat('ens_dmd_y_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    Y(:,:) = y(:,:,ens_num);
    save(completeName,'Y','-ascii');
    clearvars Y;
end
%save('C:\Users\surabhi123iit\Documents\MATLAB\Raw\dmd_xy.mat','x','y','-v7.3');
%%
clear all;
close all;
ens_num = 2;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\ens_dmd\x\';
fileName = strcat('ens_dmd_x_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
x = load(completeName);
%Implement svd etc on this.
[u,s,v] = svd(x);
%load y
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\ens_dmd\y\';
fileName = strcat('ens_dmd_y_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
y = load(completeName);
A = u*y*v/s;
[eigvec, eigval] = svd(A);
Phi = u*eigvec;
eig_val = diag(eigval);
eig_val_sum = sum(eig_val);
eig_val = eig_val/eig_val_sum;
eig_val_conv = en_cnvr_ary(eig_val);
plot(1:100, eig_val_conv(1:100,1));