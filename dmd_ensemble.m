%% ENSEMBLE DMD APPLIED TO THE DATA SETS
clear all;
%% Loading parameters of flow
N = 386;
Mach = 0.8;
%% Equation (4.6) from Towne et al (2017)
del_t = 10.2*10^-3/386;
Fn = dftmtx(N)/sqrt(N); %386x386
eig_val(:,1) = Fn(2,2:386);
z = eig_val(1,1);
freq = real((log(eig_val/z))/(-i*2*pi*del_t)); 
%% Plot real and imaginary parts (exactly on the circle
real_evals = real(eig_val);
imag_evals = imag(eig_val);
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
xticks(-1:0.25:1); yticks(-1:0.25:1);
%%
Tx = eye(N-1);
tx_add = zeros(1,N-1);
Ty = vertcat(tx_add,Tx);
Tx = vertcat(Tx,tx_add);
Tx_cap = Fn*Tx;
Ty_cap = Fn*Ty;
Fn1 = dftmtx(N);

%% Loading data
ens_num = 2;
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
q = (load(completeName)); %6360x386
%% q_cap
q_cap = q*Fn';
%%
eig_val = eig();
%%
