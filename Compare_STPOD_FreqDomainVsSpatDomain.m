%%
clear all;
%% Loading flow parameters
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
for ens_num = 1:Nb
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_m = mean(uv,2);
    uv = uv - uv_m;
    qj_bar = fft(uv');
    clear uv;
    qj_bar_t = qj_bar';
    clearvars qj_bar;
    qj_bar_ens(:,:,ens_num) = qj_bar_t(:,1:N/2);
    clearvars qj_bar_t;
end
f = 16;
qj_bar_inst(:,:) = qj_bar_ens(:,f,:);
tic
qj_mat = qj_bar_inst*qj_bar_inst';
[Phi1,eigval] = svd(qj_mat);
eigen_val1 = diag(eigval);
tspat = toc;
tic
qj_mat = qj_bar_inst'*qj_bar_inst;
[eigvec,eigval] = svd(qj_mat);
eigen_val2 = diag(eigval);
Phi2 = qj_bar_inst*eigvec*1/sqrt(eigval);
tspec = toc;
%%
Phi_dot = abs(dot(Phi1(:,1:100),Phi2(:,1:100)));
plot(1:100,Phi_dot)
%%
eig1 = eigen_val1/sum(eigen_val1);
eig2 = eigen_val2/sum(eigen_val1);
plot(1:100,eig2(1:100)),1:100,eig2(1:100))
%%
[x,y,Uphi,Vphi] = cont_plot_uv( imag(Phi2(:,1)) );
contourf(x,y,Vphi');
axis equal
%%
Phi_grid = abs(Phi1(:,1:50)'*Phi2(:,1:50));
