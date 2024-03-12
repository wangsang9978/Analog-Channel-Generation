%XZB模型
% 参数设置
N = 8; % 路径数
fd = 1000; % 最大多普勒频移
K_values = [0.8,1, 2, 5]; % K 值数组
num_simulations = 1000; % 仿真次数

% 仿真结果存储
results = cell(length(K_values), num_simulations);

for i = 1:length(K_values)
    K = K_values(i);
    
    for j = 1:num_simulations
        % 生成随机相位和入射角度
        phi = rand(N, 1) * 2 * pi;
        theta = rand(N, 1) * pi - pi/2;

        % 生成时间序列
        f = fd * (2 * rand(N, 1) - 1); % 随机产生多普勒频移数组
        t = 0:1/fd:1; % 时间序列

        % 计算信道增益
        h = sqrt(1 / (2*(K+1))) * sum(exp(1i*(2*pi*f.*t + phi)) .* cos(theta));

        % 存储仿真结果
        results{i, j} = h;
    end
end

% 计算包络
envelopes = cell(length(K_values), 1);
for i = 1:length(K_values)
    K = K_values(i);
    
    envelope_list = [];
    for j = 1:num_simulations
        % 获取仿真结果
        h = results{i, j};
        
        % 计算包络
        envelope = abs(h);
        envelope_list = [envelope_list; envelope];
    end
    
    envelopes{i} = envelope_list;
end

% 绘制包络概率密度分布图
figure;
hold on;
colors = {'r', 'g', 'b', 'k'};
linestyles = {'-', '-', '-', '-'};
legend_entries = cell(1, length(K_values));

for i = 1:length(K_values)
    K = K_values(1);
    
    % 获取包络列表
    envelope_list = envelopes{1};
    
    % 计算概率密度分布
    %[f, x] = ksdensity(envelope_list(:));

      [f, x] = ksdensity(envelope_list(:), linspace(0, 2.5, 1000));


    
    % 绘制概率密度分布图
    plot(x, f, colors{1}, 'LineWidth', 0.001);
    
    legend_entries{1} = sprintf('K = %d', K);
end

hold off;




% 设置图像属性
xlabel('包络幅度');
ylabel('概率密度');
title('XZB 仿真模型包络概率密度分布');
xlim([0, 4]);
legend(legend_entries);
