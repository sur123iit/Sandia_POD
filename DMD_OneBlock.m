%% Initialize parameters

clear all;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);

%% Initialize variables

% ens_num stores the ensemble number (out of 280)
% en_frac stores the energy fraction

ens_num = 6;
en_frac = 0.325;

%% Get x and y matrices

completeName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
x = uv(:,1:385);
y = uv(:,2:386);

%% Apply reduced rank DMD to get all parameters out
% r stores the rank for en_frac

[Qx, S, V] = svd(x,0);
S1 = diag(S);
S1 = S1/sum(S1);
S2 = 0;
ii = 1;
while S2<en_frac
    S2 = S2 + S1(ii,1);
    ii = ii + 1;
end
r = ii;
Qx = Qx(:,1:r);%6360x385 - 6360x385
S = S(1:r,1:r);%385x385 - 100x100
V = V(:,1:r);%385x385 - 385x100
Atilde = Qx' * y * V * pinv(S);% (385x6360)x(6360x385)x(385x385)x(385x385)
[dmd_vec,dmd_evals1] = eig(Atilde);

%dmd_evals stores eigen values 
%dmd_evals1 is the eigen value matrix
%dmd_modes stores eigen vectors
%mode_frequencies stores frequencies

dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);

%% Reconstruction operator (order N)

N = 7;
A_rec = dmd_modes*(dmd_evals1^N)*pinv(dmd_modes);
Y_rec = A_rec*x;
Y_rec1 = real(Y_rec);

% UV matrix for reconstruction

folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,ens_num);
c_lim = 1.2575;
UV = Y_rec1 + uvm1;

%% Eigen Vector

index_freq = 9;
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(dmd_modes(:,index_freq)));
l1 = abs(max(max(Uphi))); %Vphi or Uphi
l2 = abs(min(min(Uphi))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Uphi',100,'LineStyle','none'); %Vphi or Uphi
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

%% Eigen Value Circle

th = 0:.01:pi/2;
plot(cos(th),sin(th),'k--','LineWidth',2);
hold on;

% Eigen Value plot on top of it
plot(real(dmd_evals),imag(dmd_evals),'*','LineWidth',2); xlim([0.51 1.1]), ylim([0.01 0.51])

%% formatting the graph

set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
set(gcf,'Position',[0 0 800 800]) 
    
%% Growth Rate

growthRate = log(dmd_evals)*Fs;
% Non dimensionalize
GRi = imag(growthRate)*L/(2*pi*Uinf); %strouhal number
GRr = real(growthRate)*D/Uinf; %growth or decay rate
plot(GRi,GRr,'*','LineWidth',2);

%% Format this graph

xlim([0 5*10^4*L/(2*pi*Uinf)]), ylim([-12000*D/Uinf 2000*D/Uinf])
hold on;
plot([0 5*10^4*L/(2*pi*Uinf)],[0 0],'--','LineWidth',2,'Color',[0 0 0])
pbaspect([5*10^4*L/(2*pi*Uinf) 14000*D/Uinf 1])
pbaspect([1 1 1]), xlabel('GR_i','FontSize',35), ylabel('GR_r','FontSize',35)
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800]) 

%% Velocity fluctuation for Rx calculation

uv20 = uv_n20(:,1:366);
uv15 = uv_n15(:,6:371);
uv10 = uv_n10(:,11:376);
uv5 = uv_n5(:,16:381);
uv1 = uv_n1(:,20:385);
uv0 = y(:,20:385);

%% Compare correlation coefficient with N = 1 (Rx)

usq_coeff5 = (uv1.*uv5);
u_den = (uv1.^2);
ucoeff5 = mean(usq_coeff5,2)./mean(u_den,2);
usq_coeff10 = (uv1.*uv10);
ucoeff10 = mean(usq_coeff10,2)./mean(u_den,2);
usq_coeff15 = (uv1.*uv15);
ucoeff15 = mean(usq_coeff15,2)./mean(u_den,2);
usq_coeff20 = (uv1.*uv20);
ucoeff20 = mean(usq_coeff20,2)./mean(u_den,2);

%% Rx contour plot

[x1,y1,Uphi,Vphi] = cont_plot_uv(ucoeff20);
l1 = abs(max(max(Uphi))); %Vphi or Uphi
l2 = abs(min(min(Uphi))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Uphi',100,'LineStyle','none'); %Vphi or Uphi
caxis([0 1]);%pick l1 or l2 (larger of the two)
%colormap(redblue)
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

%% Velocity fluctuation for Rx calculation

uv20 = uv_n20(:,1:366);
uv15 = uv_n15(:,6:371);
uv10 = uv_n10(:,11:376);
uv5 = uv_n5(:,16:381);
uv1 = uv_n1(:,20:385);
uv0 = y(:,20:385);

%%

usq_coeff1 = (uv0.*uv1);
u_den = (uv0.^2);
ucoeff1 = mean(usq_coeff1,2)./mean(u_den,2);
usq_coeff5 = (uv0.*uv5);
ucoeff5 = mean(usq_coeff5,2)./mean(u_den,2);
usq_coeff10 = (uv0.*uv10);
ucoeff10 = mean(usq_coeff10,2)./mean(u_den,2);
usq_coeff15 = (uv0.*uv15);
ucoeff15 = mean(usq_coeff15,2)./mean(u_den,2);
usq_coeff20 = (uv0.*uv20);
ucoeff20 = mean(usq_coeff20,2)./mean(u_den,2);

%% Rx contour plot

[x1,y1,Uphi,Vphi] = cont_plot_uv(ucoeff20);
l1 = abs(max(max(Uphi))); %Vphi or Uphi
l2 = abs(min(min(Uphi))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Uphi',100,'LineStyle','none'); %Vphi or Uphi
caxis([0 1]);%pick l1 or l2 (larger of the two)
%colormap(redblue)
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

%% Velocity fluctuation for Rx calculation

uv3 = uv_n3(:,1:383); %4-386
uv2 = uv_n2(:,2:384); %3-386
uv1 = uv_n1(:,4:385); %2-386
uv0 = y(:,4:385); %2-386
uv4 = uv_n4(:,1:382);
%
uv1 = uv_n1(:,6:385);
uv6 = uv_n6(:,1:380);
%
uv1 = uv_n1(:,7:385);
uv7 = uv_n7(:,1:379);
%% Rx compared with measured velocity fluctuation

usq_coeff1 = (uv0.*uv1);
u_den = (uv0.^2);
ucoeff1 = mean(usq_coeff1,2)./mean(u_den,2);
usq_coeff2 = (uv0.*uv2);
ucoeff2 = mean(usq_coeff2,2)./mean(u_den,2);
usq_coeff3 = (uv0.*uv3);
ucoeff3 = mean(usq_coeff3,2)./mean(u_den,2);

%%

u_den = (uv1.^2);
usq_coeff2 = (uv1.*uv2);
ucoeff2 = mean(usq_coeff2,2)./mean(u_den,2);
usq_coeff3 = (uv1.*uv3);
ucoeff3 = mean(usq_coeff3,2)./mean(u_den,2);
usq_coeff4 = (uv1.*uv4);
ucoeff4 = mean(usq_coeff4,2)./mean(u_den,2);
usq_coeff6 = (uv1.*uv6);
ucoeff6 = mean(usq_coeff6,2)./mean(u_den,2);
usq_coeff7 = (uv1.*uv7);
ucoeff7 = mean(usq_coeff7,2)./mean(u_den,2);
%% Rx contour plot

[x1,y1,Uphi,Vphi] = cont_plot_uv(ucoeff7);
Phi_viz = Vphi;
l1 = abs(max(max(Phi_viz))); %Vphi or Uphi
l2 = abs(min(min(Phi_viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([0 1]);%pick l1 or l2 (larger of the two)
%colormap(redblue)
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

%%



%%


