%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
a_psd_avg = zeros(193,7);
a_psd_sum = 0;
%%
for r = 1:Nb
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\a_n20modes\';
fileName = strcat('a_n',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
a_n1 = load(completeName);
a_nf1 = fft(a_n1);
a_nf = a_nf1(1:193,1:7);
a_psd = a_nf.*conj(a_nf);
a_psd_avg = a_psd_avg + a_psd;
end
%%
a_psd1 = a_psd_avg(:,1);
a_psd1_sum = sum(a_psd1);
a_psd2 = a_psd_avg(:,2);
a_psd2_sum = sum(a_psd2);
plot_strouhal(a_psd_avg)
pbaspect([1 1 1])
%%
completeName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_280.txt';
eig1 = load(completeName);
eig2 = eig1(1:3,:);
sum_eig = sum(sum(eig1));
eig2 = eig2/sum_eig;
a_psd_avg = a_psd_avg/sum_eig;
eig2 = eig2';
%%
figure()
plot_strouhal(a_psd_avg);
pbaspect([1 1 1])
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
legend('Mode1','Mode2','Mode3','Mode4','Mode5','Mode6','Mode7')
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
xlabel('St_D','FontSize',34), ylabel('\eta','FontSize',34), xticks(0:5:25), yticks(0:0.2:1);
xticks(0:0.25:0.5), yticks(0:0.025:0.05)
figure()
plot_strouhal(eig2)
pbaspect([1 1 1])
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
legend('Mode1','Mode2','Mode3');
lgd.FontSize = 12;
set(gcf,'Position',[0 0 800 800])
xlabel('St_D','FontSize',34), ylabel('\eta','FontSize',34), xticks(0:5:25), yticks(0:0.2:1);
xticks(0:0.25:0.5), yticks(0:0.025:0.05)
%%
