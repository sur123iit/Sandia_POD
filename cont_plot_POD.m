function [ ] = cont_plot_POD( Phi,option )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[x1,y1,Uphi,Vphi] = cont_plot_uv(Phi);
[L,D,Ma,Uinf,Fs,N,Nb] = load_parameters(1);
if option == 1
    viz = Uphi;
else
    viz = Vphi;
end

l1 = abs(max(max(viz))); %Vphi or Uphi
l2 = abs(min(min(viz))); %Vphi or Uphi
l = max(l1,l2);
contourf(x1/D,y1/D,viz',100,'LineStyle','none'); %Vphi or Uphi
caxis([-l l]);%pick l1 or l2 (larger of the two)
colormap(redblue)
%depending on location
set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
%h = colorbar;
%set(h,'LineWidth',2);
%xlabel('x/D','FontSize',40,'FontWeight','Bold'), %depending on location 
%ylabel('y/D','FontSize',40,'FontWeight','Bold'), %location on paper
axis equal
set(gcf,'Position',[0 0 1200 400]), %depending on location (400 or 420) 
xticks(0:1:5), yticks(-0.5:0.5:0.5)
end

