%EXACT DMD ALGORITHM 3 AS PER TU ET AL
clear all;
%% Data collection
ens_num = 1;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
x = load(completeName);

ens_num = 2;
folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
y = load(completeName);

r = 386;
ens_num = ens_num - 1;
%% Exact DMD Application
[u,s,v] = svd(x,0); % Reduced svd
z = [x y];
[Q,~,~] = svd(z,0); % Reduced svd
A = y*v*pinv(s)*u';
Aq_tilde = Q'*A*Q;
[dmd_vec,dmd_evals] = eig(Aq_tilde);
dmd_mode = Q*dmd_vec;
%% Plotting evals
dmd_evals1 = diag(dmd_evals);
real_evals = real(dmd_evals1);
imag_evals = imag(dmd_evals1);
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
xticks(-1:0.25:1); yticks(-1:0.25:1);
%%