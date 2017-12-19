for t=5:5:100
% for t=10:10:size(PIVPoissonout.Pfluc,4)
Pfluctemp=PIVPoissonout.Pfluc(:,:,:,t); 
% Pfluctemp=Vf(:,:,:,t); 
if isempty(XYZPfluc)
XYZPfluc=[xq(:)./H, yq(:)./H, zq(:)./H, Pfluctemp(:)./(22./H)];
else
XYZPfluc=[XYZPfluc, Pfluctemp(:)./22];   
end
end
end
end
clear XYZXYZPfluctemp
XYZPfluc(isnan(XYZPfluc))=0;
XYZPfluc=XYZPfluc';
% save([DirectoryS '\Combined\Pfluc\XYZPflucBLK' num2str(blk) 'BRK' num2str(brk) '.mat'],'XYZPfluc','-v7.3');

% Write Pressure File for Tecplot
I=124; J=8; K=185; c=4; Var2Save=XYZPfluc;
for frames =1:1:size(XYZPfluc,1)-3
    if frames==1
fid=fopen('Z:\NickelsA\PIVDataStore2\Combined\XYZPfluc.txt','wt');
% fid=fopen('Z:\NickelsA\PIVDataStore2\Combined\Pfluc\XYZcheck.txt','wt');
header1='Variables = "X" "Y" "Z" "T" \nZONE T="Zone 1" \nZoneType=Ordered';
header2=['\nI=' num2str(I) ' \nJ=' num2str(J) ' \nK=' num2str(K) ' \nDataPacking=Block'];
header3=['\nSolutionTime=' num2str(1+(1/32768)) ' \nStrandId=1 \n'];
fprintf(fid,[header1 header2 header3]);
fprintf(fid, '%f \n',[Var2Save(1,:); Var2Save(2,:); Var2Save(3,:); Var2Save(c,:)]');
    else
c=c+1; header1=[' \nZONE T="Zone ' num2str(c-3) '" \nZoneType=Ordered'];
% header3=['\nSolutionTime=' num2str(1+(2/32768)) ' \nStrandId=1 \nVARSHARELIST=([1-3]=1) \n'];
header3=['\nSolutionTime=' num2str(1+(c-3/32768)) ' \nStrandId=1 \nVARSHARELIST=([1-3]=1) \n'];
fprintf(fid,[header1 header2 header3]);
fprintf(fid, '%f \n',[Var2Save(c,:)]');
    end
end
fclose(fid)
