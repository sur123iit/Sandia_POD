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
        pbaspect([5.4 2.2 1]);
    case 3
        disp('positive one')
    otherwise
        disp('other value')
end

end

