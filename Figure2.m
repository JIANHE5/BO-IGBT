clc
clear
close all
%% 
corrMat = cell2mat(struct2cell(load('correlation.mat')));
color_A = 'k'; color_B = 'k';
bar = {'-1.00','-0.75','-0.50','-0.25','0.00','0.25','0.50','0.75','1.00'};
%% 
figure(1);
set(gcf,'position',[50 60 1350 1350]);
gap = [0.005 .001];     % 是子图间的纵向和横向间距，gap(1)为纵向，gap(2)为横向
marg_h = [.038 .028];   % 是图件与上下边缘的距离，marg_h(1)为距下边缘的距离，marg_h(2)是距上边缘的距离
marg_w = [.098 .025];   % 是图件与左右边缘的距离，marg_w(1)为距左边缘的距离，marg_w(2)是距右边缘的距离
[ha, pos]=tight_subplot(1, 1, gap, marg_h, marg_w);
%% 
CMP=corrMatPlot(corrMat,'Format','triu','Type','pie');
% CMP=corrMatPlot(corrMat,'Format','triu','Type','ssq');
CMP=CMP.setColorMap(2);
CMP=CMP.draw();
% CMP.setCorrTxt('Color',[0,0,.8],'FontName','Cambria','FontSize',12)
CMP.setLabelStr({'$x_{norm}$', '$ SVR $', '$A \left( t \right)$', '$E_{R}$', '$R_{x}$', '$h \left( \omega \right)$',...
    '${{P}_{x}}$', '$\phi \left( \omega  \right)$', '$Wc$', '$ \alpha \left( t \right) $',...
    '$\varphi \left( t \right)$', '$\omega \left( t \right)$', '${{k}_{local}}$', '${{s}_{local}}$', '$H\left( t \right)$', '$ZCR$'})
CMP.setXLabel('Color',color_A,'FontWeight','bold', 'Interpreter', 'latex','FontName','Times New Roman','FontSize',22)
CMP.setYLabel('Color',color_B,'FontWeight','bold', 'Interpreter', 'latex','FontName','Times New Roman','FontSize',22)
set(colorbar,'Ticks',linspace(-1,1,9),'TickLabels',bar,'FontName','Times New Roman','FontSize',18);

% CMP.setBox('LineWidth',0.5,'Color',[.1,0,0])
% CMP.setPatch('LineWidth',2,'EdgeColor',[0,0,.1])