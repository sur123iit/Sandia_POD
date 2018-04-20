%%
clear all;
%%
r = 6;
k = 26;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
finput = input('Which reconstruction you want? \n 1: Spatial 2: Spectral 3: Instantaneous');
if finput == 1
    folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\';
    fileName = strcat('uv_rec_',int2str(r),'.txt');
elseif finput == 2
    folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\50percentEnergy_3\';
    fileName = strcat('uv_rec_',int2str(r),'.txt');
else
    folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(r),'.txt');
end
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv1 = uv(:,k);
%uv_min_inst = min(min(uv1));
%uv_lim = abs(uv_min_inst);
%c_lim = uv_lim/Uinf;
[x1,y1,Uphi,Vphi] = cont_plot_uv( uv1 );
Phi_viz = Vphi/Uinf;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-c_lim c_lim]);
colorbar
hold on
q = quiver(x1/D,y1/D,Uphi',Vphi');
q.Color = [0 0 0];
q.AutoScaleFactor = 1.0
hold off
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
colormap(redblue)
%colorbar % depending on location
axis equal
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
%set(gcf,'Position',[0 0 1300 420])
xticks(0:1:5), yticks(-0.5:0.5:0.5)
axis equal;