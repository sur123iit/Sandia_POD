%%
clear all;
r = 6;
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\RossiterModes\RossiterMode3\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
c_lim = 0.05;
%%
k = 66+16;
uv1 = uv(:,k);
UV1 = uv1;
%UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Vphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
colormap(jet(256))
hold on
xred = 1:2:106;
yred = 1:2:30;
x2 = x1(xred);
y2 = y1(yred);
Uphi2 = Uphi(xred,yred);
Vphi2 = Vphi(xred,yred);
q = quiver(x2/D,y2/D,Uphi2',Vphi2');
q.Color = [0 0 0];
q.AutoScaleFactor = 1.4;
q.LineWidth = 2;
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
%set(gcf,'Position',[0 0 1200 540])
set(gcf,'Position',[0 0 1200 540])
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off
%%
k = 58;
uv1 = uv(:,k);
UV1 = uv1 + uvm1;
[x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
Phi_viz = Uphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
%c = colorbar;
%c.LineWidth = 2;
colormap(jet(256))
hold on
x2 = x1(2:6:106);
y2 = y1(2:3:30);
%Uphi2 = Uphi(horzcat(1:4:106,106),horzcat(1:4:30,30));
%Vphi2 = Vphi(horzcat(1:4:106,106),horzcat(1:4:30,30));
Uphi2 = Uphi(horzcat(1:5:106),horzcat(1:5:30,30));
Vphi2 = Vphi(horzcat(1:5:106),horzcat(1:5:30,30));

startx = (x1(1)/D)*ones(30,1);
sty = y1(30)/D*ones(106,1);
stx = x1/D;
sttx = vertcat(startx,stx);
starty = y1/D;
stty = vertcat(starty,sty);
% keep changing here
x4 = datasample(x1,20,'Replace',false);
y4 = datasample(y1,10,'Replace',false);
%[x3,y3] = meshgrid(x1(2:6:106),y1(2:3:30));
%[x3,y3] = meshgrid(x1(2:6:106),y1(2:6:30));
%[x3,y3] = meshgrid(x1(2:6:106),y1(2:3:30));
%[x3,y3] = meshgrid(vertcat(x1(1:4:106),x1(106)),vertcat(y1(1:4:30),y1(30)));
[x3,y3] = meshgrid(x1(1:5:106),vertcat(y1(1:5:30),y1(30)));
s = streamline(x3/D,y3/D,Uphi2',Vphi2',x3/D,y3/D);
%s = streamline(x1/D,y1/D,Uphi',Vphi',sttx,stty);
set(s,'Color',[0.3 0.3 0.3],'LineWidth',1);
%q = quiver(x2/D,y2/D,Uphi2',Vphi2');
%q.Color = [0 0 0];
%q.AutoScaleFactor = 0.9;
%q.LineWidth = 2;
%plot(plot::streamlines2d(Uphi',Vphi',x1/D,y1/D));
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off

