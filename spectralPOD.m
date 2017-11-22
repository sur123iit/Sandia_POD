%This program is for Spectral POD
%Requirements: Need to have spect8fluc1..6.mat  files in my local folder
%Inputs are: spect8fluc1...6: 1-5 have 386x5x10 snapshot fluctuation data
%Dimensions of the inputs are: 3180x4x19300
clear all;
load('spect8fluc1.mat');
corr_mat1 = zeros(6360,6360,5);
for i = 1:50
    u(:,:) = fill8ens_fluc(:,3,((i-1)*386)+1:(i*386));
    u_fluc = u';
    clear u;
    u_bar(:,:) = fft(u_fluc);
    clear u_fluc
    u_bar1 = u_bar(1:5,:);
    clear u_bar;
    v(:,:) = fill8ens_fluc(:,4,((i-1)*386)+1:(i*386));
    v_fluc = v';
    clear v;
    v_bar(:,:) = fft(v_fluc);
    clear v_fluc; 
    v_bar1 = v_bar(1:5,:);
     clear v_bar  
     %for f = 1:10
     for f =1:5
        u_bar_temp(:) = u_bar1(f,:);
        v_bar_temp(:) = v_bar1(f,:);
        vel_temp = vertcat(u_bar_temp',v_bar_temp');
        clearvars u_bar_temp v_bar_temp;
        corr_mat1(:,:,f) = corr_mat1(:,:,f) + (conj(vel_temp)*vel_temp');
     end
end
clearvars -except corr_mat1;
save('corr_mat1.mat');
%%
%include a function that checks through Parseval's Theorem
%run this once.
