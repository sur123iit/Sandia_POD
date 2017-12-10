clear all;
load('POD_Spect_Paper.mat');
eig1 = eigen_val(1,1,:);
eig12 = sqrt(eig1);
eig12 = sum(eig12);
eigval2(:,1) = sqrt(eigen_val(1,1,:)) + sqrt(eigen_val(2,2,:)) + sqrt(eigen_val(3,3,:)) + sqrt(eigen_val(4,4,:)) + sqrt(eigen_val(5,5,:)) + sqrt(eigen_val(6,6,:)) + sqrt(eigen_val(7,7,:)) + sqrt(eigen_val(8,8,:));
eigval2 = eigval2/sum(eigval2);
plot(1:193,eigval2);
%%
clearvars eigval2
%%
%plot actual values
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
eigval = eig_val(1:4,:);
eigval = eigval';
plot_strouhal(eigval);
legend('Mode 1','Mode 2','Mode 3','Mode 4','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3');
pbaspect([1 1 1]);
%%
%plot fraction values
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval1 = sum(eig_val);
sum_eigval2 = sum(sum_eigval1);
eigval = eig_val(1:4,:)/sum_eigval2;
eigval = eigval';
plot_strouhal(eigval);
legend('Mode 1','Mode 2','Mode 3','Mode 4','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3');
pbaspect([1 1 1]);
%%
load('Vel_incrN.mat');
u = vel_fluc(1,3,1:386);
psd_u