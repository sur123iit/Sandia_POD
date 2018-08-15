%%
clear all;
%%
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
%% Get matrix whose mean is zero
for r = 1:10
    fileName = strcat('ens_num_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv1 = load(completeName);
    if r == 1
        uv = uv1;
    else
        uv = horzcat (uv,uv1);
    end
end
uvm = mean(uv,2);  
uv = uv - uvm;
%% Save values of x and y
for r = 1:10
    if r == 1
        x = uv(:,(386*(r-1))+1 : (386*r)-1);
        y = uv(:,(386*(r-1))+2 : 386*r);
    else
        x1 = uv(:,(386*(r-1))+1 : (386*r)-1);
        y1 = uv(:,(386*(r-1))+2 : 386*r);
        x = horzcat(x,x1);
        y = horzcat(y,y1);
    end
end
%% Standard DMD
r = 386;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
[ Qx, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd( x,y,r,Fs );
%%
plot(mode_frequencies,1:386,'*');
xlim([0 2*10^4]);
%%
plot(mode_frequencies*D/Uinf,abs(dmd_evals),'*');
xlim([0 0.5])
%%
eig_val = abs(dmd_evals);
[mode_freq,ind_f] = sort(mode_frequencies,'ascend');
%%
dmd_freq = mode_freq(194:386);
eigval = eig_val(ind_f);
plot(mode_freq(193+8:386-1),eigval(193+8:386-1));
%%

%%