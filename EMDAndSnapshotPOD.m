%%
clear all;
load('Y:\rawdata\Sandia_cavity\uv_matEMD.mat');
%%
[~,eval,~,evec] = POD_Snapshot(uv_mt);
%%
eval1 = eval/sum(eval);
[x1,y1,Uphi,Vphi] = cont_plot_uv(evec(3:8:50880,5));
l1 = abs(max(max(Vphi)));
l2 = abs(min(min(Vphi)));
l = max(l1,l2);
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none');
caxis([-l l])
axis equal
colormap(redblue)
%% 
[~,eval2,~,evec2] = POD_Snapshot(uv_mt(6:8:50880,:));
%%
eval1 = eval/sum(eval);
[x1,y1,Uphi,Vphi] = cont_plot_uv(evec2(:,5));
l1 = abs(max(max(Vphi)));
l2 = abs(min(min(Vphi)));
l = max(l1,l2);
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none');
caxis([-l l])
axis equal
colormap(redblue)
%%