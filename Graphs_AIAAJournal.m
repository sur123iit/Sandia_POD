%% FigA
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigA.mat');
load(FigA.completeName);
Rx_t = ifft_onesided(psd_fin);
Rx = Rx_t';
rx = Rx(:,FigA.index_t)./Rx(:,1);
index_plot = 1;
[x1,y1,Uphi,Vphi] = cont_plot_uv(rx(:,index_plot));
Phi_viz = Vphi;
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
format_graph(2);
caxis([0 1])   
%% FigB
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigB.mat');
%time resolved
index1 = 1;
Phit1 = load(FigB(index1).completeName1);
Phit2 = load(FigB(index1).completeName2);
dot_Phit = abs(dot(Phit1,Phit2));
%ensemble
index1 = 2;
Phie1 = load(FigB(index1).completeName1);
Phie2 = load(FigB(index1).completeName2);
dot_Phie = abs(dot(Phie1,Phie2));
%plot
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigBaxes.mat');
plot(FigBaxes.pts,dot_Phit(FigBaxes.pts),FigBaxes.pshape1,FigBaxes.pts,dot_Phie(FigBaxes.pts),FigBaxes.pshape2,'LineWidth',2);
lgd = legend(FigB(1).lname,FigB(2).lname);
format_graph(1);
xticks(FigBaxes.xtick1);
yticks(FigBaxes.ytick1);
xlim(FigBaxes.xlim), ylim(FigBaxes.ylim);
%% FigC
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigC.mat');

%arrange data to plot
Phi1 = load(FigC(1).completeName);
Phi2 = load(FigC(2).completeName);
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigCaxes.mat');
Phi_mat = abs((Phi1(:,FigCaxes.pts))'*Phi2(:,FigCaxes.pts)./norm(Phi2(:,FigCaxes.pts)));%snXcl

%plot

image(flipud(Phi_mat')*FigCaxes.count); %xaxis is Phi1
c = colormap(blackwhite(FigCaxes.count));
caxis([0 FigCaxes.count])
format_graph(1);
xticks(FigCaxes.xtick1);
yticks(FigCaxes.xtick1);
xlim(FigCaxes.xlim), ylim(FigCaxes.xlim);
%% FigD

clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigD.mat');

%arrange data to plot
Phi1 = load(FigD(1).completeName);
Phi2 = load(FigD(2).completeName);
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigDaxes.mat');
Phi_mat = abs((Phi1(:,FigDaxes.pts))'*Phi2(:,FigDaxes.pts)./norm(Phi2(:,FigDaxes.pts)));

%plot
image(flipud(Phi_mat')*FigDaxes.count); %xaxis is Phi1
c = colormap(blackwhite(FigDaxes.count));
caxis([0 FigDaxes.count])
format_graph(1);
xticks(FigDaxes.xtick1);
yticks(FigDaxes.xtick1);
xlim(FigDaxes.xlim), ylim(FigDaxes.xlim);
%% FigE
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigE.mat');
uv_var = load(FigE.completeName);
uv_rms = Var2Rms(uv_var);
[x1,y1,Uphi,Vphi] = cont_plot_uv(uv_rms);
index_uv = 2;
if index_uv == 1
    Phi_viz = Uphi/Uinf;
else
    Phi_viz = Vphi/Uinf;
end
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
format_graph(2);
caxis(FigE.clim(index_uv,:));
colormap(jet(256))



