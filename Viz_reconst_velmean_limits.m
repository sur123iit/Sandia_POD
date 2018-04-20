%% This program is to plot the points on the cavity
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
[x1,y1] = getxy();
x1 = x1/D;
y1 = y1/D;
%{
x1(32) = 1.5;
x1(54) = 2.5;
x1(88) = 4;
y1(29) = -0.25;
y1(17) = 0;
%}
plot([x1(32) x1(54) x1(88)],[y1(29) y1(17) y1(29)],'*','Color',[0 0 0],'MarkerSize',10)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
%colorbar % depending on location
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
hold off
%% Plot Auto-correlation plots for these points
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
xcoor1 = 32;
ycoor1 = 29;
xcoor2 = 54;
ycoor2 = 17;
xcoor3 = 88;
ycoor3 = 29;
%%
uvswitch = 3180;
jj = xcoor3+(106*ycoor3)+uvswitch;
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = 'ens_num_1.txt';
completeName = strcat(folderName,fileName);
uv = load(completeName);
R = zeros(30,1);
upoint = uv(jj,:);
upoint = upoint';
for tau = 1:30
    for ii = 1:386-tau+1
    R(tau,1)= R(tau,1) + (upoint(ii)*upoint(ii+tau-1));
    end
    R(tau,1) = R(tau,1)/(386-tau+1);
end
Rtot = 0;
for ii = 1:386
    Rtot = Rtot + upoint(ii)*upoint(ii);
end
Rtot = Rtot / 386;
R = R/Rtot;
R = vertcat(1,R);
plot(0:0.026:0.78,R,'LineWidth',2)
ylim([-0.3 1]), xlim([0 0.782])
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
pbaspect([1 1 1])
hold on
%%
plot(0:0.026:0.78,zeros(31,1),'--','Color',[0 0 0],'LineWidth',2)
legend('Point A','Point B','Point C')
%%



