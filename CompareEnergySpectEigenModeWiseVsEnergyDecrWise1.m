%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\DecrEnSpectralReconstructions\';
fileName = 'uv_rec_4.txt';
completeName = strcat (folderName,fileName);
uv = load(completeName);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\50percentEnergy_3\';
fileName = 'uv_rec_4.txt';
completeName = strcat (folderName,fileName);
uv1 = load(completeName);
%%
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50percentEnergy_7\';
fileName = 'uv_rec_4.txt';
completeName = strcat (folderName,fileName);
uv2 = load(completeName);

%%
[x1,y1,Uphi,Vphi] = cont_plot_uv( uv(:,150));
figure();
contourf(x1/D,y1/D,Uphi',100,'LineStyle','none');
colormap(redblue);
axis equal
%% Plot the grid matrix
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\';
fileName = 'eigval_decrNvsfreq_50Percent.txt';
%% 
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
fileName = 'ens_num_4.txt';
completeName = strcat (folderName,fileName);
uv1 = load(completeName);