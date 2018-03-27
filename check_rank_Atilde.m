%% This code is for checking rank of the matrix Atilde
%%
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Number of blocks is Ne
Ne = 50;
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
for ens_num = 41:Ne
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    fullName =  strcat(folderName,fileName);
    uv = load(fullName);
    x1 = uv(:,1:385);
    y1 = uv(:,2:386);
    clearvars uv;
    if ens_num == 1
        x = x1;
        y = y1;
    else
        x = horzcat(x,x1);
        y = horzcat(y,y1);
    end
    clearvars x1 y1;
end

%% svd for these blocks
tic
[Qx, S, V] = svd(x,0);
toc
%%
Atilde = (Qx(:,1:500))'*y*V(:,1:500)*pinv(S(1:500,1:500));
%%
clearvars det_Atilde
[s1,s2] = size(Atilde);
for ii = 1:500
    det_Atilde(ii,1) = det(Atilde(1:ii,1:ii));
end
%% Plot det_Atilde to determine rank
r1 = 500;
plot(1:r1,det_Atilde(1:r1,1));
%%
det_Atilde_10 = det_Atilde;
det_Atilde_20 = det_Atilde;
det_Atilde_30 = det_Atilde;
det_Atilde_40 = det_Atilde;
det_Atilde_50 = det_Atilde;
%%
for ii = 1:500
    cond_Atilde(ii,1) = cond(Atilde(1:ii,1:ii));
end
