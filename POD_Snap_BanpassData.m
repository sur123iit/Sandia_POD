%% Spatial POD on bandpass filtered data
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%
for ens_num = 1:10
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\RossiterMode2\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv1 = load('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\RossiterMode2\uv_rec_1.txt');
if ens_num  == 1
    uv = uv1(:,2:17:386);
end
uv = horzcat(uv,uv1(:,2:17:386));
end
%%
[eigvec, eigval, PODcoeff, Phi] = POD_Snapshot(uv);
[eigvec1,eigval1,PODcoeff1,Phi1] = POD_Snapshot(uv1);
%%
index_freq = 2;
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(Phi1(:,index_freq)));
Phi_viz = Vphi;
l1 = abs(max(max(Phi_viz))); %Vphi or Uphi
l2 = abs(min(min(Phi_viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l l]);%pick l1 or l2 (larger of the two)
colormap(redblue)
 % depending on location
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
%h = colorbar;
%set(h,'LineWidth',2);
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
axis equal
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off