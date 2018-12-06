%% On sensitivity of eig function
kappa = condeig(Atilde);
%%
for ind_1 = 1:31
    u_rec(ind_1) = dmd_vec(ind_1)*dmd_evals*pinv(dmd_vec)
end
eigvec*eigval*pinv(eigvec);
%%
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Plot eigen value circle
th = 0:.01:pi/2;
plot(cos(th),sin(th),'k--','LineWidth',2);
hold on;
%%
for ens_num = 1:20
completeName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
x = uv(:,1:385);
y = uv(:,2:386);
[Qx, S, V] = svd(x,0);
S1 = diag(S);
S1 = S1/sum(S1);
S2 = 0;
ii = 1;
while S2<0.325
    S2 = S2 + S1(ii,1);
    ii = ii + 1;
end

r = ii;
Qx = Qx(:,1:r);%6360x385 - 6360x385
S = S(1:r,1:r);%385x385 - 100x100
V = V(:,1:r);%385x385 - 385x100
Atilde = Qx' * y * V * pinv(S);% (385x6360)x(6360x385)x(385x385)x(385x385)
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
plot(real(dmd_evals),imag(dmd_evals),'*','LineWidth',2); xlim([0.51 1.1]), ylim([0.01 0.51])
end
%% formatting the graph
    set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
    pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',25), ylabel('Imag(\lambda)','FontSize',25)
    set(gcf,'Position',[0 0 800 800]) 
%%
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Plot eigen value circle
th = 0:.01:pi/2;
plot(cos(th),sin(th),'k--','LineWidth',2);
hold on;
%%
for ens_num = 1:20
completeName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
x = uv(:,1:385);
y = uv(:,2:386);
[Qx, S, V] = svd(x,0);
S1 = diag(S);
S1 = S1/sum(S1);
S2 = 0;
ii = 1;
while S2<0.325
    S2 = S2 + S1(ii,1);
    ii = ii + 1;
end

r = ii;
Qx = Qx(:,1:r);%6360x385 - 6360x385
S = S(1:r,1:r);%385x385 - 100x100
V = V(:,1:r);%385x385 - 385x100
Atilde = Qx' * y * V * pinv(S);% (385x6360)x(6360x385)x(385x385)x(385x385)
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
dmd_eval_abs = abs(dmd_evals);
dmd_eval_max = max(dmd_eval_abs);
count = 1;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
for jj = 1:ii
if (mode_frequencies(jj,1) >2500) && (mode_frequencies(jj,1) < 2800)
    plot(real(dmd_evals(jj)),imag(dmd_evals(jj)),'*','LineWidth',2); xlim([0.51 1.1]), ylim([0.01 0.51])
end
end
%dmd_eval_ind = dmd_evals(dmd_eval_abs == dmd_eval_max);


end
%%
for ens_num = 1:10
completeName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
x = uv(:,1:385);
y = uv(:,2:386);
[Qx, S, V] = svd(x,0);
S1 = diag(S);
S1 = S1/sum(S1);
S2 = 0;
ii = 1;
while S2<0.325
    S2 = S2 + S1(ii,1);
    ii = ii + 1;
end

r = ii;
Qx = Qx(:,1:r);%6360x385 - 6360x385
S = S(1:r,1:r);%385x385 - 100x100
V = V(:,1:r);%385x385 - 385x100
Atilde = Qx' * y * V * pinv(S);% (385x6360)x(6360x385)x(385x385)x(385x385)
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
dmd_eval_abs = abs(dmd_evals);
dmd_eval_max = max(dmd_eval_abs);
count = 1;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
for jj = 1:ii
if abs(dmd_evals(jj,1))>0.95 && mode_frequencies (jj,1)>400
    growthRate = log(dmd_evals(jj,1))*Fs;
plot(imag(growthRate),real(growthRate),'*','LineWidth',2);
hold on;
end
end
%dmd_eval_ind = dmd_evals(dmd_eval_abs == dmd_eval_max);
end
%% Dimensionless growth rate
for ens_num = 1:10
completeName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
uv = load(completeName);
uv_m = mean(uv,2);
uv = uv - uv_m;
x = uv(:,1:385);
y = uv(:,2:386);
[Qx, S, V] = svd(x,0);
S1 = diag(S);
S1 = S1/sum(S1);
S2 = 0;
ii = 1;
while S2<0.325
    S2 = S2 + S1(ii,1);
    ii = ii + 1;
end

r = ii;
Qx = Qx(:,1:r);%6360x385 - 6360x385
S = S(1:r,1:r);%385x385 - 100x100
V = V(:,1:r);%385x385 - 385x100
Atilde = Qx' * y * V * pinv(S);% (385x6360)x(6360x385)x(385x385)x(385x385)
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
dmd_eval_abs = abs(dmd_evals);
dmd_eval_max = max(dmd_eval_abs);
count = 1;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
for jj = 1:ii
if abs(dmd_evals(jj,1))>0.95 && mode_frequencies (jj,1)>400
    growthRate = log(dmd_evals(jj,1))*Fs;
plot(imag(growthRate)*L/(2*pi*Uinf),real(growthRate)*D/Uinf,'*','LineWidth',2);
hold on;
end
end
%dmd_eval_ind = dmd_evals(dmd_eval_abs == dmd_eval_max);
end
%%
xlim([0 5*10^4*L/(2*pi*Uinf)]), ylim([-12000*D/Uinf 2000*D/Uinf])
plot([0 5*10^4*L/(2*pi*Uinf)],[0 0],'--','LineWidth',2,'Color',[0 0 0])
pbaspect([5*10^4*L/(2*pi*Uinf) 14000*D/Uinf 1])
    pbaspect([1 1 1]), xlabel('Imag(GR)','FontSize',35), ylabel('Real(GR)','FontSize',35)
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800]) 
%%
A_rec = dmd_modes*dmd_evals1*pinv(dmd_modes);
Y_rec = A_rec*x;
Y_rec1 = real(Y_rec);
%%
%%
ym = load('Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\vel_mean.txt');
ym1 = ym(:,ens_num);
c_lim_max = 1.2575;
%%
folderName = 'C:\Users\surabhi123iit\Dropbox (UFL)\Spring 2018\Spring 2018 documents\Sandia Work\Fall2018\';
fileName = strcat('Urec_orig_',int2str(ens_num),'.avi');
completeName = strcat(folderName,fileName);
v = VideoWriter(completeName);
v.FrameRate = 2;
open(v);
for k = 1:385
    uv1 = y(:,k);
    UV1 = uv1 + ym1;
    [x1,y1,Uphi,Vphi] = cont_plot_uv(UV1);
    Phi_viz = Uphi/Uinf;
    contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
    caxis([-c_lim_max c_lim_max]);
    colormap(jet(256))
    x2 = x1(2:4:106);
    y2 = y1(2:2:30);
    Uphi2 = Uphi(2:4:106,2:2:30);
    Vphi2 = Vphi(2:4:106,2:2:30);
    hold on;
    q = quiver(x2/D,y2/D,Uphi2',Vphi2');
    q.Color = [0 0 0];
    q.AutoScaleFactor = 1.5;
    q.LineWidth = 1.5;
    set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
    set(gcf,'Position',[0 0 1265 540])
    xlim([-0.2 5.2]), ylim([-1.1 1.1])
    pbaspect([5.4 2.2 1])
    xticks(0:1:5), yticks(-1:1:1)
    line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
    hold off
    F = getframe(gcf);
    writeVideo(v,F);
end
close(v);
%%
