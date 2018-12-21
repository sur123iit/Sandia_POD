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

