%% Eigen Value circle at the input rank value with increasing runs
clear all;
th = 0:.01:pi/2;
plot(cos(th),sin(th),'k--','LineWidth',2);
xticks(0:0.25:1); yticks(0:0.25:1);
hold on;
folderName = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank50\';
for ens_num = 50:50:150
    plotEig = strcat(folderName,'eigval_',int2str(ens_num),'.mat');
    load(plotEig);
   
           plot(real(dmd_eval),imag(dmd_eval),'*','LineWidth',2); xlim([0.51 1.1]), ylim([0.01 0.51])
  
    set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
    pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
    set(gcf,'Position',[0 0 800 800]) 
end
lgd = legend('Unit circle','50 runs','100 runs','150 runs')
lgd.FontSize = 14;
hold off;
%% Equality of modes with increasing runs for the input rank
clear all;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank50\';
for ens_num = 150:150
    plotMode = strcat(folderName,'Phi_',int2str(ens_num),'.mat');
    load(plotMode);
    plotFreq = strcat(folderName,'freq_',int2str(ens_num),'.txt');
    dmd_freq = load(plotFreq);
    dmd_mode1 = dmd_mode;
    clear dmd_mode;
    plotMode = strcat(folderName,'Phi_',int2str(ens_num+10),'.mat');
    load(plotMode);
    dmd_mode2 = dmd_mode;
    dot_mode = abs(dot(dmd_mode1,dmd_mode2,1));
    dot_mode = dot_mode';
    for mode_ind = 1:25
        dot_mode(mode_ind) = dot_mode(mode_ind)/(norm(dmd_mode1(:,mode_ind))*norm(dmd_mode2(:,mode_ind)));
    end
    if ens_num == 90
        plot(dmd_freq*D/Uinf,dot_mode,'o','LineWidth',2);
    elseif ens_num == 100
        plot(dmd_freq*D/Uinf,dot_mode,'s','LineWidth',2);
    else
        plot(dmd_freq*D/Uinf,dot_mode,'^','LineWidth',2);
    end
    hold on;
    set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
    pbaspect([1 1 1]), xlabel('St_D','FontSize',25), ylabel('<\Phi_N_1.\Phi_N_2>/(|\Phi_N_1| |\Phi_N_2|)','FontSize',25)
    set(gcf,'Position',[0 0 800 800])
end
freq_ros = Ros_freq(Ma,4,L);
std_ros = freq_ros*D/Uinf;
plot([std_ros(1) std_ros(1)],[0 1.1],'--',[std_ros(2) std_ros(2)],[0 1.1],'--',[std_ros(3) std_ros(3)],[0 1.1],'--',[std_ros(4) std_ros(4)],[0 1.1],'--','LineWidth',2);
plotEval = strcat(folderName,'eigval_',int2str(ens_num+10),'.mat');
load(plotEval);
%plot(dmd_freq*D/Uinf,abs(dmd_eval),'o-','LineWidth',2);
xlim([0 0.5]), ylim([0 1.1])
xticks(0:0.1:0.5); yticks(0:0.25:1);
lgd = legend('150-160');
lgd.FontSize = 14;
hold off;

%% Contour plot for input rank and runs
clear all;
close all;
%2 6 9: indices
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
ens_num = 150;
folderName = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank100\';
plotMode = strcat(folderName,'Phi_',int2str(ens_num),'.mat');
    load(plotMode);
    %Find this index
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(dmd_mode(:,35)));
l1 = abs(max(max(Vphi))); %Vphi or Uphi
l2 = abs(min(min(Vphi))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l l]);%pick l1 or l2 (larger of the two)
colormap(redblue)
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
colormap(redblue)
%c = colorbar;
%c.LineWidth = 2;
% depending on location
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off

%% Compare Eigen Value Circle (different ranks)
th = 0:.01:pi/2;
plot(cos(th),sin(th),'k--','LineWidth',2);
xticks(0:0.25:1); yticks(0:0.25:1);
hold on;
ens_num = 150;
for rnk_ind = 50:50:100
    folderName = strcat('Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank',int2str(rnk_ind),'\');
    fileName = strcat('eigval_',int2str(ens_num),'.mat');
    completeName = strcat(folderName,fileName);
    load(completeName);
    plot(real(dmd_eval),imag(dmd_eval),'*','LineWidth',2);
    xlim([0.51 1.1]), ylim([0.01 0.51])
end      
    set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
    pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
    set(gcf,'Position',[0 0 800 800]) 
lgd = legend('Unit circle','rank = 50','rank = 100');
lgd.FontSize = 14;
%% PLot log(mui)/del(T) i.e. Growth rate
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
ens_num = 120;
plotEig = strcat('Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank100\eigval_',int2str(ens_num),'.mat');
load(plotEig);
growthRate = log(dmd_eval)*Fs;
plot(imag(growthRate),real(growthRate),'*','LineWidth',2);
hold on;
plot([0 5*10^4],[0 0],'--','LineWidth',2);
    pbaspect([1 1 1]), xlabel('Imag(GR)','FontSize',35), ylabel('Real(GR)','FontSize',35)
    xlim([0 5*10^4]), ylim([-12000 2000])
        set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
    set(gcf,'Position',[0 0 800 800]) 

%% Get dot product with FPOD modes
clear all;
f_ind = 15;
folderName = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank50\';
fileName = 'freq_150.txt';
completeName = strcat(folderName,fileName);
dmd_freq = load(completeName);
fileName = 'Phi_150.mat';
completeName = strcat(folderName,fileName);
load(completeName);
%
load('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\Phi_280.mat');
%
fpod_mode1 = Phi(:,1,15);
    dmd_mode1 = dmd_mode(:,15);
    dot_mode = abs(dot(dmd_mode1,fpod_mode1,1));
    dot_mode = dot_mode';
    
    for mode_ind = 1:25
        dot_mode(mode_ind) = dot_mode(mode_ind)/(norm(dmd_mode1(:,mode_ind))*norm(fpod_mode1(:,mode_ind)));
    end
%
fpod_mode  = Phi(:,1,15);
dot_mode = dot(dmd_mode(:,15),fpod_mode));
 dot_mode = dot(dmd_mode(:,15),fpod_mode));                                        
dot_mode = dot(dmd_mode(:,15),fpod_mode);
dot_mode_abs = abs(dot_mode);
dot_mode_abs = dot_mode_abs/norm(dmd_mode(:,15));
norm(dmd_mode(:,15));
dot_mode_abs = dot_mode_abs/norm(fpod_mode);
































































































































































fpod_mode  = Phi(:,1,15);
