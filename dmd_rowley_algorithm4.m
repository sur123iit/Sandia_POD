%% EXACT DMD FOR SEQUENTIAL TIME SERIES: ALGORITHM 4
clear all;
%%
%DMD applied to pairs of data x = [x1 x2... xn-1] and y = [x2 x3... xn]
%Here n =  386 i.e. one full run
Mach = 0.8;
N = 386;
%% Data collection method
ens_num = input('Enter the ensemble number whose DMD you need to calculate:  '); 
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
x = reduce_cols(uv,1,1);
y = reduce_cols(uv,1,2);
r = N-1; % still hardcoded
%%
[u,s,v] = svd(x,0); %Reduced SVD
A_tilde = u'*y*v*pinv(s);
[dmd_vec,dmd_eval] = eig(A_tilde);
%Apply the concept of Gram-Schmidt process
%% 
