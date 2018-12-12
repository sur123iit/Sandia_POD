% Define the matrix in the form MxN here
clear all;
ens_num = 6; % indicates the run number
folderName = 'Y:\rawdata\Sandia_cavity\Spectral velocity data\vel_ens\Mach0.8\ens_num_';
fileName = strcat(int2str(ens_num),'.txt');
completeName = strcat(folderName,fileName);
uv = load('Y:\rawdata\Sandia_cavity\uv_temp.txt');
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = strcat('vel_mean.txt');
completeName = strcat(folderName,fileName);
uvm = load(completeName);
uvm1 = uvm(:,ens_num);
uvv = mean(uv,2);
uv = uv - uvv;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
UV = uv + uvm1;
%%
clear all;
%%
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);

%%
c_lim = 1.2575;
%c_lim = 0.3;
folderName = 'Y:\rawdata\Sandia_cavity\';
fileName = strcat('Urec_meas_red_',int2str(ens_num),'.avi');
completeName = strcat(folderName,fileName);
v = VideoWriter(completeName);
v.FrameRate = 2;
open(v);
for k = 2:386 %total 366
    UV1 = UV(:,k);
    [x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
    Phi_viz = Uphi/Uinf;
    contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
    caxis([-c_lim c_lim]);
    %c = colorbar;
    %c.LineWidth = 2;
    colormap(jet(256))
    hold on
    x2 = x1(2:4:106);
    y2 = y1(2:2:30);
    Uphi2 = Uphi(2:4:106,2:2:30);
    Vphi2 = Vphi(2:4:106,2:2:30);
    q = quiver(x2/D,y2/D,Uphi2',Vphi2');
    q.Color = [0 0 0];
    q.AutoScaleFactor = 1.4;
    q.LineWidth = 1.5;
    set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
    set(gcf,'Position',[0 0 1200 540])
    xlim([-0.2 5.2]), ylim([-1.1 1.1])
    pbaspect([5.4 2.2 1])
    xticks(0:1:5), yticks(-1:1:1)
    line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
    hold off
    F = getframe(gcf);
    writeVideo(v,F);
end
close(v);
%% Plot matrices
%%
startx = (x1(1)/D)*ones(30,1);
sty = y1(30)/D*ones(106,1);
stx = x1/D;
sttx = vertcat(startx,stx);
starty = y1/D;
stty = vertcat(starty,sty);
[x3,y3] = meshgrid(x1(2:6:106),y1(2:3:30));
%s = streamline(x1/D,y1/D,Uphi',Vphi',x3/D,y3/D);
%set(s,'Color',[0.5 0.5 0.5],'LineWidth',1.5);

%plot(plot::streamlines2d(Uphi',Vphi',x1/D,y1/D));

c_lim = 1.2575;
folderName = 'C:\Users\surabhi123iit\Dropbox (UFL)\Spring 2018\Spring 2018 documents\Sandia Work\Fall2018\';
fileName = strcat('Urec_spec35_',int2str(ens_num),'.avi');
completeName = strcat(folderName,fileName);
v = VideoWriter(completeName);
v.FrameRate = 2;
open(v);
for k = 2:386 %total 366
    UV1 = UV(:,k);
    [x1,y1,Uphi,Vphi] = cont_plot_uv( UV1 );
    Phi_viz = Uphi/Uinf;
    contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
    caxis([-c_lim c_lim]);
    %c = colorbar;
    %c.LineWidth = 2;
    colormap(jet(256))
    hold on
    x2 = x1(2:4:106);
    y2 = y1(2:2:30);
    Uphi2 = Uphi(2:4:106,2:2:30);
    Vphi2 = Vphi(2:4:106,2:2:30);
    q = quiver(x2/D,y2/D,Uphi2',Vphi2');
    q.Color = [0 0 0];
    q.AutoScaleFactor = 1.4;
    q.LineWidth = 1.5;
    set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
    set(gcf,'Position',[0 0 1200 540])
    xlim([-0.2 5.2]), ylim([-1.1 1.1])
    pbaspect([5.4 2.2 1])
    xticks(0:1:5), yticks(-1:1:1)
    line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
    hold off
    F = getframe(gcf);
    writeVideo(v,F);
end
close(v);