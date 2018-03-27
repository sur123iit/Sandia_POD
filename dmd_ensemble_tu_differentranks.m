%%
clear all;
%%
load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\EODMar1_ens60_tu_xy.mat');
%% svd for 40 blocks
tic
[Qx, S, V] = svd(X,0);
toc
%% svd for 50 blocks
tic
[Qx, S, V] = svd(X,0);
toc
%% Loading flow parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Rank = 19250
clearvars -except Qx S V X Y
r = 19250;
Qx1 = Qx(:,1:r); %calculate it from the Ensemble POD vs Time Resoved POD
S1 = S(1:r,1:r);
V1 = V(:,1:r);
Atilde = Qx1' * Y * V1 * pinv(S1);
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
%% Rank = 385
clearvars -except Qx S V X Y Fs D L Uinf
r = 385;
Qx1 = Qx(:,1:r);
S1 = S(1:r,1:r);
V1 = V(:,1:r);
Atilde = Qx1' * Y(:,1:15400) * V1 * pinv(S1);
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx1*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
%% Rank = 200
clearvars -except Qx S V X Y Fs D L Uinf N
r = 200;
Qx1 = Qx(:,1:r);
S1 = S(1:r,1:r);
V1 = V(:,1:r);
Atilde = Qx1' * Y(:,1:15400) * V1 * pinv(S1);
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx1*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
%% Rank = 300
clearvars -except Qx S V X Y Fs D L Uinf N
r = 300;
Qx1 = Qx(:,1:r);
S1 = S(1:r,1:r);
V1 = V(:,1:r);
Atilde = Qx1' * Y * V1 * pinv(S1);
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx1*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
%% Rank = 100
clearvars -except Qx S V X Y Fs D L Uinf N
r = 100;
Qx1 = Qx(:,1:r);
S1 = S(1:r,1:r);
V1 = V(:,1:r);
Atilde = Qx1' * Y * V1 * pinv(S1);
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx1*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
%% Rank = 50;
clearvars -except Qx S V X Y Fs D L Uinf N
r = 50;
Qx1 = Qx(:,1:r);
S1 = S(1:r,1:r);
V1 = V(:,1:r);
Atilde = Qx1' * Y(:,1:15400) * V1 * pinv(S1);
[dmd_vec,dmd_evals1] = eig(Atilde);
dmd_evals = diag(dmd_evals1);
dmd_modes = Qx1*dmd_vec;
mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
%% DMD Spectrum
close all;
for ii = 1:r
    ydmd(ii,1) = abs(dmd_evals(ii,1))*norm(dmd_modes(:,ii));
end
plot(mode_frequencies*D/Uinf,ydmd,'*');
ylim([0 1])
xlim([0 2])
pbaspect([1 1 1]);
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28),ylabel('\lambda^m |\phi|','FontSize',28)
set(gcf,'Position',[0 0 700 700])
%% Sort the frequencies
[dmd_freq,dmd_eval,dmd_mode] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
%% Binning
N = 386;
edges = -Fs/2-(Fs/(2*N)):Fs/N:(Fs/2)+(Fs/(2*N));
disc_freq = discretize(dmd_freq,edges);
num_fx = zeros(387,1);
abs_eval = abs(dmd_eval);
for fx = 1:387
    for num_pdf = 1:r
        if disc_freq(num_pdf,1) == fx
            num_fx(fx,1) = num_fx(fx,1) + abs_eval(num_pdf,1);
        end
    end
end  

%% Plot bar graph
close all;
bar((Fs/N)*(D/Uinf):(Fs/N)*(D/Uinf):(Fs/2)*(D/Uinf),num_fx(195:387,1))
xlabel('St_D')
hold on
f_ros = Ros_freq(0.8,4,127*10^-3);
f_ros = f_ros*D/Uinf;
ymax = 8;
plot([f_ros(1,1) f_ros(1,1)],[0 ymax],'--',[f_ros(2,1) f_ros(2,1)],[0 ymax],'--',[f_ros(3,1) f_ros(3,1)],[0 ymax],'--',[f_ros(4,1) f_ros(4,1)],[0 ymax],'--')
xlim([0 0.5])
pbaspect([1 1 1])
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28),ylabel('N','FontSize',28)
set(gcf,'Position',[0 0 700 700])
%%
index_freq = 67;%Rf 1 233
%index_freq = 147; ;%Rf 2
%index_freq = 159;% 84; %Rf3 158 159
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(dmd_mode(:,index_freq)));
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none');
set(gca,'fontsize',20,'FontWeight','Bold');
xlabel('x/D','FontSize',40), ylabel('y/D','FontSize',40),
colormap(redblue)
l1 = abs(max(max(Vphi))); %Vphi or Uphi
l2 = abs(min(min(Vphi))); %Vphi or Uphi
%contourf(x1/D,y1/D,Uphi',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l2 l2]);%pick l1 or l2 (larger of the two)
axis equal
set(gcf,'Position',[0 0 1200 420])
xticks(0:1:5), yticks(-0.5:0.5:0.5)