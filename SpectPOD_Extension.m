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
%plot fraction values for Mode 1, Mode 2 and Mode 3 vs frequency
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval1 = sum(eig_val);
sum_eigval2 = sum(sum_eigval1);
eigval = eig_val(1:4,:)/sum_eigval2;
eigval = eigval';
plot_strouhal(eigval);
legend('Mode 1','Mode 2','Mode 3','Mode 4','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3');
pbaspect([1 1 1]);

%%
%Energy Plots
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval1 = sum(eig_val);
sum_eigval2 = sum(sum_eigval1);
sum_eigval1 = sum_eigval1/sum_eigval2;
plot_strouhal(sum_eigval1');
xlabel('Strouhal Number','FontSize',25), ylabel('Energy fraction','FontSize',25)
pbaspect([1 1 1]);
%%
%Energy Convergence Plots
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\Spect_eigval.mat');
sum_eigval3 = sum(eig_val,2);
sum_eigval4 = sum(sum_eigval3);
sum_eigval3 = sum_eigval3/sum_eigval4;
sum_eigval5 = en_cnvr_ary(sum_eigval3);
plot(1:100,sum_eigval5(1:100,1),'o-');
xlim([1 100]), ylim([0 1])
xlabel('Mode number','FontSize',25), ylabel('Energy fraction','FontSize',25)
pbaspect([1 1 1]);
hold on
plot([25 25],[0 sum_eigval5(25,1)],'--');
hold on
plot([0 25],[sum_eigval5(25,1) sum_eigval5(25,1)],'--');