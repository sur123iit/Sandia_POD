function [] = plot_cont_rms(uv_rec, option)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
        [L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
        [x1,y1,Uphi,Vphi] = cont_plot_uv(uv_rec);
        
        if option == 1
            Phi_viz = Uphi/Uinf;
        else
            Phi_viz = Vphi/Uinf;
        end
        contourf(x1/D,y1/D,Phi_viz',100,'LineStyle','none');
        hold on;
        set(gca,'FontSize',20,'FontWeight','Bold','LineWidth',2);
        axis equal
        set(gcf,'Position',[0 0 1300 560])
        xlim([-0.2 5.2]), ylim([-1.1 1.1])
        pbaspect([5.4 2.2 1])
        xticks(0:1:5), yticks(-1:1:1)
        line([-0.1 0 0 0 0 5 5 5 5 5.1],[0 0 -1 0 -1 -1 -1 0 0 0],'Color',[0 0 0],'LineWidth',2)
        hold off;
        colormap(jet(256))
        c = colorbar;
        c.LineWidth = 2;
        if option == 1
            c.Label.String = 'u / U\infty';
        else
            c.Label.String = 'v / U\infty';
        end
        
        caxis([0 max(max(Phi_viz))])
        xlabel('x/D','FontSize',34,'FontWeight','Bold'), ylabel('y/D','FontSize',34,'FontWeight','Bold')
end

