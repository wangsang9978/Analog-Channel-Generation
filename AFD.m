% % 参数设置
% f_c = linspace(1e9, 10e9, 100); % 载波频率范围：1 GHz 到 10 GHz
% v = linspace(10, 100, 100); % 传播速度范围：10 m/s 到 100 m/s
% 
% % 创建网格
% [X, Y] = meshgrid(f_c, v);
% 
% % 计算平均衰落时间
% f_d = Y .* X ./ 3e8; % 多径信号的最大多普勒频移
% T_avg = 1 ./ (2 * pi * f_d); % 平均衰落时间
% 
% % 绘制理论曲线
% figure;
% surf(X, Y, T_avg);
% 
% title('莱斯衰落信道的平均衰落时间');
% xlabel('载波频率 (f_c)');
% ylabel('传播速度 (v)');
% zlabel('平均衰落时间 (T_avg)');

clear all;
close;

% 参数设置
K = [0, 1, 2, 5, 10]; % 莱斯因子K的取值
EbNo_dB = -10:2:20; % 信噪比范围（dB）
EbNo = 10.^(EbNo_dB/10); % 信噪比范围对应的线性值
avg_fading_time = zeros(length(K), length(EbNo_dB)); % 理论平均衰落时间

% 计算平均衰落时间
for i = 1:length(K)
    for j = 1:length(EbNo_dB)
        gamma = K(i) * EbNo(j); % 信道增益
        avg_fading_time(i, j) = sqrt(pi/gamma)*exp(gamma)*(1 + gamma*besseli(0,gamma));
    end
end

% 绘制平均衰落时间曲线
figure;
semilogy(EbNo_dB, avg_fading_time(1,:), 'r-', 'LineWidth', 0.01);
hold on;
semilogy(EbNo_dB, avg_fading_time(2,:), 'g-', 'LineWidth', 0.01);
semilogy(EbNo_dB, avg_fading_time(3,:), 'b-', 'LineWidth', 0.01);
semilogy(EbNo_dB, avg_fading_time(4,:), 'k-', 'LineWidth', 0.01);
semilogy(EbNo_dB, avg_fading_time(5,:), 'm-', 'LineWidth', 0.01);
grid on;
xlabel('信噪比Eb/No (dB)');
ylabel('理论平均衰落时间');
legend('K=0', 'K=1', 'K=2', 'K=5', 'K=10', 'Location', 'southwest');
title('莱斯信道的理论平均衰落时间曲线');

