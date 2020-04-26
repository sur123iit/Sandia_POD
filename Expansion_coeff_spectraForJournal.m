clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigG.mat');
% load eig1
load('Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\a_n\CrossCorrelation\a_lf.mat');
FigG
eig3 = a_lf.*conj(a_lf);
eig4 = mean(eig3,3);
eig1 = eig4(1:193,:);
hold off;
eig2 = eig1/sum(sum(eig1));
%plot(FigG.xpts,eig2(1,FigG.pts),'o-',FigG.xpts,eig2(2,FigG.pts),'s-',FigG.xpts,eig2(3,FigG.pts),'^-','LineWidth',2);
plot(FigG.xpts,eig2(FigG.pts,1),'o-','LineWidth',2);
hold on; 
plot(FigG.xpts,eig2(FigG.pts,2),'o-','LineWidth',2);
plot(FigG.xpts,eig2(FigG.pts,3),'o-','LineWidth',2);
plot(FigG.xpts,eig2(FigG.pts,4),'o-','LineWidth',2);
plot(FigG.xpts,eig2(FigG.pts,5),'o-','LineWidth',2);
plot(FigG.xpts,eig2(FigG.pts,6),'o-','LineWidth',2);
plot(FigG.xpts,eig2(FigG.pts,7),'o-','LineWidth',2);
format_graph(1);
xlim(FigG.xlim1), ylim(FigG.ylim1);
xticks(FigG.xtick1), yticks(FigG.ytick1);
for ros_ind = 1:4
    plot([FigG.ross(ros_ind) FigG.ross(ros_ind)],FigG.ylim1,'--','Color',[0 0 0],'LineWidth',2)
end
xlabel('$St_L$','FontSize',34,'FontWeight','Bold','Interpreter','latex'), ylabel('$PSD(a^l)$','FontSize',34,'FontWeight','Bold','Interpreter','latex')
lgd = legend('$PSD(a^1)$','$PSD(a^2)$','$PSD(a^3)$','$PSD(a^4)$','$PSD(a^5)$','$PSD(a^6)$','$PSD(a^7)$');
set(lgd,'Interpreter','latex')
%%

clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigG.mat');
% load eig1
load('Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\a_n\CrossCorrelation\a_lf.mat');
FigG
eig1 = load(FigG.completeName);
hold off;
eig2 = eig1/sum(sum(eig1));
%plot(FigG.xpts,eig2(1,FigG.pts),'o-',FigG.xpts,eig2(2,FigG.pts),'s-',FigG.xpts,eig2(3,FigG.pts),'^-','LineWidth',2);
plot(FigG.xpts,eig2(1,FigG.pts),'o-','LineWidth',2);
hold on; 
plot(FigG.xpts,eig2(2,FigG.pts),'o-','LineWidth',2);
plot(FigG.xpts,eig2(3,FigG.pts),'o-','LineWidth',2);
format_graph(1);
xlim(FigG.xlim1), ylim(FigG.ylim1);
xticks(FigG.xtick1), yticks(FigG.ytick1);
for ros_ind = 1:4
    plot([FigG.ross(ros_ind) FigG.ross(ros_ind)],FigG.ylim1,'--','Color',[0 0 0],'LineWidth',2)
end
xlabel('$St_L$','FontSize',34,'FontWeight','Bold','Interpreter','latex'), ylabel('$PSD(a^l)$','FontSize',34,'FontWeight','Bold','Interpreter','latex')
lgd = legend('$PSD(a^1)$','$PSD(a^2)$','$PSD(a^3)$');
set(lgd,'Interpreter','latex')
%%
