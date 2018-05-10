%% grid matrix
m1 = max(m_index(1:50));
f1 = max(f_index(1:50));
eig5 = zeros(f1,m1);
for ii = 1:50
eig5(f_index(ii),m_index(ii))=eig4(ii);
end
count = 40;
eig6 = count*eig5/max(max(eig5));
eig7 = eig6(:,[4 3 2 1]);
%c = gray(30);
%grid on

image(eig7');
c = colormap(blackwhite(count));
c = flipud(c);
%caxis([0 1])
c = colorbar;
c.LineWidth = 2;
set(gca, 'LineWidth', 2)%colormap(c);

pbaspect([2 1 1])
xlabel('St_D','FontSize',34,'FontWeight','Bold');
ylabel('l','FontSize',34,'FontWeight','Bold','FontAngle','Italic');
xticks(0:17:34), yticks(0:10:20)
hold on
for ii = 1.5:1:33.5
plot([ii ii],[0.5 4.5],'LineWidth',1,'Color',[0 0 0])
end
for ii = 0.5:1:3.5
    plot([0.5 34.5],[ii ii],'Color',[0 0 0]);
end
hold off
%%
cbh = colorbar;
set(cbh,'XTick',0:0.2:1);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xticks(0:20:100), yticks(0:20:100)
xlabel('Ensemble(N = 4000)','FontSize',34), ylabel('Time Resolved(N = 4000)','FontSize',34);