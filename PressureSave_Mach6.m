clear all;
fn = (79:80)';
fn1 = 84;
fn = vertcat(fn,fn1);
fn1 = (86:134)';
fn = vertcat(fn,fn1);
%% Load from .dat file and save in .mat file
folderName = 'Z:\Data\PulsePIV_2015\pressure\';
ens_num = 1;
for ii = 1:size(fn,1)
    for cyc = 1:5
        if fn(ii,1) < 100
           fileName = strcat('t3-309_0',int2str(fn(ii,1)),'a_',int2str(cyc-1),'_r.lvm');
   
        else
           fileName = strcat('t3-309_',int2str(fn(ii,1)),'a_',int2str(cyc-1),'_r.lvm');
        end
        completeName = strcat(folderName,fileName);
        a1 = lvm_import(completeName);
        b1 = a1.Segment1.data;
        PrData(:,ens_num) = b1(:,12);
        ens_num = ens_num + 1;    
    end
end
save('Y:\rawdata\Sandia_cavity\PressureData_M6.mat','PrData','-v7.3');