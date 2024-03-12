% 参数设置
K_values = [0 2 7];
sigma = 1;
N = 200;

% 绘制不同 K 值对应的曲线
figure;
hold on;

for i = 1:length(K_values)
    % 生成服从 Rician 分布的随机序列
    rician_samples = generate_rician_samples(K_values(i), sigma, N);
    
    % 绘制 Histogram
    histogram(rician_samples, 'Normalization', 'pdf');

    % 绘制理论统计曲线
    r = linspace(0, max(rician_samples), 1000);
    pdf_theoretical = rice_pdf(r, K_values(i), sigma);
    plot(r, pdf_theoretical, '--');
end

hold off;

xlabel('莱斯随机变量 R');
ylabel('概率密度函数 PDF');
title('Rician分布的仿真结果');
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

function pdf = rice_pdf(r, K, sigma)
    % 计算莱斯分布的概率密度函数
    pdf = (r / sigma^2) .* exp(-(r.^2 + K) / (2 * sigma^2)) ...
        .* besseli(0, r * sqrt(K) / sigma^2);
end

