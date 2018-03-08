%%
clear all;
%% Data collection
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
del_t = 10.2*(10^-3)/386;
%% Ensemble DMD
edges = -Fs/2-(Fs/(2*N)):Fs/N:(Fs/2)+(Fs/(2*N));
r = input('Define a rank here');
num_array_pdf = zeros(Nb*r,1);
en_array = zeros(Nb*r,1);
for ens_num = 1:280
    %data pair extraction
    folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    x = uv(:,1:385);
    y = uv(:,2:386);
    %Standard DMD
    [u, dmd_vec, dmd_evals, dmd_modes,mode_frequencies] = std_dmd(x,y,r,Fs);
    %sorting
    [dmd_freq,new_eigval,~] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
    %modify
    en_array((ens_num-1)*r + 1: ens_num*r,1) = abs(new_eigval);
    num_array_pdf ((ens_num-1)*r + 1: ens_num*r,1) = discretize(dmd_freq,edges);
    clearvars uv x y new_dmd_modes dmd_freq
end
%% 
num_fx = zeros(387,1);
for fx = 1:387
    for num_pdf = 1:Nb*r
        if num_array_pdf(num_pdf,1) == fx
            num_fx(fx,1) = num_fx(fx,1) + en_array(num_pdf,1);
        end
    end
end  
%% bar graphs
close all;
num_fx_1  =num_fx/sum(num_fx);
bar((Fs/N)*(D/Uinf):(Fs/N)*(D/Uinf):(Fs/2)*(D/Uinf),num_fx(195:387,1))
xlabel('St_D')
hold on
f_ros = Ros_freq(0.8,4,127*10^-3);
plot(f_ros*D/Uinf,[300 300 300 300],'*')
f_ros = f_ros*D/Uinf;
plot([f_ros(1,1) f_ros(1,1)],[0 350],'--',[f_ros(2,1) f_ros(2,1)],[0 350],'--',[f_ros(3,1) f_ros(3,1)],[0 350],'--',[f_ros(4,1) f_ros(4,1)],[0 350],'--')
xlim([0 0.5])
pbaspect([1 1 1])
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28),ylabel('N','FontSize',28)
set(gcf,'Position',[0 0 700 700])


