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