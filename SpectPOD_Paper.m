%This code is to calculate the eigval values of various frequencies
%Expand it for all the ensemble values i.e. 280
%Check if fft is applied properly. You can use cat to join data and check
%with respect to that
%Check what factor needs to be multiplied to ffts
%expand later for others.
clear all;
load('\\citrixvdi.osg.ufl.edu\citrix-student$\UserData\surabhi123iit\Documents\Downloads\spect8_1.mat');
[x1,x2,N] = size(spect8fluc);
Nf = 386;
n = Nf/2;
Nb = 100; %hardcoded
eigval1 = zeros(n,1);
eigval2 = zeros(n,1);
%Only applying for frequency, f = 1
for f = 1:n 
qj_bar_inst = zeros(x1*2,Nb);
for i = 1:Nb
    u_fluc_inst(:,:) = spect8fluc(:,3,((386*(i-1))+1):(386*i));
    v_fluc_inst(:,:) = spect8fluc(:,4,((386*(i-1))+1):(386*i));
    qj = vertcat(u_fluc_inst,v_fluc_inst);
    clearvars u_fluc_inst v_fluc_inst;
    qj_bar = fft(qj');
    clear qj;
    qj_bar_inst(:,i) = qj_bar(f,:);
end
qj_mat = (conj(qj_bar_inst))'*qj_bar_inst;
[eigvec,eigval] = svd(qj_mat);
eigval1(f,1) = eigval(1,1);
eigval2(f,1) = eigval(2,2);
%check what this might be a function of.
%POD_spect_coeff = qj_bar_inst*eigvec*1/sqrt(eigval); 
end
