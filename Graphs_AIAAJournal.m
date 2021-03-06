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
%% FigE
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigE.mat');
FigE

[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
uv = load(FigE.completeName);

%FigE1
hold off;
uv_rec = Var2Rms(uv);
plot_cont_rms(uv_rec,1);

%FigE2
plot_cont_rms(uv_rec,2);


%% FigF: Eigenvalue convergence, Spatial POD
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigF.mat');
eig1 = load(FigF.completeName);
FigF

eig2 = en_cnvr_ary(eig1);
plot(FigF.pts,eig2(FigF.pts),'Color',[0 0 1],'LineWidth',2);
hold on;
plot(FigF.mpts,eig2(FigF.mpts),'o','MarkerEdgeColor',[0 0 1],'MarkerSize',8,'LineWidth',2);
hold off;
format_graph(1);
xticks(FigF.xtick1);
yticks(FigF.ytick1);
xlabel(FigF.xlabel1);
ylabel(FigF.ylabel1);
ylim(FigF.ylim1);
%% FigG
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigG.mat');
eig1 = load(FigG.completeName);
FigG

hold off;
eig2 = eig1/sum(sum(eig1));
plot(FigG.xpts,eig2(1,FigG.pts),'o-','LineWidth',2);
hold on; 
plot(FigG.xpts,eig2(2,FigG.pts),'s-','LineWidth',2);
plot(FigG.xpts,eig2(3,FigG.pts),'o-','LineWidth',2);
format_graph(1);
xlim(FigG.xlim1), ylim(FigG.ylim1);
xticks(FigG.xtick1), yticks(FigG.ytick1);
for ros_ind = 1:4
    plot([FigG.ross(ros_ind) FigG.ross(ros_ind)],FigG.ylim1,'--','Color',[0 0 0],'LineWidth',2)
end
xlabel(FigG.xlabel1,'FontSize',34,'FontWeight','Bold'), ylabel(FigG.ylabel1,'FontSize',34,'FontWeight','Bold')
legend(FigG.legend1)
%% FigH
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigH.mat');
eig1 = load(FigH.completeName);
FigH

hold off;
eig2 = eig1/sum(sum(eig1));
eig3 = en_cnvr_ary(eig2(FigH.pts,FigH.findex(1))/sum(eig2(FigH.pts,FigH.findex(1))));
plot(FigH.pts,eig3,'Color',[0 0 1],'LineWidth',2);
hold on;
eig4 = en_cnvr_ary(eig2(FigH.pts,FigH.findex(2))/sum(eig2(FigH.pts,FigH.findex(2))));
plot(FigH.pts,eig4,'Color',[1 0 0],'LineWidth',2);
eig5 = en_cnvr_ary(eig2(FigH.pts,FigH.findex(3))/sum(eig2(FigH.pts,FigH.findex(3))));
plot(FigH.pts,eig5,'Color',[0 1 0],'LineWidth',2);

plot(FigH.mpts,eig3(FigH.mpts),'o','MarkerEdgeColor',[0 0 1],'MarkerSize',8);
plot(FigH.mpts,eig4(FigH.mpts),'s','MarkerEdgeColor',[1 0 0],'MarkerSize',8);
plot(FigH.mpts,eig5(FigH.mpts),'^','MarkerEdgeColor',[0 1 0],'MarkerSize',8);
xlim(FigH.xlim1), ylim(FigH.ylim1);
format_graph(1);
xticks(FigH.xtick1), yticks(FigH.ytick1);
legend(FigH.legend1,'Location','East');
xlabel(FigH.xlabel1,'FontSize',34,'FontWeight','Bold'), ylabel(FigH.ylabel1,'FontSize',34,'FontWeight','Bold')
%% FigI
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigI.mat');
FigI

eig1 = load(FigI.completeName1);
eig2 = load(FigI.completeName2);
eig2 = eig2';

[eigD1, m_ind1, f_ind1] = DecEn_eigval(eig1);
[eigD2, m_ind2, f_ind2] = DecEn_eigval(eig2);
eigDA = en_cnvr_ary(eigD1);
eigDB = en_cnvr_ary(eigD2);

plot(FigI.pts, eigDA(FigI.pts),'Color',[0 0 1],'LineWidth',2);
hold on;
plot(FigI.pts, eigDB(FigI.pts),'Color',[1 0 0],'LineWidth',2);
plot(FigI.mpts,eigDA(FigI.mpts),'o', 'MarkerEdgeColor',[0 0 1], 'MarkerSize',8);
plot(FigI.mpts,eigDB(FigI.mpts), 's','MarkerEdgeColor',[1 0 0], 'MarkerSize',8);
legend(FigI.legend1)
format_graph(1);
hold off;
xticks(FigI.xtick1), yticks(FigI.ytick1)
xlabel(FigI.xlabel1,'FontSize',34,'FontWeight','Bold') 
ylabel(FigI.ylabel1,'FontSize',34,'FontWeight','Bold')

%% FigK
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigK.mat');
FigK
hold off;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
uv1 = load(FigK.completeName1);
uv2 = load(FigK.completeName2);
uv3 = load(FigK.completeName3);

%FigK11
uv_rec = Var2Rms(uv1);
plot_cont_rms(uv_rec,1);


%FigK12
uv_rec = Var2Rms(uv1);
plot_cont_rms(uv_rec,2);

%FigK21
uv_rec = Var2Rms(uv2);
plot_cont_rms(uv_rec,1);

%FigK22
uv_rec = Var2Rms(uv2);
plot_cont_rms(uv_rec,2);

%FigK31
uv_rec = Var2Rms(uv3);
plot_cont_rms(uv_rec,1);

%FigK32
uv_rec = Var2Rms(uv3);
plot_cont_rms(uv_rec,2);
%% FigL
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigL.mat');
FigL

uv1 = load(FigL.completeName1);
uv2 = load(FigL.completeName2);

uv_rec = Var2Rms(uv1);
plot_cont_rms(uv_rec,1);

plot_cont_rms(uv_rec,2);

uv_rec = Var2Rms(uv2);
plot_cont_rms(uv_rec,1);

plot_cont_rms(uv_rec,2);
%% FigM
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigM.mat');
FigM

uv1 = load(FigM.completeName1);
uv2 = load(FigM.completeName2);
uv3 = load(FigM.completeName3);

%Ross1 U
uv_rec = Var2Rms(uv1);
plot_cont_rms(uv_rec,1);

%Ross1 V
plot_cont_rms(uv_rec,2);

%Ross2 U
uv_rec = Var2Rms(uv2);
plot_cont_rms(uv_rec,1);

%Ross2 V
plot_cont_rms(uv_rec,2);

%Ross3 U
uv_rec = Var2Rms(uv3);
plot_cont_rms(uv_rec,1);

%Ross3 V
plot_cont_rms(uv_rec,2);

%% FigN
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigN.mat');
FigN

uv1 = load(FigN.completeName1);
uv2 = load(FigN.completeName2);
uv3 = load(FigN.completeName3);

%Ross1 U
uv_rec = Var2Rms(uv1);
plot_cont_rms(uv_rec,1);

%Ross1 V
plot_cont_rms(uv_rec,2);

%Ross2 U
uv_rec = Var2Rms(uv2);
plot_cont_rms(uv_rec,1);

%Ross2 V
plot_cont_rms(uv_rec,2);

%Ross3 U
uv_rec = Var2Rms(uv3);
plot_cont_rms(uv_rec,1);

%Ross3 V
plot_cont_rms(uv_rec,2);
%%
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigO.mat');
FigO

uv1 = load(FigO.completeName1);
uv2 = load(FigO.completeName2);
uv3 = load(FigO.completeName3);
uv7 = load(FigO.completeName7);
uv31 = load(FigO.completeName31);
%Mode1 U
uv_rec = Var2Rms(uv1);
plot_cont_rms(uv_rec,1);

%Mode1 V
plot_cont_rms(uv_rec,2);

%Mode2 U
uv_rec = Var2Rms(uv2);
plot_cont_rms(uv_rec,1);

%Mode2 V
plot_cont_rms(uv_rec,2);

%Mode3 U
uv_rec = Var2Rms(uv3);
plot_cont_rms(uv_rec,1);

%Mode3 V
plot_cont_rms(uv_rec,2);

%Mode7 U
uv_rec = Var2Rms(uv7);
plot_cont_rms(uv_rec,1);

%Mode7 V
plot_cont_rms(uv_rec,2);

%Mode31 U
uv_rec = Var2Rms(uv31);
plot_cont_rms(uv_rec,1);

%Mode31 V
plot_cont_rms(uv_rec,2);

%%
%% FigJ
clear all;
load('Y:\rawdata\Sandia_cavity\StructuresToPlot_AIAAJournal\FigJ.mat');
FigJ

uv9 = load(FigJ.completeName9);
uv37 = load(FigJ.completeName37);
uv146 = load(FigJ.completeName146);
uv599 = load(FigJ.completeName599);

% Mode 9 U
uv_rec = Var2Rms(uv9);
plot_cont_rms(uv_rec,1);

% Mode 8 V
plot_cont_rms(uv_rec,2);

% Mode 37 U
uv_rec = Var2Rms(uv37);
plot_cont_rms(uv_rec,1);

% Mode 37 V
plot_cont_rms(uv_rec,2);

% Mode 146 U
uv_rec = Var2Rms(uv146);
plot_cont_rms(uv_rec,1);

% Mode 146 V
plot_cont_rms(uv_rec,2);

% Mode 599 U
uv_rec = Var2Rms(uv599);
plot_cont_rms(uv_rec,1);

% Mode 599 V
plot_cont_rms(uv_rec,2);

%%





