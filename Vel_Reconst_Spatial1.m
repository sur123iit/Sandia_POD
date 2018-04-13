%% Velocity Reconstructions
clear all;
%%
folderName = 'Y:\rawdata\Sandia_cavity\ConvergenceResults\Mach0.8\';
fileName = 'Phi_ens_280.txt';
completeName = strcat(folderName,fileName);
Phi = load(completeName);
%%
for r = 1:280  
clearvars -except Phi r
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_ens\Mach0.8\';
fileName = strcat('ens_num_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
uv = load(completeName);
m_lim = 8;
for m = 1:m_lim
    Phi1(:,1) = Phi(:,m);
    a_n1 = (uv'*Phi1);
    a_n(:,m) = a_n1;
    clearvars Phi1 a_n1;
end
uv_rec = zeros(6360,N);
for m = 1:m_lim
    Phi1(:,1) = Phi(:,m);
    a_n2 = a_n(:,m);
    a_n3 = a_n2';
    uv_rec = uv_rec + (Phi1*a_n3);
    clearvars Phi1 a_n1 a_n2 a_n3;
end
folderName = 'Y:\rawdata\Sandia_cavity\SpatialVelocityReconstructions\';
fileName = strcat('uv_rec_',int2str(r),'.txt');
completeName = strcat(folderName,fileName);
save(completeName,'uv_rec','-ascii');
end
%%
clearvars data_mat1
data_mat1(:,:) = vertcat(vel_fluc(:,3,387:386*2),vel_fluc(:,4,387:386*2));
a1 = data_mat1'*Phi;
%%

    for k = 1:386
        for j = 0:29
            for i = 1:106  
           
                    Uphi_real(i,j+1,k) = vel_fluc(i+(106*j),3,k); 
               
                    Vphi_real(i,j+1,k) = vel_fluc(i+(106*j),4,k);
  
            end
        end
    end

%%
%eiegen

contourf(x,y,Vphi(:,:,8)',100,'LineStyle','none');
colorbar;
axis equal;
%%
for tcp = 1:386
    figure;
subplot(2,1,1)
contourf(x,y,((Uphi(:,:,1)'*a1(tcp,1))+(Uphi(:,:,2)'*a1(tcp,2))+(Uphi(:,:,3)'*a1(tcp,3))+(Uphi(:,:,4)'*a1(tcp,4)))/272.23,100,'LineStyle','none')
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,(Uphi(:,:,1)'*a1(tcp,1))+(Uphi(:,:,2)'*a1(tcp,2))+(Uphi(:,:,3)'*a1(tcp,3))+(Uphi(:,:,4)'*a1(tcp,4))/272.23,(Vphi(:,:,1)'*a1(tcp,1))+(Vphi(:,:,2)'*a1(tcp,2))+(Vphi(:,:,3)'*a1(tcp,3))+(Vphi(:,:,4)'*a1(tcp,4)/272.23),'color',[0 0 0]);
subplot(2,1,2)
contourf(x,y,Uphi_real(:,:,tcp)'/272.23,100,'LineStyle','none')
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi_real(:,:,tcp)'/272.23,Vphi_real(:,:,tcp)'/272.23,'color',[0 0 0]);
end
%Check if the value for a is correct
%%
%First 25 modes for spectral analysis
load('a2.mat');
clearvars -except Phi Uphi Vphi x y N a2 psd1 psd2 psd3 xcoor1 xcoor2 xcoor3 ycoor2 ycoor1 ycoor3;
xcoor1 = 20; xcoor2 = 50; xcoor3 = 95;
ycoor1 = 5; ycoor2 = 18; ycoor3 = 28;
%grid_pt = (106*ycoor1)+xcoor1; 
%grid_pt = (106*ycoor2)+xcoor2;
ymax = max(psd3);
plot(0:0.0090644:1.7494,psd2(1:193),'s-',0:0.0090644:1.7494,psd3(1:193),'^-',[0.0598 0.0598],[0 ymax],'--',[0.14 0.14],[0 ymax],'--',[0.219 0.219],[0 ymax],'--'); legend('PSD plot1','PSD plot2','PSD plot3','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3');
xlim([0.0090644 0.5]), 
%%
%First 25 modes for spectral analysis
%grid_pt = (106*ycoor1)+xcoor1 +3180; 
%grid_pt = (106*ycoor2)+xcoor2 + 3180;
%grid_pt = (106*ycoor3)+xcoor3 +3180;
u_mode_inst = zeros(280,386,25);
for ens_num = 1:280
    for k1 = 1:386
        for m = 1:25
       u_mode_inst(ens_num,k1,m) = a2(ens_num,k1,m).*Phi(grid_pt,m);
        end
    end
end
u_mode_tot = sum(u_mode_inst,3);
psd_u = zeros(386,1);
for ens_num = 1:280
    u_inst(:,1) = u_mode_tot(ens_num,:)';
    u_bar = fft(u_inst);
    psd_u = psd_u + (conj(u_bar).*u_bar);
end
psd_u = psd_u/280;
psd_u = 2*psd_u;
psd_u = psd_u/(386*37500);
ymax = max(psd_u);
plot(0:0.0090644:1.7494,psd_u(1:193),'o-',[0.0598 0.0598],[0 ymax],'--',[0.14 0.14],[0 ymax],'--',[0.219 0.219],[0 ymax],'--'); legend('PSD plot','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3');
xlim([0 0.5]), ylim([0 ymax]);
%%
%First 25 modes for visulization
u_mode = zeros(106,30,386,30);
v_mode = zeros(106,30,386,30);
for k = 1:30
    for k1 = 1:386
        u_mode(:,:,k1,k)=Uphi(:,:,k)*a2(1,k1,k);
    end
end
for k = 1:30
    for k1 = 1:386
        v_mode(:,:,k1,k)=Vphi(:,:,k)*a2(1,k1,k);
    end
end
%%
clear u_m;
u_m(:,:,1:4,1:25) = u_mode(:,:,1:100:386,1:25);
v_m(:,:,1:4,1:25) = v_mode(:,:,1:100:386,1:25);
for tcp = 1:4
    u_m_inst(:,:,:) = u_m(:,:,tcp,:);
    v_m_inst(:,:,:) = v_m(:,:,tcp,:);
figure;
contourf(x,y,(sum(u_m_inst,3))'/272.23,100,'LineStyle','none');
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar
hold on
quiver(x1,y1,(sum(u_m_inst,3))'/272.23,(sum(v_m_inst,3))'/272.23,'color',[0 0 0]);
figure;
contourf(x,y,Uphi_real(:,:,(tcp-1)*100 + 1)'/272.23,100,'LineStyle','none');
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar
hold on
quiver(x1,y1,Uphi_real(:,:,(tcp-1)*100 + 1)'/272.23,Vphi_real(:,:,(tcp-1)*100 + 1)'/272.23,'color',[0 0 0]);
%v vel
figure;
contourf(x,y,(sum(v_m_inst,3))'/272.23,100,'LineStyle','none');
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar
hold on
quiver(x1,y1,(sum(u_m_inst,3))'/272.23,(sum(v_m_inst,3))'/272.23,'color',[0 0 0]);
figure;
contourf(x,y,Vphi_real(:,:,(tcp-1)*100 + 1)'/272.23,100,'LineStyle','none');
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar
hold on
quiver(x1,y1,Uphi_real(:,:,(tcp-1)*100 + 1)'/272.23,Vphi_real(:,:,(tcp-1)*100 + 1)'/272.23,'color',[0 0 0]);
end
%%
%Power Spectral density of these a's
clearvars ymax1 ymax2 ymax3 ymax
a1_1 = fft(a1(:,1));
psd_a1_1 = (2*conj(a1_1).*a1_1)/(386*37500);
%plot(1:193,psd_a1_1(1:193));
a1_2 = fft(a1(:,2));
psd_a1_2 = (2*conj(a1_2).*a1_2)/(386*37500);
a1_3 = fft(a1(:,3));
psd_a1_3 = (2*conj(a1_3).*a1_3)/(386*37500);
%plot(1:193,psd_a1_1(1:193));
a1_4 = fft(a1(:,4));
%{
psd_a1_4 = conj(a1_4).*a1_4;
plot(1:193,psd_a1_1(1:193));
%}
%index of psd
%{
if psd_a1_1 == ymax1
end
if psd_a2_1 == ymax2
end
if psd_a3_1 == ymax3
%}
ymax1 = max(psd_a1_1);
ymax2 = max(psd_a1_2);
ymax3 = max(psd_a1_3);
%ymax4 = max(psd_a1_4);
ymax_mat = [ymax1 ymax2 ymax3];
ymax = max(ymax_mat);
plot(0:0.0090644:1.7494,psd_a1_1(1:193),'o-',0:0.0090644:1.7494,psd_a1_2(1:193),'s-',0:0.0090644:1.7494,psd_a1_3(1:193),'^-',[0.0598 0.0598],[0 ymax],'--',[0.14 0.14],[0 ymax],'--',[0.219 0.219],[0 ymax],'--'); legend('a1','a2','a3','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3');
xlim([0 0.35]), ylim([0 ymax]);
%%
clear v_mode_f1 v_mode_psd v_mode_1 v_mode_sum1 v_mode_sum2
xcoor = 95;
ycoor = 28;
v_mode_sum1 = v_mode(:,:,:,1:25);
v_mode_sum2(:,:,:) = sum(v_mode_sum1,4);
v_mode_1(:,1) = v_mode_sum2(xcoor,ycoor,:);
v_mode_f1(:,1) = fft(v_mode_1);
v_mode_psd(:,1) = conj(v_mode_f1).*v_mode_f1;
ymax1 = max(v_mode_psd_point1);
ymax2 = max(v_mode_psd_point2);
ymax3 = max(v_mode_psd_point3);
ymax_mat = [ymax1 ymax2 ymax3];
ymax = max(ymax_mat) + 50000;
plot(0:0.0090644:1.7494,v_mode_psd_point1(1:193),0:0.0090644:1.7494,v_mode_psd_point2(1:193),0:0.0090644:1.7494,v_mode_psd_point3(1:193),[0.0598 0.0598],[0 ymax],'--',[0.14 0.14],[0 ymax],'--',[0.219 0.219],[0 ymax],'--',[0.299 0.299],[0 ymax],'--'); legend('Point A','Point B','Point C','Rossiter Mode 1','Rossiter Mode 2','Rossiter Mode 3','Rossiter Mode 4');
xlim([0 0.5]); ylim([0 ymax]);
%%
%calculating xcoor and ycoor

%%
tcp=250;
figure;
contourf(x,y,((Vphi(:,:,1)'*a1(tcp,1))+(Vphi(:,:,2)'*a1(tcp,2))+(Vphi(:,:,3)'*a1(tcp,3))+(Vphi(:,:,4)'*a1(tcp,4)))/272.23,100,'LineStyle','none')
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,((Uphi(:,:,1)'*a1(tcp,1))+(Uphi(:,:,2)'*a1(tcp,2))+(Uphi(:,:,3)'*a1(tcp,3))+(Uphi(:,:,4)'*a1(tcp,4)))/272.23,((Vphi(:,:,1)'*a1(tcp,1))+(Vphi(:,:,2)'*a1(tcp,2))+(Vphi(:,:,3)'*a1(tcp,3))+(Vphi(:,:,4)'*a1(tcp,4)))/272.23,'color',[0 0 0]);
figure;
contourf(x,y,Vphi_real(:,:,tcp)'/272.23,100,'LineStyle','none')
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi_real(:,:,tcp)'/272.23,Vphi_real(:,:,tcp)'/272.23,'color',[0 0 0]);
%{
figure;
contourf(x,y,((Vphi(:,:,1)'*a1(tcp,1))+(Vphi(:,:,2)'*a1(tcp,2)))/272.23,100,'LineStyle','none')
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,((Uphi(:,:,1)'*a1(tcp,1))+(Uphi(:,:,2)'*a1(tcp,2)))/272.23,((Vphi(:,:,1)'*a1(tcp,1))+(Vphi(:,:,2)'*a1(tcp,2)))/272.23,'color',[0 0 0]);
figure;
contourf(x,y,((Vphi(:,:,1)'*a1(tcp,1)))/272.23,100,'LineStyle','none')
axis equal
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,((Uphi(:,:,1)'*a1(tcp,1)))/272.23,((Vphi(:,:,1)'*a1(tcp,1)))/272.23,'color',[0 0 0]);
%}
%%
%Contours
%create contour plot of the phiMats     
figure;
contourf(x,y,Uphi(:,:,1)',100,'LineStyle','none');
%title ('U Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
%xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
%{
hold on
[x1,y1]=meshgrid(x,y);
quiver(x1,y1,Uphi(:,:,1)',Vphi(:,:,1)','color',[0 0 0]);
%}
figure;
contourf(x,y,Vphi(:,:,1)',100,'LineStyle','none');
%title ('V Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
%xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
%hold on
%quiver(x1,y1,Uphi(:,:,1)',Vphi(:,:,1)','color',[0 0 0]);
%%
%Contours: First 2
figure;
contourf(x,y,Uphi(:,:,1)'+Uphi(:,:,2)',100,'LineStyle','none');
%title ('U Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi(:,:,1)'+Uphi(:,:,2)',Vphi(:,:,1)'+Vphi(:,:,2)','color',[0 0 0]);
figure;
contourf(x,y,Vphi(:,:,1)'+Vphi(:,:,2)',100,'LineStyle','none');
%title ('V Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi(:,:,1)'+Uphi(:,:,2)',Vphi(:,:,1)'+Vphi(:,:,2)','color',[0 0 0]);
%%
%Contours: First 4
figure;
contourf(x,y,Uphi(:,:,1)'+Uphi(:,:,2)'+Uphi(:,:,3)'+Uphsc i(:,:,4)',100,'LineStyle','none');
%title ('U Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi(:,:,1)'+Uphi(:,:,2)'+Uphi(:,:,3)'+Uphi(:,:,4)',Vphi(:,:,1)'+Vphi(:,:,2)'+Vphi(:,:,3)'+Vphi(:,:,4)','color',[0 0 0]);
figure;
contourf(x,y,Vphi(:,:,1)'+Vphi(:,:,2)'+Vphi(:,:,3)'+Vphi(:,:,4)',100,'LineStyle','none');
%title ('V Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi(:,:,1)'+Uphi(:,:,2)'+Uphi(:,:,3)'+Uphi(:,:,4)',Vphi(:,:,1)'+Vphi(:,:,2)'+Vphi(:,:,3)'+Vphi(:,:,4)','color',[0 0 0]);
%%
%Contours: First 8
figure;
contourf(x,y,Uphi(:,:,1)'+Uphi(:,:,2)'+Uphi(:,:,3)'+Uphi(:,:,4)'+Uphi(:,:,5)'+Uphi(:,:,6)'+Uphi(:,:,7)'+Uphi(:,:,8)',100,'LineStyle','none');
%title ('U Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi(:,:,1)'+Uphi(:,:,2)'+Uphi(:,:,3)'+Uphi(:,:,4)'+Uphi(:,:,5)'+Uphi(:,:,6)'+Uphi(:,:,7)'+Uphi(:,:,8)',Vphi(:,:,1)'+Vphi(:,:,2)'+Vphi(:,:,3)'+Vphi(:,:,4)'+Vphi(:,:,5)'+Vphi(:,:,6)'+Vphi(:,:,7)'+Vphi(:,:,8)','color',[0 0 0]);
figure;
contourf(x,y,Vphi(:,:,1)'+Vphi(:,:,2)'+Vphi(:,:,3)'+Vphi(:,:,4)'+Vphi(:,:,5)'+Vphi(:,:,6)'+Vphi(:,:,7)'+Vphi(:,:,8)',100,'LineStyle','none');
%title ('V Phi 1');
xlabel('x/D');
ylabel('y/D');
axis equal;
xlim([min(x) max(x)]), ylim([min(y) max(y)])
colorbar;
hold on
quiver(x1,y1,Uphi(:,:,1)'+Uphi(:,:,2)'+Uphi(:,:,3)'+Uphi(:,:,4)'+Uphi(:,:,5)'+Uphi(:,:,6)'+Uphi(:,:,7)'+Uphi(:,:,8)',Vphi(:,:,1)'+Vphi(:,:,2)'+Vphi(:,:,3)'+Vphi(:,:,4)'+Vphi(:,:,5)'+Vphi(:,:,6)'+Vphi(:,:,7)'+Vphi(:,:,8)','color',[0 0 0]);
%%
%quiver plots

figure
quiver(x1,y1,Uphi(:,:,1)',Vphi(:,:,1)');
%%
caxis_mat = zeros(3180,386);

for t = 1:386
    caxis_mat(:,t) = (Phi(3181:6360,1)*a1(t,1))+(Phi(3181:6360,2)*a1(t,2));
end

cmax1 = max(max(caxis_mat))/272.23;
cmin1 = min(min(caxis_mat))/272.23;
v = VideoWriter('Uphi1.avi');
open(v);
 colordef black
for k = 1:386
    contourf(x,y,(((Vphi(:,:,1)')*a1(k,1))+((Vphi(:,:,2)')*a1(k,2)))/272.23,100,'LineStyle','none'); xlabel('x/D ->'), ylabel('y/D ->'), title(strcat('t=',num2str(k*10.2/386),'ms')), axis equal
    c = colorbar, caxis([cmin1 cmax1]);
    xlim([min(x) max(x)]), ylim([min(y) max(y)])
    hold on
    quiver(x1,y1,(((Uphi(:,:,1)')*a1(k,1))+((Uphi(:,:,2)')*a1(k,2)))/272.23,(((Vphi(:,:,1)')*a1(k,1))+((Vphi(:,:,2)')*a1(k,2)))/272.23,'color',[0 0 0]);
    c.Label.String = 'v/Uinf';
    F = getframe(gcf);
    writeVideo(v,F);
end
close(v);
%%
caxis_mat = zeros(3180,386);

for t = 1:386
    caxis_mat(:,t) = (Phi(1:3180,1)*a1(t,1))+(Phi(1:3180,2)*a1(t,2));
end

cmax1 = max(max(caxis_mat))/272.23;
cmin1 = min(min(caxis_mat))/272.23;
v = VideoWriter('Uphi1.avi');
open(v);
 colordef black
for k = 1:386
    contourf(x,y,(((Uphi(:,:,1)')*a1(k,1))+((Uphi(:,:,2)')*a1(k,2)))/272.23,100,'LineStyle','none'); xlabel('x/D ->'), ylabel('y/D ->'), title(strcat('t=',num2str(k*10.2/386),'ms')), axis equal
    c = colorbar, caxis([cmin1 cmax1]);
    xlim([min(x) max(x)]), ylim([min(y) max(y)])
    hold on
    quiver(x1,y1,(((Uphi(:,:,1)')*a1(k,1))+((Uphi(:,:,2)')*a1(k,2)))/272.23,(((Vphi(:,:,1)')*a1(k,1))+((Vphi(:,:,2)')*a1(k,2)))/272.23,'color',[0 0 0]);
    c.Label.String = 'v/Uinf';
    F = getframe(gcf);
    writeVideo(v,F);
end
close(v);
%%
caxis_mat = zeros(3180,386);

for t = 1:386
    caxis_mat(:,t) = (Phi(1:3180,1)*a1(t,1))+(Phi(1:3180,2)*a1(t,2));
end

cmax1 = max(max(caxis_mat))/272.23;
cmin1 = min(min(caxis_mat))/272.23;
v = VideoWriter('Uphi1.avi');
open(v);
 colordef black
for k = 1:386
    contourf(x,y,(((Uphi(:,:,1)')*a1(k,1))+((Uphi(:,:,2)')*a1(k,2)))/272.23,100,'LineStyle','none'); xlabel('x/D ->'), ylabel('y/D ->'), title(strcat('t=',num2str(k*10.2/386),'ms')), axis equal
    c = colorbar, caxis([cmin1 cmax1]);
    xlim([min(x) max(x)]), ylim([min(y) max(y)])
    hold on
    quiver(x1,y1,(((Uphi(:,:,1)')*a1(k,1))+((Uphi(:,:,2)')*a1(k,2)))/272.23,(((Vphi(:,:,1)')*a1(k,1))+((Vphi(:,:,2)')*a1(k,2)))/272.23,'color',[0 0 0]);
    c.Label.String = 'v/Uinf';
    F = getframe(gcf);
    writeVideo(v,F);
end
close(v);
%%
%check if this is infact that temporal coefficient
test_sum = 0;
for test_k = 1:2000
    test_sum = test_sum +(a1(55,test_k)*Phi(55,test_k));
end
disp(test_sum);
disp(vel_fluc(55,3,55));