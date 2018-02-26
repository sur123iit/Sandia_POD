%% Calculating the frequencies associated with the DMD of all ensembles
clear all;
%% Load parameters
[ L,D,Mach,Uinf,N,Nb] = load_parameters(1);
Fs = 37500;
%% Extraction 1
edges = -Fs/2-(Fs/(2*N)):Fs/N:(Fs/2)+(Fs/(2*N));
num_array_pdf = zeros(Nb*25,1);
en_array = zeros(Nb*25,1);
for ens_num = 1:Nb
    folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    x = uv(:,1:385);
    y = uv(:,2:386);
    r = 25;
    %Standard DMD
    [u, dmd_vec, dmd_evals, dmd_modes] = std_dmd(x,y,r);
    mode_frequencies = angle(dmd_evals)*37500/(2*pi);
    [a_sorted,a_order] = sort(mode_frequencies);
    new_eigval = dmd_evals(a_order,1);
    en_array((ens_num-1)*25 + 1: ens_num*25,1) = abs(new_eigval);
    dmd_freq = mode_frequencies(a_order,1);
    %new_dmd_modes(:,:) = dmd_modes(:,a_order);
    num_array_pdf ((ens_num-1)*25 + 1: ens_num*25,1) = discretize(dmd_freq,edges);
    clearvars uv x y new_dmd_modes dmd_freq
end
%%
clearvars -except sort_num_array
%{
num_array_pdf = zeros(25*280,1);
for ens_num = 1:Nb
    num_array_pdf ((ens_num-1)*25 + 1: ens_num*25,1) = sort_num_array(:,ens_num);
end
%}
num_fx = zeros(387,1);
for fx = 1:387
    for num_pdf = 1:Nb*25
        if num_array_pdf(num_pdf,1) == fx
            num_fx(fx,1) = num_fx(fx,1) + en_array(num_pdf,1);
        end
    end
end  
%% bar graphs
bar((Fs/N)*(D/Uinf):(Fs/N)*(D/Uinf):(Fs/2)*(D/Uinf),num_fx(195:387,1))
xlabel('St_D')
hold on
f_ros = Ros_freq(0.8,4,127*10^-3);
plot(f_ros*D/Uinf,[20 20 20 20],'*')
f_ros = f_ros*D/Uinf;
plot([f_ros(1,1) f_ros(1,1)],[0 25],'--',[f_ros(2,1) f_ros(2,1)],[0 25],'--',[f_ros(3,1) f_ros(3,1)],[0 25],'--',[f_ros(4,1) f_ros(4,1)],[0 25],'--')
xlim([0 0.5])
pbaspect([1 1 1])
set(gca,'fontsize',15);
xlabel('St_D','FontSize',28),ylabel('N','FontSize',28)
set(gcf,'Position',[0 0 700 700])
