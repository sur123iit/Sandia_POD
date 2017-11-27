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
sum = 0;
a = zeros(193,1);
for i = 1:193
    sum = sum + eigval2(i,1);
    a(i,1) = sum;
end
plot(1:193,a);