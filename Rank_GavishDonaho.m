for ens_num = 1:60
    fileName = strcat('C:\Users\surabhi123iit\Documents\MATLAB\Raw\vel_ens\Mach0.8\ens_num_',int2str(ens_num),'.txt');
    uv = load(fileName);
    x = uv(:,1:385);
    [Qx, S, V] = svd(x,0);
    beta = size(x,2)/size(x,1);
    omega= optimal_SVHT_coef(beta,0);
    diagS = diag(S);
    omega = optimal_SVHT_coef(beta,0) * median(diagS);
    r = sum(diagS > omega);
    y = uv(:,2:386);
    rank_block(ens_num,1) = r;
end
plot(1:50,rank_block,'-o','LineWidth',2);
ylim([0 120])
xlim([1 50])
set(gca,'FontSize',18,'FontWeight','Bold','LineWidth',2);
pbaspect([1 1 1])
xlabel('Block Number','FontSize',34),ylabel('Reduced Rank','FontSize',34)
set(gcf,'Position',[0 0 800 800])