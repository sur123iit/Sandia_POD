clear all;
fn = (138:148)';
fn1 = (150:151)';
fn = vertcat(fn,fn1);
fn1 = 153;
fn = vertcat(fn,fn1);
fn1 = (155:164)';
fn = vertcat(fn,fn1);
fn1 = (166:172)';
fn = vertcat(fn,fn1);
fn1 = (174:180)';
fn = vertcat(fn,fn1);
fn1 = (182:186)';
fn = vertcat(fn,fn1);
fn1 = (188:193)';
fn = vertcat(fn,fn1);
%% Load from .dat file and save in .mat file
folderName = 'Z:\Data\PulsePIV_2015\pressure\';
ens_num = 1;
for ii = 1:size(fn,1)
    for cyc = 1:5
        fileName = strcat('t3-309_',int2str(fn(ii,1)),'a_',int2str(cyc-1),'_r.lvm');
        completeName = strcat(folderName,fileName);
        a1 = lvm_import(completeName);
        b1 = a1.Segment1.data;
        PrData(:,ens_num) = b1(:,12);
        ens_num = ens_num + 1;    
    end
end
save('Y:\rawdata\Sandia_cavity\PressureData_M94.mat','PrData','-v7.3');