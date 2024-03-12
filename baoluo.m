% 参数设置
sigma_values = [1, sqrt(2), sqrt(10), sqrt(20)]; % 根据 K 计算对应的 sigma 值

% 绘制莱斯信道衰落包络的 PDF 图
figure;
hold on;

for i = 1:length(sigma_values)
    sigma = sigma_values(i);
    
    % 生成随机变量数据
    x = linspace(0, 5*sigma, 1000);
    
    % 计算莱斯信道衰落包络的 PDF
%     f = (x./sigma^2) .* exp(-x.^2./(2*sigma^2));
    f = x / sigma^2 .* exp(-(x.^2 + A^2) / (2 * sigma^2)) .* besseli(0, A * x / sigma^2);
    
    % 绘制 PDF 曲线
    plot(x, f, 'LineWidth', 0.01);
end

title('莱斯信道衰落包络的概率密度分布');
xlabel('包络');
ylabel('概率密度');

% 添加图例
legend('K = 0', 'K = 1', 'K = 5', 'K = 10', 'Location', 'northeast');

