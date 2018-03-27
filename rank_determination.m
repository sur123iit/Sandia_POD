%% This is the rank reduction of operator A based on the text by Peter J Schmid
clear all;
%%
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_1.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = x1;
y = y1;
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_2.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = horzcat(x,x1);
y = horzcat(y,y1);
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_3.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = horzcat(x,x1);
y = horzcat(y,y1);
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_4.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = horzcat(x,x1);
y = horzcat(y,y1);
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_5.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = horzcat(x,x1);
y = horzcat(y,y1);
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_6.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = horzcat(x,x1);
y = horzcat(y,y1);
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_7.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = horzcat(x,x1);
y = horzcat(y,y1);
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_8.txt');
x1 = uv(:,1:385);
y1 = uv(:,2:386);
clearvars uv;
x = horzcat(x,x1);
y = horzcat(y,y1);
%%
[Qx,S,V] = svd(x,0);
Atilde = Qx' * y * V * pinv(S);
%%
max_Atilde = max(max(Atilde));
min(min(Atilde));
Atilde1 = Atilde/max_Atilde;
Atilde1 = abs(Atilde1);
c = gray(30);
c = flipud(c);
colormap(c);
h = pcolor(Atilde2(201:200,1:100))
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
caxis([0 1])
Atilde2 = Atilde;
Atilde2(abs(Atilde2)>10^-4)=1;
Atilde2(abs(Atilde2)<10^-4)=0;
%%
[U_Atilde,S_Atilde,V_Atilde] = svd(Atilde);
%%
clear all;
%%
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\EODMar1_ens60_tu_xy.mat');
%% svd for 50 blocks
tic
[Qx, S, V] = svd(X,0);
toc
%%
Atilde = Qx' * Y * V * pinv(S);
[U1,S1, V1] = svd(Atilde);
Atilde1 = Qx(:,1:100)'*Y*V(:,1:100)*pinv(S(1:100,1:100));
%%
contourf(x_ax,y_ax,abs(Atilde),100,'LineStyle','none');
set(gca,'fontsize',20,'FontWeight','Bold');
xlabel('x/D','FontSize',40), ylabel('y/D','FontSize',40),
colormap(redblue)
l1 = abs(max(max(Vphi))); %Vphi or Uphi
l2 = abs(min(min(Vphi))); %Vphi or Uphi
%contourf(x1/D,y1/D,Uphi',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l2 l2]);%pick l1 or l2 (larger of the two)
axis equal
set(gcf,'Position',[0 0 1200 420])
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%%
