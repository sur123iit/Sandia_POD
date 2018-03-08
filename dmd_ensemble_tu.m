%%
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
tic
for ens_num = 51:60
    folderName = 'C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\';
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    x = uv(:,1:385);
    y = uv(:,2:386);
    if ens_num == 1
        X = x;
        Y = y;
    else
         X = cat(2,X,x);
         Y = cat(2,Y,y);
    end   
end
loop1 = toc
%%
tic
r = 100;
[u, dmd_vec, dmd_evals, dmd_modes,mode_frequencies] = std_dmd(X,Y,r,Fs);
[dmd_freq,dmd_eval,dmd_mode] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
loop2 = toc
%% Plot eigen value circle
real_evals = real(dmd_eval);
imag_evals = imag(dmd_eval);
plot(real_evals,imag_evals,'.'); xlim([-1.1 1.1]), ylim([-1.1 1.1])
set(gca,'fontsize',15);
pbaspect([1 1 1]), xlabel('Real(\lambda)','FontSize',28), ylabel('Imag(\lambda)','FontSize',28)
set(gcf,'Position',[0 0 800 800])
hold on;
th = [0:.01:2*pi 0.01];
plot(cos(th),sin(th),'k--');
xticks(-1:0.25:1); yticks(-1:0.25:1);
%%
close all;
plot(dmd_freq,abs(dmd_eval),'*');
xlim([0 20000])
%%
edges = -Fs/2-(Fs/(2*N)):Fs/N:(Fs/2)+(Fs/(2*N));
disc_freq = discretize(dmd_freq,edges);
num_fx = zeros(387,1);
for fx = 1:387
    for num_pdf = 1:r
        if disc_freq(num_pdf,1) == fx
            num_fx(fx,1) = num_fx(fx,1) + abs_eval(num_pdf,1);
        end
    end
end  
abs_eval = abs(dmd_eval);

%%
close all;
for ii = 1:100
    abs_eval(ii,1) = abs(dmd_eval(ii,1))*norm(dmd_mode(:,ii));
end
%%
%abs_eval = abs(dmd_eval)*norm(dmd_mode);
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
%%



    
    
    
    
    