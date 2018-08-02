% Figures for ppt
clear all;
%%
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
[x1,y1] = getxy();
x2 = x1/D;
y2 = y1/D;
folderName = 'Y:\rawdata\Sandia_cavity\Denoise velocity data\vel_mean\Mach0.8\';
fileName = 'vel_mean.txt';
completeName = strcat(folderName,fileName);
uv_m = load(completeName);
uvm = mean(uv_m,2);
[x1,y1,Uphi,Vphi] = cont_plot_uv( uvm );
Phi_viz = Uphi/Uinf;
cmax = max(max(Phi_viz));
contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none'); %Vphi or Uphi
startx = (x1(1)/D)*ones(10,1);
sty = y1(30)/D*ones(18,1);
stx = x1(2:6:106)/D;
sttx = vertcat(startx,stx);
hold on
starty = y1(2:3:30)/D;
stty = vertcat(starty,sty);
[x3,y3] = meshgrid(x1(1:6:106),y1(1:3:30));
s = streamline(x1/D,y1/D,Uphi',Vphi',sttx,stty);
%plot(plot::streamlines2d(Uphi',Vphi',x1/D,y1/D));
set(s,'Color',[0.5 0.5 0.5],'LineWidth',1.5);
caxis([-cmax cmax]);
colormap(jet(256))
%plot([x2(54) x2(88)],[y2(17) y2(29)],'*','Color',[0 0 0],'MarkerSize',12);
line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2);
set(gca,'FontSize',24,'FontWeight','Bold','LineWidth',2);
%c = colorbar;
%c.LineWidth = 2; % depending on location
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
set(gcf,'Position',[0 0 1200 540])
xlim([-0.2 5.2]), ylim([-1.1 1.1])
pbaspect([5.4 2.2 1])
xticks(0:1:5), yticks(-1:1:1)
hold off
%% Three dimensional cavity
figure();

%plotcube([12.7 12.7 2.54],[0 0 0],0.2,[1 1 1]);
plotcube([-6.35 12.7 2.54],[0 0 0],0.9,[0.8 0.8 0.8]);
plotcube([6.35 12.7 2.54],[12.7 0 0],0.9,[0.8 0.8 0.8]);
plotcube([25.4 12.7 -2.54],[-6.35 0 0],1,[0.8 0.8 0.8]);
axis equal
set(0,'DefaultLineLineWidth',6);
%hline = findobj(gcf, 'type', 'cell');
%set(hline,'LineWidth',5);
%%
figure();
plotcube([10 10 10],[0 0 0],0.9,[0.9 0.9 0.95])
plotcube([10 10 10],[10 0 0],0.9,[0.9 0.9 0.95])
figure();
for f_ind = 1:10
    plotcube([1 10 10],[1*(f_ind-1) 0 0],0.9,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([10 1 10],[0 1*(m_ind-1) 0],0.9,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([10 10 1],[0 0 1*(m_ind-1)],0.9,[0.9 0.9 0.95])
end
figure();
for f_ind = 1:20
    plotcube([1 10 10],[1*(f_ind-1) 0 0],0.9,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([20 1 10],[0 1*(m_ind-1) 0],0.9,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([20 10 1],[0 0 1*(m_ind-1)],0.9,[0.9 0.9 0.95])
end
figure();
for f_ind = 1:10    
    plotcube([1 10 10],[1*(f_ind-1) 0 0],0.9,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([10 1 10],[0 1*(m_ind-1) 0],0.9,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([10 10 1],[0 0 1*(m_ind-1)],0.9,[0.9 0.9 0.95])
end
figure();
for f_ind = 1:10    
    plotcube([1 10 10],[1*(f_ind-1) 0 0],0.15,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([10 1 10],[0 1*(m_ind-1) 0],0.15,[0.9 0.9 0.95])
end
for m_ind = 1:10
    plotcube([10 10 1],[0 0 1*(m_ind-1)],0.15,[0.9 0.9 0.95])
end
plotcube([10 1 10],[0 5 0],1,[[0.8 0.8 0.9]])
pbaspect([1 1 1])
%plotcube([10 1 10],[0 0 0],0.9,[0.9 0.9 0.95])
%% Snapshot POD figure
%test
 y=-2:.01:2;
 z=4-y.^2;
 numy=length(y); 
 % Constructing the vertices
 V=zeros(numy,3); 
 for iy=1:numy, 
     V(iy,:)=[0,y(iy),z(iy)];  % Vertices in the parabola 
     V(iy+numy,:)=[0,y(iy),0]; % Vertices in the y axis
 end
 % Constructing faces
 F=zeros(numy-1,4); for iy=1:numy-1, F(iy,:)=[iy,iy+1,iy+1+numy,iy+numy]; end
 patch('Vertices',V,'Faces',F)
%%
figure();
x = [1 -1 -1 1]; % Generate data for x vertices
y = [1 1 -1 -1]; % Generate data for y vertices
for ii = 1:10
    z = [ (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1];
    patch(x, y, z, [0.9 0.9 0.95],'LineWidth',1);
    hold on;
end
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 0.8])
view(3);
%%
figure();
x = [1 -1 -1 1]; % Generate data for x vertices
y = [1 1 -1 -1]; % Generate data for y vertices
ii = 1;
    z = [ (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1];
    patch(x, y, z, [0.9 0.9 0.95],'LineWidth',1);
    hold on;
set(gcf,'Position',[0 0 800 800])
pbaspect([1 1 0.8])
view(3);
%%
figure();
x = [1 -1 -1 1]; % Generate data for x vertices
y = [1 1 -1 -1]; % Generate data for y vertices
for ii = 1:3
    z = [ (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1];
    patch(x, y, z, [0.9 0.9 0.95],'LineWidth',1);
    hold on;
end
for ii = 5:8
    z = [ (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1];
    patch(x, y, z, [0.9 0.9 0.95],'LineWidth',1);   
end

ii = 10;
    z = [ (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1];
        patch(x, y, z, [0.9 0.9 0.95],'LineWidth',1);  
        
x = [1.4 -0.6 -0.6 1.4];
y = [1 1 -1 -1];
        
ii = 4;
    z = [ (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1];
        patch(x, y, z, [0.8 0.8 0.9],'LineWidth',2);   

ii = 9;
    z = [ (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1 (ii-1)*0.1];
        patch(x, y, z, [0.8 0.8 0.9],'LineWidth',2);   
set(gcf,'Position',[0 0 960 800]);
pbaspect([1.2 1 0.8]);
view(3);
%%
z = [0 0 0 0]; % Solve for z vertices data
patch(x, y, z, [0.9 0.9 0.95]);
z = [0.1 0.1 0.1 0.1];
hold on;
patch(x, y, z, [0.9 0.9 0.95]);
z = [0.2 0.2 0.2 0.2];
patch(x, y, z, [0.9 0.9 0.95]);
%%
