%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
%%
m_lim = 3;
Phi = load('Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\Phi_ensN_5000.txt');
Phi1 = Phi(:,m_lim);
%%
for ens_num = 1:Nb
    completeName = strcat('Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
    uv = load(completeName);
    uv_m = mean(uv,2);
    uv = uv - uv_m;
    a_exp = (Phi1'*uv);
    uv2 = Phi1*a_exp;
    folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\Mode3\';
    fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
    completeName1 = strcat(folderName,fileName);
    save(completeName1,'uv2','-ascii');
end
%%
%% Get the variance
%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var = zeros(6360,Nb);
for ens_num = 1:Nb
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\Mode3\';
fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
completeName = strcat(folderName, fileName);
uv = load(completeName);
uv_var1 = var(uv,1,2);
uv_var(:,ens_num) = uv_var1;
end
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uv_var','-ascii');
%%
m_lim = 3;
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
uv_var = zeros(6360,Nb);
for ens_num = 1:Nb
    uv = zeros(6360,386);
    for ii = 1:m_lim
        folderName = strcat('Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\Mode',int2str(ii),'\');fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
        completeName = strcat(folderName, fileName);
        uv1 = load(completeName);
        if ii == 1
            uv = uv1;
        else
            uv = uv + uv1;
        end
    end
uv_var1 = var(uv,1,2);
uv_var(:,ens_num) = uv_var1;
end
folderName = strcat('Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\Mode',int2str(m_lim),'\');fileName = strcat('uv_rec_',int2str(ens_num),'.txt');
fileName = 'uv_rec_var.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uv_var','-ascii');
%%
