%% PSD DMD 32.5 % energy
%% Initialize parameters

clear all;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);

%% Initialize variables

% ens_num stores the ensemble number (out of 280)
% en_frac stores the energy fraction

ens_num = 6;
en_frac = 0.325;

%% Get x and y matrices
psd_fin = zeros(193,6360);
%%
tic
for ens_num = 141:280
completeName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
x = uv(:,1:385);
y = uv(:,2:386);

% Apply reduced rank DMD to get all parameters out
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

% Reconstruction operator (order N)

N = 1;
A_rec = dmd_modes*(dmd_evals1^N)*pinv(dmd_modes);
Y_rec = A_rec*x;
Y_rec1 = real(Y_rec);
uv_rec = Y_rec1;

%

[N1,N2] = size(uv_rec);
uv_f = fft(uv_rec'); %NxM
psd_uv = conj(uv_f).*uv_f; %NxM
psd_uv = 2*psd_uv; %NxM
psd_uv = psd_uv/(N2*Fs); %N
osd_uv(:,:) = psd_uv(1:193,:); %193xM
psd_fin = psd_fin + osd_uv;
end
toc

%%

[x1,y1,Uphi,Vphi] = cont_plot_uv((psd_fin(25,:))');
l1 = abs(max(max(Vphi))); %Vphi or Uphi
 %Vphi or Uphi
l = l1;
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none'); %Vphi or Uphi
caxis([0 l]);%pick l1 or l2 (larger of the two)

 % depending on location
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
h = colorbar;
set(h,'LineWidth',2);
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
axis equal
%set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
hold off

%%

psd_fin_inst = psd_fin(:,3180+1555);
plot(2:50,psd_fin_inst(2:50));

%%

psd_fin = psd_fin/280;
save('Y:\rawdata\Sandia_cavity\DMD\Reconstructions_OneBlock\Energy325\psd_avg.mat','psd_fin');
