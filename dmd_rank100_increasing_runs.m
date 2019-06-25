%% Application of rank = 100 DMD to small number of runs
clear all;
%% Load Data
[ L,D,Ma,Uinf,Fs,N,Nb ] = load_parameters(1);
%Spectral ensembled data is called
folderName = strcat('Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach',num2str(Ma),'\');
%% Data collection
for ens_num = 51:100
    fileName = strcat('ens_num_',int2str(ens_num),'.txt');
    completeName = strcat(folderName,fileName);
    uv = load(completeName);
    uv_m = mean(uv,2);
    uv = uv - uv_m;
    x1 = uv(:,1:385);
    y1 = uv(:,2:386);
    if ens_num == 1
        x = x1;
        y = y1;
    else
        x = cat(2,x,x1);
        y = cat(2,y,y1);
    end
end

r = 40;
[ ~, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd(x,y,r,Fs);
% Organize positive frequency modes in increasing oreder
[dmd_freq1,dmd_eval1,dmd_mode1] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
dmd_freq = dmd_freq1(21:40,1);
dmd_eval = dmd_eval1(21:40,1);
dmd_mode = dmd_mode1(:,21:40);
saveFolder = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank40\';
saveFile = strcat('freq_',int2str(ens_num),'.txt');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_freq','-ascii');
saveFile = strcat('eigval_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_eval');
saveFile = strcat('Phi_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_mode');

r = 15;
[ ~, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd(x,y,r,Fs);
% Organize positive frequency modes in increasing oreder
[dmd_freq1,dmd_eval1,dmd_mode1] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
dmd_freq = dmd_freq1(8:15,1);
dmd_eval = dmd_eval1(8:15,1);
dmd_mode = dmd_mode1(:,8:15);
saveFolder = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank15\';
saveFile = strcat('freq_',int2str(ens_num),'.txt');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_freq','-ascii');
saveFile = strcat('eigval_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_eval');
saveFile = strcat('Phi_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_mode');

%%
% Rank 50
r = 25;
[ ~, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd(x,y,r,Fs);
% Organize positive frequency modes in increasing oreder
[dmd_freq1,dmd_eval1,dmd_mode1] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
%
%%%%
dmd_freq = dmd_freq1(13:25,1);
dmd_eval = dmd_eval1(13:25,1);
dmd_mode = dmd_mode1(:,13:25);
%%%%
% Save modes
%%%%%
saveFolder = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank50\';
%%%%
saveFile = strcat('freq_',int2str(ens_num),'.txt');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_freq','-ascii');
saveFile = strcat('eigval_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_eval');
saveFile = strcat('Phi_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_mode');
% Rank 100
r = 100;
[ ~, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd(x,y,r,Fs);
% Organize positive frequency modes in increasing oreder
[dmd_freq1,dmd_eval1,dmd_mode1] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
%
%%%%
dmd_freq = dmd_freq1(51:100,1);
dmd_eval = dmd_eval1(51:100,1);
dmd_mode = dmd_mode1(:,51:100);
%%%%
% Save modes
%%%%%
saveFolder = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank100Edited\';
%%%%
saveFile = strcat('freq_',int2str(ens_num),'.txt');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_freq','-ascii');
saveFile = strcat('eigval_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_eval');
saveFile = strcat('Phi_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_mode');

% Apply Rank Reduced DMD With r = 150
r = 150;
[ ~, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd(x,y,r,Fs);
% Organize positive frequency modes in increasing oreder
[dmd_freq1,dmd_eval1,dmd_mode1] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
%
%%%%
dmd_freq = dmd_freq1(76:150,1);
dmd_eval = dmd_eval1(76:150,1);
dmd_mode = dmd_mode1(:,76:150);
%%%%
% Save modes
%%%%%
saveFolder = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank150\';
%%%%
saveFile = strcat('freq_',int2str(ens_num),'.txt');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_freq','-ascii');
saveFile = strcat('eigval_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_eval');
saveFile = strcat('Phi_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_mode');
%%%%
r = 200;
[ ~, dmd_vec, dmd_evals,dmd_modes,mode_frequencies ] = std_dmd(x,y,r,Fs);
% Organize positive frequency modes in increasing oreder
[dmd_freq1,dmd_eval1,dmd_mode1] = sort_dmd(mode_frequencies,dmd_evals,dmd_modes);
%
%%%%
dmd_freq = dmd_freq1(101:200,1);
dmd_eval = dmd_eval1(101:200,1);
dmd_mode = dmd_mode1(:,101:200);
%%%%
% Save modes
%%%%%
saveFolder = 'Y:\rawdata\Sandia_cavity\DMD\Convergence\Rank200\';
%%%%
saveFile = strcat('freq_',int2str(ens_num),'.txt');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_freq','-ascii');
saveFile = strcat('eigval_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_eval');
saveFile = strcat('Phi_',int2str(ens_num),'.mat');
saveComplete = strcat(saveFolder,saveFile);
save(saveComplete,'dmd_mode');
%%