%% This program is to plot the points on the cavity
clear all;
%% Notes
%{
x1(32) = 1.5;
x1(54) = 2.5;
x1(88) = 4;
y1(29) = -0.25;
y1(17) = 0;
%}
%% Fig. 2 a)
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
[x1,y1] = getxy();
x2 = x1/D;
y2 = y1/D;
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = 'vel_mean.txt';
completeName = strcat(folderName,fileName);
uv_m = load(completeName);
uvm = mean(uv_m,2);
[x1,y1,Uphi,Vphi] = cont_plot_uv( uvm );
Phi_viz = Uphi/Uinf;
cmax = max(max(Phi_viz));
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
startx = (x1(1)/D)*ones(10,1);
sty = y1(30)/D*ones(18,1);
stx = x1(2:6:106)/D;
sttx = vertcat(startx,stx);
hold on
starty = y1(2:3:30)/D;
stty = vertcat(starty,sty);
[x3,y3] = meshgrid(x1(1:6:106),y1(1:3:30));
s = streamline(x1/D,y1/D,Uphi',Vphi',sttx,stty);
%plot(plot::streamlines2d(Uphi',Vphi',x1/D,y1/D));
set(s,'Color',[0.5 0.5 0.5],'LineWidth',1.5);
caxis([-cmax cmax]);
colormap(jet(256))
plot([x2(54) x2(88)],[y2(17) y2(29)],'*','Color',[0 0 0],'MarkerSize',12);
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2);
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
c = colorbar;
c.LineWidth = 2; % depending on location
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1265 550])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
hold off
%% Plot Auto-correlation plots for these points
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%xcoor1 = 32;
%ycoor1 = 29;
xcoor2 = 54;
ycoor2 = 17;
xcoor3 = 88;
ycoor3 = 29;
%%
uvswitch = 3180;
jj = xcoor3+(106*ycoor3) + uvswitch;
R = zeros(31,1);
for r = 1:40
    folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
    fileName = 'ens_num_1.txt';
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    upoint = uv(jj,:);
    upoint = upoint';
    for tau = 1:31
         for ii = 1:386-tau+1
             R(tau,1)= R(tau,1) + (upoint(ii)*upoint(ii+tau-1));
         end
    end
end
%%
for tau = 1:31
    R(tau,1) = R(tau,1)/(r*(386-tau+1));
end
R = R/R(1,1);
plot(0:0.026:0.78,R','LineWidth',2)
ylim([-0.3 1]), xlim([0 0.782])
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
pbaspect([1 1 1])
hold on
%%
plot(0:0.026:0.78,zeros(31,1),'--','Color',[0 0 0],'LineWidth',2)

%%
set(gca,'fontsize',20,'FontWeight','Bold','LineWidth',2);
xlabel('t (ms)','FontSize',34), ylabel('\rho (t)','FontSize',34), xticks(0:0.15:0.75), yticks(-0.25:0.25:1);
lgd = legend('Point A','Point B','Location','NorthEast');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
%%

