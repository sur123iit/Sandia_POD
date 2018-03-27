%applying the autocorrelation function average for a particular time shift
%% Clear everything 
clear all;
%% Loading parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Do it for a particular run
folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\ensemble_POD\Mach',num2str(Mach),'\');
fileName = strcat('vel_fluc.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
%% Iterative process for i = 1 to i = N-1 for Autocorrelation
Rij = zeros(6360,2);
count1 = 0;
count2 = 0;
for ens_num = 1:Nb
    for i = (ens_num-1)*23 + 1 : (ens_num*23)-1
        Rij(:,1) = Rij(:,1) + (uv(:,i).*uv(:,i+1));
        count1 = count1 + 1;
    end
    for i = (ens_num-1)*23 + 1 : ens_num*23
        Rij(:,2) = Rij(:,2) + (uv(:,i).^2);
        count2 = count2 + 1;
    end
end
%%
Rij(:,1) = Rij(:,1)/(22*280);
Rij(:,2) = Rij(:,2)/(23*280);
%%
R = Rij(:,1)./Rij(:,2);
%%
[x1,y1,Uphi,Vphi] = cont_plot_uv(R);
contourf(x1/D,y1/D,Vphi',100,'LineStyle','none');
axis equal;
%colorbar;
caxis([0 1])
set(gca,'FontSize',20,'FontWeight','Bold');
xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
axis equal
set(gcf,'Position',[0 0 1200 420]), %depending on location (400 or 420) 
xticks(0:1:5), yticks(-0.5:0.5:0.5)
%Vphi or Uphi
%%
clearvars vel_mat vel_mean
%this will not be required right now
u_corr_mat = v_fluc*v_fluc';% size: 6360x6360
corr_mat = zeros(N,1);% this will not be mine
N1 = zeros(N,1);
for i = 1:N
    for j = 1:N
        
            if abs(i-j) == k
                corr_mat(k+1,1) = corr_mat(k+1,1) + u_corr_mat(i,j)/(N-k);
                N1(k+1,1) = N1(k+1,1) + 1;
            end      
        
    end
end
corr_mat(1,1) = corr_mat(1,1)*2;
corr_mat = corr_mat/corr_mat(1,1);
%plot(0:10.2/N:10.2-(10.2/N),corr_mat);

%xlim([0 99])
%xlabel('Time lag (ms) ->'), ylabel('Auto-correlation function ->')
%{
if N==300
    subplot(2,2,1)
    plot(0:10.2/386:10.2/10,corr_mat(1:39,1),0:10.2/386:10.2/10,zeros(39,1),'--',[10.2/386 10.2/386],[-0.4 corr_mat(2,1)],'--' )
    xlabel('Time lag (ms) ->'), ylabel('Auto-correlation coefficient ->')
      xlim([0 10.2/10]), ylim([-0.4 1])
    title('300 snapshots');
end
%}
%{
if N==500
    subplot(2,2,2)
    plot(0:10.2/386:10.2/10,corr_mat(1:39,1),0:10.2/386:10.2/10,zeros(39,1),'--',[10.2/386 10.2/386],[-0.4 corr_mat(2,1)],'--' )
    xlabel('Time lag (ms) ->'), ylabel('Auto-correlation coefficient ->')
      xlim([0 10.2/10]), ylim([-0.4 1])
    title('500 snapshots');
end
%}
%{
if N==1000
    subplot(2,2,3)
    plot(0:10.2/386:10.2/10,corr_mat(1:39,1),0:10.2/386:10.2/10,zeros(39,1),'--',[10.2/386 10.2/386],[-0.4 corr_mat(2,1)],'--' )
    xlabel('Time lag (ms) ->'), ylabel('Auto-correlation coefficient ->')
      xlim([0 10.2/10]), ylim([-0.4 1])
    title('1000 snapshots');
end
if N==1500
    subplot(2,2,4)
    plot(0:10.2/386:10.2/10,corr_mat(1:39,1),0:10.2/386:10.2/10,zeros(39,1),'--',[10.2/386 10.2/386],[-0.4 corr_mat(2,1)],'--' )
    xlabel('Time lag (ms) ->'), ylabel('Auto-correlation coefficient ->')
      xlim([0 10.2/10]), ylim([-0.4 1])
    title('1500 snapshots');
end
if N==2000
    subplot(2,2,1)
   plot(0:10.2/300:((1020/N)-10.2/N),corr_mat(1:100,1))
    xlabel('Time lag (ms) ->'), ylabel('Auto-correlation coefficient ->')
end
if N==2500
    subplot(2,2,2)
    plot(0:1:99,corr_mat(1:100,1))
end
if N==3000
    subplot(2,2,3)
    plot(0:1:99,corr_mat(1:100,1))
end
if N==3500
    subplot(2,2,4)
    plot(0:1:99,corr_mat(1:100,1))
end
%}
%end
%%
%plot curves for cont
plot(0:10.2/386:10.2/10,corr_mat1(1:39,1),0:10.2/386:10.2/10,corr_mat2(1:39,1),0:10.2/386:10.2/10,corr_mat3(1:39,1),[10.2/386 10.2/386],[-0.4 corr_mat3(2,1)],'--',0:10.2/386:10.2/10,zeros(39,1),'--',[10.2/386 10.2/386 10.2/386],[corr_mat1(2,1) corr_mat2(2,1) corr_mat3(2,1)],'*',[0 10.2/386],[corr_mat1(2,1) corr_mat1(2,1)],'--',[0 10.2/386],[corr_mat2(2,1) corr_mat2(2,1)],'--',[0 10.2/386],[corr_mat3(2,1) corr_mat3(2,1)],'--')
xlim([0 10.2/10]), ylim([-0.4 1])
xlabel('Time Lag (ms)'), ylabel('Auto-correlation coefficient');
legend('Point A','Point B','Point C');
%%
%plot curves for spac
plot(0:17*10.2/386:17*10.2/10,corr_mat1(1:39,1),0:17*10.2/386:17*10.2/10,corr_mat2(1:39,1),0:17*10.2/386:17*10.2/10,corr_mat3(1:39,1),[17*10.2/386 17*10.2/386],[-0.4 corr_mat3(2,1)],'--',0:17*10.2/386:17*10.2/10,zeros(39,1),'--',[17*10.2/386 17*10.2/386 17*10.2/386],[corr_mat1(2,1) corr_mat2(2,1) corr_mat3(2,1)],'*',[0 17*10.2/386],[corr_mat1(2,1) corr_mat1(2,1)],'--',[0 17*10.2/386],[corr_mat2(2,1) corr_mat2(2,1)],'--',[0 17*10.2/386],[corr_mat3(2,1) corr_mat3(2,1)],'--')
xlim([0 17*10.2/10]), ylim([-0.4 1])
xlabel('Time Lag (ms)'), ylabel('Auto-correlation coefficient');
legend('Point A','Point B','Point C');