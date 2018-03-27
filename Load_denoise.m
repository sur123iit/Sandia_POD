%%
clear all;
%%
load('M:\Documents\Downloads\den8ens3.mat');
clearvars -except den8ens_fluc;
%%
vel_fluc1(:,:) = den8ens_fluc(:,3,:);
vel_fluc2(:,:) = den8ens_fluc(:,4,:);
vel_fluc = vertcat(vel_fluc1,vel_fluc2);
clearvars -except vel_fluc
%%
folderName = 'M:\Documents\Downloads\vel_ens\Mach0.8\';
for ens_num = 1:50
    fileName = strcat('ens_num_',int2str(ens_num+50),'.txt');
    completeName = strcat(folderName,fileName);
    uv = vel_fluc(:,(ens_num-1)*386 + 1: ens_num*386);
    save(completeName,'uv','-ascii');
    clearvars uv completeName;
end
%%
