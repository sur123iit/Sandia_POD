%%
clear all;
%%
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\';
%% 
for r = 1:10
    fileName = strcat('ens_num_',int2str(r),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if r == 1
        
    else
    end
    
    x = uv(:,1:385);
    y = uv(:,2:386);
end
%%