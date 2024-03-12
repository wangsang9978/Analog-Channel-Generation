% 参数设置
K_values = [0 2 7];
sigma = 1;
N = 10000;

% 绘制不同 K 值对应的曲线
figure;
hold on;

for i = 1:length(K_values)
    % 生成服从 Rician 分布的随机序列
    rician_samples = generate_rician_samples(K_values(i), sigma, N);

    % 将 Rician 衰落幅度转换为 dB
    rician_samples_dB = 20 * log10(rician_samples);

    % 绘制 Rician 分布随机序列图
    plot(1:N, rician_samples_dB);
end

hold off;

xlabel('采样序列号');
ylabel('Rician衰落幅度 (dB)');
title('Rician分布随机序列图');
legend('K = 0', 'K = 2', 'K = 7');

function rician_samples = generate_rician_samples(K, sigma, N)
    % 生成服从 Rician 分布的随机变量序列
    rician_samples = zeros(N, 1);
    
    for i = 1:N
        % 生成 Rayleigh 分布的随机变量
        rayleigh_sample = sigma * sqrt(-2 * log(1 - rand()));
        
        % 生成均匀分布的随机变量
        uniform_sample = 2 * pi * rand();
        
        % 根据逆变换法生成服从 Rician 分布的随机变量
        rician_samples(i) = sqrt(K) + rayleigh_sample * cos(uniform_sample);
    end
end
