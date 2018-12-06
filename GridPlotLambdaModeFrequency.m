%% grid matrix : eig4 is the final
%remains the same
clear all;
[L,D,Mach,Uinf,Fs,N,Nb] = load_parameters(1);
folderName = strcat('Y:\rawdata\Sandia_cavity\SpectralConvergenceResults\');
fileName = 'eigval_280.txt';
completeName = strcat(folderName,fileName);
eig1 = load(completeName);
eig2 = eig1(:,1:193);
eig2(:,1) = zeros(280,1);
sum_eig4 = sum(sum(eig2));
eig2 = eig2/sum_eig4;

%Select L

m_lim = 1; % change this
eig3(:,1) = eig2(m_lim,1:193);
f_index = 1:193';
m_index = m_lim*ones(193,1);
eig4(:,1) = eig3;

%Rossiter frequencies

m_lim = 1:5;
f_lim = 24:27; % change this
[a1 a2] = size(m_lim);
[a3 a4] = size(f_lim);
f_index_t = repmat(f_lim,a2,1);
m_index_t = (repmat(m_lim,a4,1))';
f_index = reshape(f_index_t,[a2*a4, 1]);
m_index = reshape(m_index_t,[a2*a4, 1]);
eig_2 = eig2(m_lim,f_lim);
eig4 = reshape(eig_2,[a2*a4, 1]);

%First 50 modes

eig3 = reshape(eig2,[280*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig5(1:50,1);

%First 30 modes for 32.5 % energy

eig3 = reshape(eig2,[280*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig5(1:50,1);

%First 50 modes with reduced frequency
eig2(:,2) = zeros(280,1);
eig2(:,3) = zeros(280,1);
eig2(:,4) = zeros(280,1);
eig3 = reshape(eig2,[280*193 ,1]);
[eig5,index_eig] = sort(eig3,'descend');
m_index = mod(index_eig,Nb);
f_index = floor(index_eig/Nb) + 1;
eig4 = eig5(1:50,1);

%clearvars eig1 eig2 eig3;
en_frac = sum(eig4)/sum(sum(eig2));
%
%%
[N1,~] = size(eig4);
%N1 = 50;
m1 = 5;
f1 = max(f_index(1:N1));
eig5 = zeros(f1,m1);
for ii = 1:N1
eig5(f_index(ii),m_index(ii)) = eig4(ii);
end
%% L vs StL
count = 100;
eig6 = count*eig5/max(max(eig5));
eig7 = eig6;
%
%eig7 = eig6(:,[4 3 2 1]);
%c = gray(30);
%grid on

image(flipud(eig7'));
c = colormap(blackwhite(count));
c = flipud(c);
caxis([0 1])
c = colorbar;
c.LineWidth = 2;
set(gca, 'LineWidth', 2)%colormap(c);

pbaspect([2 1 1])
set(gca,'fontsize',24,'FontWeight','Bold','LineWidth',2);

xlabel('St_L','FontSize',38,'FontWeight','Bold','FontAngle','Italic');
ylabel('l','FontSize',38,'FontWeight','Bold','FontAngle','Italic');
%
xmax = 85.5;
xticks(13:13:85.5);
yticks(-5:15:15);
%xticks(0:17:192), yticks(0:10:20)
xlim([1.5 xmax])
hold on
for ii = 2.5:1:(xmax-1)
plot([ii ii],[0.5 5.5],'LineWidth',1,'Color',[0 0 0])
end
for ii = 0.5:1:4.5
    plot([0.5 xmax],[ii ii],'Color',[0 0 0]);
end
hold off
set(gcf,'Position',[0 0 1465 765])
%%
pbaspect([2 1 1]);
%%
%  1:0 and 194: 18750 and 1:0 and 194: 8.75
%%
cbh = colorbar;
set(cbh,'XTick',0:0.2:1);
set(gca,'fontsize',18,'FontWeight','Bold','LineWidth',2);
set(gcf,'Position',[0 0 800 800])
xticks(0:20:100), yticks(0:20:100)


xlabel('Ensemble(N = 4000)','FontSize',34), ylabel('Time Resolved(N = 4000)','FontSize',34);