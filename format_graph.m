function [] = format_graph(n)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
switch n
    case 1
        pbaspect([1 1 1]);
        set(gca,'fontsize',20,'FontWeight','Bold','LineWidth',2);
        lgd.FontSize = 18;
        set(gcf,'Position',[0 0 800 800])
    case 2
        %pick l1 or l2 (larger of the two)
        hold on;
        set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
        axis equal
        set(gcf,'Position',[0 0 1200 540])
        xlim([-0.2 5.2]), ylim([-1.1 1.1])
        pbaspect([5.4 2.2 1])
        xticks(0:1:5), yticks(-1:1:1)
        line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
        hold off
    case 3
        disp('case 3');
    otherwise
        disp('other value')
end

end

