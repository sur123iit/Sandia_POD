%This code is to calculate the eigval values of various frequencies
%Expand it for all the ensemble values i.e. 280
%Check if fft is applied properly. You can use cat to join data and check
%with respect to that
%Check what factor needs to be multiplied to ffts
%Read documentation on fft routine in MATLAB
clear all;
Nf = 386;
n = Nf/2;
Nb = 280; %hardcoded
qj_bar_ens = zeros(6360,n,Nb);
%change this address everytime you are in a local machine
load('\\citrixvdi.osg.ufl.edu\citrix-student$\UserData\surabhi123iit\Documents\Downloads\spect8_1.mat');
for i = 1:100
    u_fluc_inst(:,:) = spect8fluc(:,3,((386*(i-1))+1):(386*i));
    v_fluc_inst(:,:) = spect8fluc(:,4,((386*(i-1))+1):(386*i));
    qj = vertcat(u_fluc_inst,v_fluc_inst);
    clearvars u_fluc_inst v_fluc_inst;
    qj_bar = fft(qj');
    clear qj;
    qj_bar_t = qj_bar';-
    clearvars qj_bar;
    qj_bar_ens(:,:,i) = qj_bar_t(:,1:193);
    clearvars qj_bar_t;
end
clearvars spect8fluc;
%add spect8_2.mat into your system
load('\\citrixvdi.osg.ufl.edu\citrix-student$\UserData\surabhi123iit\Documents\Downloads\spect8_2.mat');
for i = 1:100
    u_fluc_inst(:,:) = spect8fluc(:,3,((386*(i-1))+1):(386*i));
    v_fluc_inst(:,:) = spect8fluc(:,4,((386*(i-1))+1):(386*i));
    qj = vertcat(u_fluc_inst,v_fluc_inst);
    clearvars u_fluc_inst v_fluc_inst;
    qj_bar = fft(qj');
    clear qj;
    qj_bar_t = qj_bar';
    clearvars qj_bar;
    qj_bar_ens(:,:,i+100) = qj_bar_t(:,1:193);
    clearvars qj_bar_t;
end
clearvars spect8fluc;
%add spect8_3.mat into your system
load('\\citrixvdi.osg.ufl.edu\citrix-student$\UserData\surabhi123iit\Documents\Downloads\spect8_3.mat');
for i = 1:80
    u_fluc_inst(:,:) = spect8fluc(:,3,((386*(i-1))+1):(386*i));
    v_fluc_inst(:,:) = spect8fluc(:,4,((386*(i-1))+1):(386*i));
    qj = vertcat(u_fluc_inst,v_fluc_inst);
    clearvars u_fluc_inst v_fluc_inst;
    qj_bar = fft(qj');
    clear qj;
    qj_bar_t = qj_bar';
    clearvars qj_bar;
    qj_bar_ens(:,:,i+200) = qj_bar_t(:,1:193);
    clearvars qj_bar_t;
end
clearvars spect8fluc;
%Modify this section...
POD_spect_coeff = zeros(6360,Nb,n);%calculate size of this variable here
eigen_val = zeros(Nb,Nb,n);
for f = 1:n
qj_bar_inst(:,:) = qj_bar_ens(:,f,:);
qj_mat = qj_bar_inst'*qj_bar_inst;
[eigvec,eigval] = svd(qj_mat);
eigen_val(:,:,f) = eigval;
POD_spect_inst = qj_bar_inst*eigvec*1/sqrt(eigval);
clearvars eigvec eigval;
POD_spect_coeff(:,:,f) = POD_spect_inst;
clearvars POD_spect_inst;
end

