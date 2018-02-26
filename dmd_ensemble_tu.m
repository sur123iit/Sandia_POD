%% Ensemble DMD based on Non Sequential Sampling, eqn 17 of Tu et al.
clear all;
%% Load parameters
[L,D,Mach,Uinf,N,Nb] = load_parameters(1);
Fs = 37500;
del_t = 10.2*(10^-3)/386;
%% ensemble dmd data save
for ens_num = 1:280
    %data collection
    folderName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach',num2str(Mach),'\');
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    x = reduce_cols(uv,1,1);
    y = reduce_cols(uv,1,2);
    %dmd application
    [u, dmd_vec, dmd_evals,dmd_emodes] = std_dmd(x,y,N-1);
    mode_frequencies = angle(dmd_evals)*Fs/(2*pi);
    mode_growthrate = log(abs(dmd_evals))/del_t;
    fName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\dmd_ens\Mach',num2str(Mach),'\','ens_num_',int2str(ens_num),'.mat');
    %sort 
    [a_sorted,a_order] = sort(mode_frequencies);
    dmd_eigval = dmd_evals(a_order,1);
    dmd_freq = mode_frequencies(a_order,1);
    dmd_modes(:,:) = dmd_emodes(:,a_order);
    dmd_growth = mode_growthrate(a_order,1);
    %save
    save(fName,'dmd_freq','dmd_growth','dmd_eigval','dmd_modes');
end

%% Plot curves
%DMD spectra
close all;
for ens_num = 1:Nb
fName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\dmd_ens\Mach',num2str(Mach),'\','ens_num_',int2str(ens_num),'.mat');
load(fName);
ydmd = zeros(N-1,1);
for ii = 1:N-1
    ydmd(ii,1) = norm(dmd_modes(:,ii)).*abs(dmd_eigval(ii));
end
ydmd = ydmd./max(ydmd);
plot(dmd_freq,ydmd,'*','Color','b')
xlim([0 18750])
hold on

end
%Eigen Value Circle
%% Average modes
edges = -Fs/2-(Fs/(2*N)):Fs/N:(Fs/2)+(Fs/(2*N));
avg_modes = zeros(6360,N+1);
for ens_num = 1:Nb
    fName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\dmd_ens\Mach',num2str(Mach),'\','ens_num_',int2str(ens_num),'.mat');
    load(fName);   
    sort_num = discretize(dmd_freq,edges);
    for ii = 1:N-1
    avg_modes(:,sort_num(ii,1)) = avg_modes(:,sort_num(ii,1)) + dmd_modes(:,ii);
    end
    clearvars dmd_freq dmd_growth dmd_eigval dmd_modes sort_num;
end
for ii = 1:N+1
    avg_modes(:,ii) = avg_modes(:,ii)/norm(avg_modes(:,ii));
end
%%
avg_modes_reqd = avg_modes(:,194:386);
close all;
index_freq = 15 ;
[x1,y1,Uphi,Vphi] = cont_plot_uv(abs(avg_modes_reqd(:,index_freq)));
contourf(x1/D,y1/D,Uphi',100,'LineStyle','none');
set(gca,'fontsize',15);
xlabel('x/D','FontSize',25), ylabel('y/D','FontSize',25),
colorbar
axis equal
set(gcf,'Position',[0 0 1200 400])
%%
sort_num = discretize(tall_freq,edges);
%
edge
load(fName);
freq_bins = histogram(dmd_freq,386);
histogram(dmd_freq,386);
xlim([0 10^4])
[Y,E] = discretize(dmd_freq,N);
%test. Delete after you've understood
edges = [-1 1 3 5 7 9 11];
data = [0 2 4 6 8 10];
disc_y = discretize(data,edges);
%% Average modes - Alternative Method
edges = -Fs/2-(Fs/(2*N)):Fs/N:(Fs/2)+(Fs/(2*N));
avg_modes = zeros(6360,N+1);
for ens_num = 1:Nb
    fName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\dmd_ens\Mach',num2str(Mach),'\','ens_num_',int2str(ens_num),'.mat');
    load(fName);   
    sort_num = discretize(dmd_freq,edges);
    for ii = 1:N-1
    avg_modes(:,sort_num(ii,1)) = avg_modes(:,sort_num(ii,1)) + (dmd_modes(:,ii).*dmd_eigval(ii,1));
    end
    clearvars dmd_freq dmd_growth dmd_eigval dmd_modes sort_num;
end
for ii = 1:N+1
    avg_modes(:,ii) = avg_modes(:,ii)/norm(avg_modes(:,ii));
end
