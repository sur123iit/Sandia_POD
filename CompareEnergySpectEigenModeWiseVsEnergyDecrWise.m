clear all;
eig1 = load('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_decrNvsfreq_50Percent.txt');
eig2 = load('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_decrNvsfreq_75Percent.txt');
eigt1 = load('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_280.txt');
eigt2 = eigt1(1:3,:)';
eigt3 = eigt1(1:19,:)';
eig4 = sum(eigt3,2)/sum(sum(eigt1));
eig3 = sum(eigt2,2)/sum(sum(eigt1));
eig5 = horzcat(eig1,eig2,eig3,eig4);
figure()
plot_strouhal(eig5);
legend('50decren','75decren','50spect','75spect');
%%
fileName = 'ens_num_6.txt';
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
completeName = strcat(folderName,fileName);
uv = load(completeName);
uv_bar = fft(uv');
