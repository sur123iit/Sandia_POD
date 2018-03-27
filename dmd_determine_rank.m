%% Checking rank convergence
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Data collection
x = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\ensemble_POD\Mach0.8\vel_fluc.txt');
%% 6400
[Qx1, S1, V1] = svd(x,0);
[Qx2, S2, V2] = svd(x(:,1:6000),0);
%% Rank analysis: r = 40 50 60 80 100
Qx_dot = dot(Qx1(:,1:200),Qx2(:,1:200));
plot(1:200,abs(Qx_dot))
eig1 = diag(S1);
eig2 = diag(S2);
plot(1:200,eig1(1:200),1:200,eig2(1:200));
%% 
clearvars x
%%
% Data collection
x = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\tr_POD\Mach0.8\vel_fluc.txt');
%% 6400
[Qx1, S1, V1] = svd(x(:,1:6400),0);
[Qx2, S2, V2] = svd(x(:,1:6000),0);
%% Rank analysis: r = 40 50 60 80 100
Qx_dot = dot(Qx1(:,1:200),Qx2(:,1:200));
plot(1:200,abs(Qx_dot))
eig1 = diag(S1);
eig2 = diag(S2);
plot(1:200,eig1(1:200),1:200,eig2(1:200));
%% Relating the two methods
[Qx1, S1, V1] = svd(x,0);
[Qx2, S2, V2] = svd(x,0);
Qx_dot = dot(Qx1(:,1:200),Qx2(:,1:200));
plot(1:200,abs(Qx_dot))
%% 
Qx_dot = dot(Qx1(:,1:200),Qx(:,1:200));
plot(1:200, abs(Qx_dot));
eig1 = diag(S1);
eig2 = diag(S);
eig1 = eig1/sum(eig1);
eig2 = eig2/sum(eig2);
plot(1:200,eig1(1:200),1:200,eig2(1:200))
%% Grid plot
g1 = Qx1(:,1:200);
g2 = Qx(:,1:200);
grid_matrix = g1'*g2;
cont1 = abs(grid_matrix(1:200,1:200));
%% Spacing wrt Continuous grid matrix
c = gray(10);
c = flipud(c);
colormap(c);
h = pcolor(cont1(1:50,1:50))
caxis([0 1]);
pbaspect([1 1 1])
set(h,'EdgeColor','black');
colorbar;
caxis([0 1])
set(gca,'fontsize',15);
xticks(20:20:100), yticks(20:20:100)
set(gcf,'Position',[0 0 700 600])
xlabel('50 blocks','FontSize',25), ylabel('40 blocks','FontSize',25),
%% Showing convergence with number of blocks
c = gray(30);
c = flipud(c);
colormap(c);
h = pcolor(Atilde2)
caxis([0 1]);
pbaspect([1 1 1])
set(h,'EdgeColor','black');
colorbar;
caxis([0 1])
%%