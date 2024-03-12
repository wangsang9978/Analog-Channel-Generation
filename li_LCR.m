% 设置参数
SNRdB = -10:0.1:30; % 信噪比范围（dB）
K_values = [0, 1, 2, 5]; % 不同莱斯因子

% 计算电平通过率
P_out = zeros(length(K_values), length(SNRdB));
for i = 1:length(K_values)
    K = K_values(i);
    gamma = 10.^(SNRdB/10); % 信噪比
    P_out(i, :) = 1 - marcumq(sqrt(2*K*gamma/(1+K)), sqrt(2*gamma/(1+K)), 1);
end

% 绘制电平通过率曲线
figure;
semilogy(SNRdB, P_out);
xlabel('SNR (dB)');
ylabel('电平通过率');
title('不同莱斯因子K下的莱斯衰落信道的电平通过率');
legend('K = 0', 'K = 1', 'K = 2', 'K = 5');
grid on;
