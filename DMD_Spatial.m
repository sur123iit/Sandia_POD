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
uv_t = uv';
x = uv_t(:,1:6359);
y = uv_t(:,2:6360);

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
%discuss what this is
dmd_evals = diag(dmd_evals1);
%make sure the dimensions
dmd_modes = Qx*dmd_vec;
%discuss what this is 
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);

%% Order N of reconstruction operator

N = 3;

%% reconstruction operator (order N)
%Not sure if this is the right operator
A_rec = dmd_modes*(dmd_evals1^N)*pinv(dmd_modes);
Y_rec = A_rec*x;
Y_rec1 = real(Y_rec);

%% reconstruction operator (order 1)

A_rec = dmd_modes*dmd_evals1*pinv(dmd_modes);
Y_rec = A_rec*x;
Y_rec1 = real(Y_rec); % 385 (3-385)
% Instantaneous : 4-386

%% reconstruction operator (order 2)

A_rec = dmd_modes*dmd_evals1*dmd_evals1*pinv(dmd_modes);
Y_rec = A_rec*x(:,1:384);
Y_rec1 = real(Y_rec); %384 (2-384)

%% reconstruction operator (order 3)

A_rec = dmd_modes*dmd_evals1*dmd_evals1*dmd_evals1*pinv(dmd_modes);
Y_rec = A_rec*x(:,1:383);
Y_rec1 = real(Y_rec); % 383 (1-383)

%% mean flow field for reconstruction

folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,ens_num);
c_lim = 1.2575;

%% UV matrix for reconstruction

UV = Y_rec1 + uvm1;

%% Reconstruction psd plot

%% Eigen Value Circle

% Circle
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

%%