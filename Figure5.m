clc
clear
close all
%% 
Train_CM = load('Train_ConfusionMatrices.txt');
Vaild_CM = load('Vaild_ConfusionMatrices.txt');
%% 绘图
figure(1);
set(gcf,'position',[50 60 900 400]);
gap = [0.05 .083];     % 是子图间的纵向和横向间距，gap(1)为纵向，gap(2)为横向
marg_h = [.147 .033];   % 是图件与上下边缘的距离，marg_h(1)为距下边缘的距离，marg_h(2)是距上边缘的距离
marg_w = [.062 .006];   % 是图件与左右边缘的距离，marg_w(1)为距左边缘的距离，marg_w(2)是距右边缘的距离
[ha, pos] = tight_subplot(1, 2, gap, marg_h, marg_w);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(ha(1))
% 定义起始颜色（#CF3F3E）和目标颜色（#3ECFCF）
color1 = '#E2E1E4';  % 红色  '#E2E1E4'
color2 = '#B598A1';  % 青色  '#B598A1'
col_num = 256;

imagesc(Train_CM);
set(ha(1),'Linewidth',0.65,'ticklength',[0.0001 0.00001]);
xlabel('Prediction category','FontWeight','bold','fontname','Times New Roman','FontSize',20);
ylabel('Real category','FontWeight','bold','fontname','Times New Roman','FontSize', 20);
set(ha(1),'Xlim',[0.5 2.5],'XTick',0.5:0.5:2.5,'xticklabel',{' ','MS',' ', 'NS', ' '});
set(ha(1),'Ylim',[0.5 2.5],'YTick',0.5:0.5:2.5,'yticklabel',{' ','MS',' ', 'NS', ' '});
set(gca, 'YTickLabel', get(gca, 'YTickLabel'), 'FontSize', 15, 'FontName', 'Times New Roman');
set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'FontSize', 15, 'FontName', 'Times New Roman');
ytickangle(90);

for i = 1:size(Train_CM, 1)
    for j = 1:size(Train_CM, 2)
        text(j, i, num2str(Train_CM(i, j)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', '#008080', ...
            'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'bold');
    end
end

grad_colors = colors_gradient(color1, color2, col_num);
colormap(grad_colors)
cb = colorbar;
set(cb, 'FontSize', 13, 'FontName', 'Times New Roman');
caxis([1 3200]);
set(cb,'Ticks', linspace(1, 3200, 5), 'TickLabels', {' 0 ', '800', '1600','2400', '3200'});
title('(a)','position',[0.285,0.56],'FontWeight','bold','fontname','Times New Roman','FontSize',19)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(ha(2))
imagesc(Vaild_CM);
set(ha(2),'Linewidth',0.65,'ticklength',[0.0001 0.00001]);
xlabel('Prediction category','FontWeight','bold','fontname','Times New Roman','FontSize',20);
ylabel('Real category','FontWeight','bold','fontname','Times New Roman','FontSize', 20);
set(ha(2),'Xlim',[0.5 2.5],'XTick',0.5:0.5:2.5,'xticklabel',{' ','MS',' ', 'NS', ' '});
set(ha(2),'Ylim',[0.5 2.5],'YTick',0.5:0.5:2.5,'yticklabel',{' ','MS',' ', 'NS', ' '});
set(gca, 'YTickLabel', get(gca, 'YTickLabel'), 'FontSize', 15, 'FontName', 'Times New Roman');
set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'FontSize', 15, 'FontName', 'Times New Roman');
ytickangle(90);

for i = 1:size(Vaild_CM, 1)
    for j = 1:size(Vaild_CM, 2)
        text(j, i, num2str(Vaild_CM(i, j)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', '#008080', ...
            'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'bold');
    end
end

grad_colors = colors_gradient(color1, color2, col_num);
colormap(grad_colors)
cb = colorbar;
set(cb, 'FontSize', 13, 'FontName', 'Times New Roman');
caxis([1 400]);
set(cb,'Ticks', linspace(1, 400, 5), 'TickLabels', {' 0 ', '100', '200','300', '400'});
title('(b)','position',[0.285,0.56],'FontWeight','bold','fontname','Times New Roman','FontSize',19)