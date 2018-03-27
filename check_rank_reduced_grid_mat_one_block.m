%%This program is to check rank
x = x1;
y = y1;
[Qx,S,V] = svd(x,0);
Atilde = Qx'*y*V*pinv(S);
Atilde1 = abs(Atilde)/max(max(abs(Atilde)));
c = gray(10);
c = flipud(c);
colormap(c);
h = pcolor(Atilde1(1:150,1:150))
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
caxis([0 1])
set(gcf,'Position',[0 0 1200 1200])
xticks(50:50:150), yticks(50:50:150)
set(gca,'fontsize',18);
xlabel('Columns','FontSize',34),ylabel('Rows','FontSize',34)
%%
clearvars x1 y1 x y Atilde Atilde1
%%
for ii = 1:3080
det_Atilde(ii,1) = det(Atilde(1:ii,1:ii));
end
%%
c = gray(10);
c = flipud(c);
colormap(c);
h = pcolor(Atilde2(201:350,201:350))
caxis([0 1]);
pbaspect([1 1 1])
colorbar;
caxis([0 1])
set(gcf,'Position',[0 0 1200 1200])
xticks(50:50:150), yticks(50:50:150)
set(gca,'fontsize',18);
xlabel('Columns','FontSize',34),ylabel('Rows','FontSize',34)
