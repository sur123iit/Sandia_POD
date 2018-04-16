%% this program is to save mean velocity fields
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
%%
ens_num = 0;
%%
for r = 63:69
    for c = 1:5
        folderPath = strcat('Z:\Data\PulsePIV_2015\pbl_cavity15_export\denoise_run=00',int2str(r),'_Cycle=0000',int2str(c),'\');
        files = dir(folderPath);
        fileIndex = find(~[files.isdir]);
        for n = 1:length(fileIndex)
            fileName = files(fileIndex(n)).name;
            complete_name = strcat(folderPath, fileName);
            a = importdata(complete_name);
            b = a.data;
            uvmat(:,n) = vertcat(b(:,3),b(:,4));
        end
        ens_num = ens_num + 1;
        uvmean(:,ens_num) = mean(uvmat,2);
    end
end
%%
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = 'vel_mean.txt';
completeName = strcat(folderName,fileName);
save(completeName,'uvmean','-ascii');