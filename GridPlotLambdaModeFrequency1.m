%% L vs StL
eig4 = (lambda(:,1:5));
eig5 = (lambda(:,1:5));
%eig5 = (eig2(1:5,:))';
count = 250;
eig6 = count*eig5/max(max(eig4));
eig7 = eig6;
%
%eig7 = eig6(:,[4 3 2 1]);
%c = gray(30);
%grid on

image(flipud(eig7'));
c = colormap(blackwhite(count));
c = flipud(c);
caxis([0 1])
%c = colorbar;
%c.LineWidth = 2;
set(gca, 'LineWidth', 2)%colormap(c);

pbaspect([2 1 1])
set(gca,'fontsize',24,'FontWeight','Bold','LineWidth',2);

xlabel('St_L','FontSize',38,'FontWeight','Bold','FontAngle','Italic');
ylabel('l','FontSize',38,'FontWeight','Bold','FontAngle','Italic');
%
xmax = 85.5;
xticks(13:13:85.5);
yticks(-5:15:15);
%xticks(0:17:192), yticks(0:10:20)
xlim([1.5 xmax])
hold on
for ii = 2.5:1:(xmax-1)
plot([ii ii],[0.5 5.5],'LineWidth',1,'Color',[0 0 0])
end
for ii = 0.5:1:4.5
    plot([0.5 xmax],[ii ii],'Color',[0 0 0]);
end
hold off
set(gcf,'Position',[0 0 1465 723])
%%
