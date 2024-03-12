

% 设置参数
K_values = [0, 1, 5, 10]; % 不同的莱斯因子
t = linspace(-10, 10, 1000); % 时间间隔

% 绘制不同莱斯因子下的理论自相关函数曲线
figure;
hold on;
for k = 1:length(K_values)
    K = K_values(k);
    R = (1 + K) * exp(-K*abs(t)) .* besseli(0, 2*sqrt(K*(1+K)*abs(t)));
    plot(t, R, 'LineWidth', 0.8);
end

% 设置图例和标题
legend('K = 0', 'K = 1', 'K = 5', 'K = 10', 'Location', 'northwest');
title('不同莱斯因子下的莱斯衰落信道的理论自相关函数');
xlabel('时间间隔');
ylabel('自相关函数值');

% 设置坐标轴范围
xlim([-10 10]);
ylim([0 30]);

% 显示网格
grid on;

