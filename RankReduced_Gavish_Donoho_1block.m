%%
clear all;
%% Load parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
r = N-1;
uv = load('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_5.txt');
x = uv(:,1:385);
y = uv(:,2:386);
[ Qx, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd( x,y,r,Fs );
%% Sort frequencies
[dmd_freq,dmd_eval,dmd_mode] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
plot(dmd_freq,abs(dmd_eval),'*');
xlim([0 2*10^4])
%% Bin frequencies
edges = -Fs/2-(Fs/(2*N)):Fs/N:(Fs/2)+(Fs/(2*N));
abs_eval = abs(dmd_eval);
disc_freq = discretize(dmd_freq,edges);
num_fx = zeros(387,1);
for fx = 1:387
    for num_pdf = 1:109
        if disc_freq(num_pdf,1) == fx
            num_fx(fx,1) = num_fx(fx,1) + abs_eval(num_pdf,1);
        end
    end
end  
abs_eval = abs(dmd_eval);
%%
plot(dmd_freq*D/Uinf,abs_eval,'*');
xlabel('St_D')
hold on
f_ros = Ros_freq(0.8,4,127*10^-3);
f_ros = f_ros*D/Uinf;
plot([f_ros(1,1) f_ros(1,1)],[0 1],'--',[f_ros(2,1) f_ros(2,1)],[0 1],'--',[f_ros(3,1) f_ros(3,1)],[0 1],'--',[f_ros(4,1) f_ros(4,1)],[0 1],'--')
xlim([0 0.5])
pbaspect([1 1 1])
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28),ylabel('N','FontSize',28)
set(gcf,'Position',[0 0 700 700])
%% Plot Bar graph
bar((Fs/N)*(D/Uinf):(Fs/N)*(D/Uinf):(Fs/2)*(D/Uinf),num_fx(195:387,1))
xlabel('St_D')
hold on
f_ros = Ros_freq(0.8,4,127*10^-3);
%plot(f_ros*D/Uinf,[180 180 180 180],'*')
f_ros = f_ros*D/Uinf;
plot([f_ros(1,1) f_ros(1,1)],[0 3],'--',[f_ros(2,1) f_ros(2,1)],[0 3],'--',[f_ros(3,1) f_ros(3,1)],[0 3],'--',[f_ros(4,1) f_ros(4,1)],[0 3],'--')
xlim([0 1.0])
pbaspect([1 1 1])
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28),ylabel('N','FontSize',28)
set(gcf,'Position',[0 0 700 700])
%% Contour plot
index_freq = 63;%Rf 1 233
%index_freq = 147; ;%Rf 2
%index_freq = 159;% 84; %Rf3 158 159
[x1,y1,Uphi,Vphi] = cont_plot_uv(real(dmd_mode(:,index_freq)));
contourf(x1/D,y1/D,Uphi',100,'LineStyle','none');
set(gca,'fontsize',15);
xlabel('x/D','FontSize',25), ylabel('y/D','FontSize',25),
colorbar
axis equal
set(gcf,'Position',[0 0 1200 400])