% 参数设置
N = 8; % 路径数
fd = 100; % 最大多普勒频移
K_values = [0, 1, 3, 5]; % K 值数组
num_simulations = 10000; % 仿真次数

% 仿真结果存储
results = cell(length(K_values), num_simulations);

for i = 1:length(K_values)
    K = K_values(i);
    
    for j = 1:num_simulations
        % 生成随机初始相位和固定入射角度
        phi = rand(N+1, 1) * 2 * pi - pi; % 随机产生初始相位数组
        theta = ones(N+1, 1) * pi/4; % 固定入射角度为45度

        % 生成时间序列
        f = fd * (2 * rand(N+1, 1) - 1); % 随机产生多普勒频移数组
        t = 0:1/fd:1; % 时间序列

        % 计算信道增益
        h = sqrt(1 / (2*(K+1))) * sum(exp(1i*(2*pi*f.*t + phi)) .* cos(theta));

        % 存储仿真结果
        results{i, j} = angle(h);
    end
end

% 绘制相位概率密度分布图
figure;
hold on;
colors = {'r', 'g', 'b', 'k'};
legend_entries = cell(1, length(K_values));

for i = 1:length(K_values)
    K = K_values(i);
    
    % 获取仿真结果（相位）
    phase_list = [];
    for j = 1:num_simulations
        phase = results{i, j};
        phase_list = [phase_list; phase];
    end
    
    % 计算概率密度分布
    [f, x] = ksdensity(phase_list(:));
    
    
    % 绘制概率密度分布图
    plot(x, f, colors{i}, 'LineWidth', 0.001);
    
    legend_entries{i} = sprintf('K = %d', K);
end

hold off;

% 设置图像属性
xlabel('相位');
ylabel('概率密度');
title('XZB 仿真模型相位概率密度分布');
% x=-1:0.2:1;
xlim([-1, 1]);
ylim([0.14, 0.18]);
legend(legend_entries);
