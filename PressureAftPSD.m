%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Load pressure data
folderName = 'Y:\rawdata\Sandia_cavity\';
fileName = 'PressureData.mat';
completeName = strcat(folderName,fileName);
load(completeName);
%% 
pmean1(:,:) = mean(pressure,2);
pmean2(:,1) = mean(pmean1,2);
pmean3 = mean(pmean2,1);
%%
pressure_psd = zeros(12500,1);
for r = 1:56
    for cyc = 1:5
        pinst(:,1) = pressure(:,cyc,r);
        pfluc = pinst-pmean3;
        p_psd = pwr_sp_dnst(pfluc,200*10^3);
        pressure_psd = pressure_psd + p_psd;
        clearvars p_psd pinst;
    end
end
pressure_psd = pressure_psd/Nb;
%%
pr_psd = pressure_psd/sum(pressure_psd);
ros_mode = Ros_freq(Mach,4,L);
ros_mode = ros_mode*D/Uinf;
f_range = linspace(0,62.5*10^3*D/Uinf,12500);
plot(f_range',pr_psd,'LineWidth',2);
hold on
for i = 1:4
    plot([ros_mode(i,1) ros_mode(i,1)],[10^-5 10^0],'--','LineWidth',2)
    hold on;
end
hold off
pbaspect([1 1 1]);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
xlabel('St_D','FontSize',34), ylabel('PSD (1/Hz)','FontSize',34), xticks(0:0.25:0.5), yticks([10^-4 10^-2 10^0])
lgd = legend('PSD (aft wall pressure)','RF1','RF2','RF3','RF4','Location','NorthEast');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
xlim([f_range(2) 0.5]);
set(gca,'yscale','log');
%%
