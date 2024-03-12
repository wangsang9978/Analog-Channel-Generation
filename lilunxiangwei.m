
K = [0, 1, 2, 5 ,10]; % 莱斯因子 K 的取值
x = linspace(-pi, pi, 1000); % 相位范围

figure;
hold on;

for i = 1:length(K)
    sigma = sqrt(1/(2*K(i))); % 计算标准差
    f = (1/(sqrt(2*pi)*sigma)) * exp(-(x.^2)/(2*sigma^2)); % 计算概率密度函数
    plot(x, f);
end

hold off;

xlabel('相位(rad)')
ylabel('概率密度')
title('不同莱斯因子 K 下的理论相位概率密度分布')
legend('K = 0', 'K = 1', 'K = 2', 'K = 5' ,'K = 10');

