%% FigA1
clear all;
FigA.lname = '\Autocorrelation Coefficient';
FigA.completeName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\Reconstruction_PSD\psd_avg.mat';
FigA.index_t = [2 18];
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigA.mat','FigA');
%% FigB
clear all;
FigB(1).lname = '\Delta t = 0.026 ms';
FigB(1).completeName1 = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_trN_5000.txt';
FigB(1).completeName2 = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_trN_5500.txt';
FigB(2).lname = '\Delta t = 0.45 ms';
FigB(2).completeName1 = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt';
FigB(2).completeName2 = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5500.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigB.mat','FigB');
%% FigBaxes
FigBaxes.xlim = [1 60];
FigBaxes.ylim = [0 1.2];
FigBaxes.pts = 1:1:60;
FigBaxes.xtick1 = 10:10:60;
FigBaxes.ytick1 = 0:0.2:1;
FigBaxes.lcolor = [0, 0, 1; 1, 0, 0];
FigBaxes.pshape1 = 'o-';
FigBaxes.pshape2 = 's-';
%FigBaxes.xlabel1 = 'l'
%FigBaxes.ylabel1 = '\sum_\Omega(\Phi_N . \Phi_N_+_5_0_0)';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigBaxes.mat','FigBaxes');
%% FigC
clear all;
FigC(1).lname = '\Delta t = 0.026 ms';
FigC(1).completeName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_trN_5000.txt';
FigC(2).lname = 'Classical POD for 50 runs';
FigC(2).completeName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_clasN_19300.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigC.mat','FigC');
%% FigCaxes
FigCaxes.xlim = [1 30];
FigCaxes.ylim = [0 1.2];
FigCaxes.pts = 1:1:30;
FigCaxes.xtick1 = 10:10:30;
FigCaxes.ytick1 = 0:0.2:1;
FigCaxes.count = 20;
FigDaxes.xlabel = 'Snapshot POD mode number (\Delta t = 0.026 ms)';
FigDaxes.ylabel = 'Classical POD mode number (averaged for 50 runs)';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigCaxes.mat','FigCaxes');
%% FigD
clear all;
FigD(1).lname = '\Delta t = 0.45 ms';
FigD(1).completeName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt';
FigD(2).lname = 'Classical POD for 50 runs';
FigD(2).completeName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_clasN_19300.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigD.mat','FigD');
%% FigDaxes
FigDaxes.xlim = [1 30];
FigDaxes.ylim = [0 1.2];
FigDaxes.pts = 1:1:30;
FigDaxes.xtick1 = 10:10:30;
FigDaxes.ytick1 = 0:0.2:1;
FigDaxes.count = 20;
FigDaxes.xlabel = 'Snapshot POD mode number (\Delta t = 0.45 ms)';
FigDaxes.ylabel = 'Classical POD mode number (averaged for 50 runs)';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigDaxes.mat','FigDaxes');
%% FigE
FigE.lname = 'Rms velocity measured';
FigE.completeName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\uv_rec_var.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigE.mat','FigE');
%% FigF
FigF.lname = 'Eigenvalue convergence SPOD';
FigF.completeName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\eigval_ensN_5000.txt';
FigF.pts = 1:1:100;
FigF.mpts = [1 10:10:100];
FigF.xtick1 = 20:20:100;
FigF.ytick1 = 0:0.2:1;
FigF.ylim1 = [0 1];
FigF.xlabel1 = 'l';
FigF.ylabel1 = '\eta_c_o_n_v';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigF.mat','FigF');
%% FigG
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
FigG.lname = 'FPOD lambda vs f';
FigG.completeName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_280.txt';
FigG.pts = 2:46;
FigG.xpts = (Fs/N:Fs/N:Fs*45/N)*L/Uinf;
FigG.xlim1 = [0.0441 2];
FigG.ylim1 = [0 0.05];
FigG.xtick1 = 0.5:0.5:2.0;
FigG.ytick1 = 0:0.0125:0.5;
FigG.xlabel1 = 'St_L';
FigG.ylabel1 = '\eta_l_,_f';
FigG.legend1 = {'l=1','l=2','l=3'};
FigG.ross = Ros_freq(Mach,4,L)*L/Uinf;
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigG.mat','FigG');
%% FigH
FigH.lname = 'FPOD lambda vs l';
FigH.completeName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_280.txt';
FigH.findex = [6 16 25];
FigH.pts = 1:50;
FigH.mpts = [1 5:5:50];
FigH.xlim1 = [1 50];
FigH.ylim1 = [0 1];
FigH.xlabel1 = 'l';
FigH.ylabel1 = '\eta_l_,_f';
FigH.legend1 = {'RF 1','RF 2','RF 3'};
FigH.xtick1 = 10:10:50;
FigH.ytick1 = 0:0.2:1;
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigH.mat','FigH');
%% FigI
FigI.lname = 'Spatial POD vs FPOD';
FigI.completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_280.txt';
FigI.completeName2 = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\eigval_lf_N5000.txt';
FigI.pts = 1:150;
FigI.mpts = [1 10:10:150];
FigI.xtick1 = 30:30:150;
FigI.ytick1 = 0:0.1:0.6;
FigI.ylim1 = [0 0.6];
FigI.xlim1 = [1 150];
FigI.legend1 = {'FPOD','SPOD'};
FigI.xlabel1 = 'Modes (l,f)';
FigI.ylabel1 = '\eta';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigI.mat','FigI')
%% FigK
FigK.lname = 'Rms SPOD energy levels';
FigK.completeName1 = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\35PercentEnergy_3\uv_rec_var.txt';
FigK.completeName2 = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\50PercentEnergy_7\uv_rec_var.txt';
FigK.completeName3 = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\75PercentEnergy_31\uv_rec_var.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigK.mat','FigK');
%% FigL
FigL.lname = 'Rms FPOD energy levels';
FigL.completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\DecreasingEnergy\35Energy_37modes\uv_rec_var.txt';
FigL.completeName2 = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\DecreasingEnergy\50Energy_146modes\uv_rec_var.txt';
FigL.completeName3 = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\75PercentEnergy_31\uv_rec_var.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigL.mat','FigL');
%% FigM
FigM.lname = 'Rms FPOD Rossiter modes';
FigM.completeName1 = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\RossiterModes\RossiterMode1\uv_rec_var.txt' ;
FigM.completeName2 = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\RossiterModes\RossiterMode2\uv_rec_var.txt';
FigM.completeName3 = 'Y:\rawdata\Sandia_cavity\SpectralVelocityReconstructions\RossiterModes\RossiterMode3\uv_rec_var.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigM.mat','FigM');
%% FigN
FigN.lname = 'Rms Bandpass RF measured';
FigN.completeName1 = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\RossiterMode1\uv_rec_var.txt';
FigN.completeName2 = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\RossiterMode2\uv_rec_var.txt';
FigN.completeName3 = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\RossiterMode3\uv_rec_var.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigN.mat','FigN');
%% FigT
FigT.lname = 'Gridplot l f';
FigT.completeName = 'Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\eigval_280.txt';
save('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigT.mat','FigT');
%%




