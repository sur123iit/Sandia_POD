clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\';
fileName = 'uv_rec_1.txt';
completeName = strcat(folderName,fileName);
uv = load(completeName);
[x1,y1,Uphi,Vphi] = cont_plot_uv( uv(:,12) );
Phi_viz = Vphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
%colorbar
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
q.AutoScaleFactor = 1.0;
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
colormap(redblue)
%colorbar % depending on location
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0])
hold off
