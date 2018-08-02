%% DMD applied to block ens
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%% Saving the modal shapes
for ens_num = 1:3
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uvm = mean(uv,2);
uv = uv - uvm;
x = uv(:,1:385);
y = uv(:,2:386);
r = 385;
[ Qx, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd( x,y,r,Fs );
[mode_freq, index_freq] = sort(mode_frequencies,'ascend');
eig_val = abs(dmd_evals);
eigval = eig_val(index_freq);
plot(mode_freq,eigval);
xlim([0 2*10^4])
dmd_mode = dmd_modes(:,index_freq);
option = 1;
folderName = 'Y:\rawdata\Sandia_cavity\DMD\DMDModesRunWise\';
for k = 193:385
    cont_plot_POD(real(dmd_mode(:,k)),option);  
    if option == 1
        fileName = strcat(int2str(ens_num),'U',num2str(mode_freq(k)),'.png');
    else
        fileName = strcat(int2str(ens_num),'V',num2str(mode_freq(k)),'.png');
    end
    completeName = strcat(folderName,fileName);
    saveas(gcf,completeName);
end
option = 2;
folderName = 'Y:\rawdata\Sandia_cavity\DMD\DMDModesRunWise\';
for k = 193:385
    cont_plot_POD(real(dmd_mode(:,k)),option);  
    if option == 1
        fileName = strcat(int2str(ens_num),'U',num2str(mode_freq(k)),'.png');
    else
        fileName = strcat(int2str(ens_num),'V',num2str(mode_freq(k)),'.png');
    end
    completeName = strcat(folderName,fileName);
    saveas(gcf,completeName);
end
end
%% Saving the modal shapes
for ens_num = 1:3
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uvm = mean(uv,2);
uv = uv - uvm;
uv_bar = fft(uv');
option = 2;
folderName = 'Y:\rawdata\Sandia_cavity\DMD\DFTModesRunWise\';
freq_ind = linspace(0,Fs/2,194);
for k = 2:194
    cont_plot_POD(real((uv_bar(k,:))'),option);  
    if option == 1
        fileName = strcat(int2str(ens_num),'U',num2str(freq_ind(k)),'.png');
    else
        fileName = strcat(int2str(ens_num),'V',num2str(freq_ind(k)),'.png');
    end
    completeName = strcat(folderName,fileName);
    saveas(gcf,completeName);
end
option = 1;
folderName = 'Y:\rawdata\Sandia_cavity\DMD\DFTModesRunWise\';
freq_ind = linspace(0,Fs/2,194);
for k = 2:194
    cont_plot_POD(real((uv_bar(k,:))'),option);  
    if option == 1
        fileName = strcat(int2str(ens_num),'U',num2str(freq_ind(k)),'.png');
    else
        fileName = strcat(int2str(ens_num),'V',num2str(freq_ind(k)),'.png');
    end
    completeName = strcat(folderName,fileName);
    saveas(gcf,completeName);
end
end
%% Comparing PSD plots for a point on the flow (NOT GIVING DESIRED RESULTS!)
psd2 = zeros(193,1);
psd1 = zeros(193,1);
for ens_num = 1:20
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
uvm = mean(uv,2);
uv = uv - uvm;
uv_bar = fft(uv');
x = uv(:,1:385);
y = uv(:,2:386);
r = 385;
[ Qx, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd( x,y,r,Fs );
[mode_freq, index_freq] = sort(mode_frequencies,'ascend');
eig_val = abs(dmd_evals);
eigval = eig_val(index_freq);
dmd_mode = dmd_modes(:,index_freq);
uv1(:,1) = eigval(193:385).*conj((dmd_mode(1250,193:385))');
uv2(:,1) = uv_bar(2:194,1250);
psdt1 = conj(uv1).*uv1;
psd1 = psd1 + psdt1;
psdt2 = conj(uv2).*uv2;
psd2 = psd2 + psdt2;
end
psd1 = psd1/sum(psd1);
psd2 = psd2/sum(psd2);
psd_draw = horzcat(psd1,psd2);
plot_strouhal(psd_draw);
plot_strouhal(psd1);
%% Construct the DFT exponential matrix

