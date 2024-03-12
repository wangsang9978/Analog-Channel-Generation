% 初始仿真条件
K = 6;          % 莱斯因子 K (dB)
f = 100000;     % 信道采样频率 f (Hz)
wd = 3000;      % 最大多普勒频移 wd (Hz)
b0 = pi/4;      % 直视路径到达角 b0

N = 6000;       % 信道长度
t = (0:N-1)/f;  % 时域样本点

% 生成莱斯衰落信道复输出序列
bn = -pi + 2*pi*rand(1,N);   % [-pi,pi)上均匀分布的随机序列
c0 = -pi + 2*pi*rand(1,N);   % [-pi,pi)上均匀分布的随机序列
dn = -pi + 2*pi*rand(1,N);   % [-pi,pi)上均匀分布的随机序列

an = (2*pi*(0:N-1)+bn)/N;   % 计算 an
zc = (1/N)*sum(cos(wd*t.*cos(an)+dn)) + sqrt(K)*cos(wd*t*cos(b0)+c0)/sqrt(1+K);    % 计算 zc(t)
zs = (1/N)*sum(sin(wd*t.*cos(an)+dn)) + sqrt(K)*sin(wd*t*cos(b0)+c0)/sqrt(1+K);    % 计算 zs(t)
z = zc + zs;    % 计算复输出序列 z(t)

% 计算幅度包络
envelope = abs(hilbert(z));

% 绘制幅度包络图
plot(t, 20*log10(envelope));
xlabel('信道长度 [N]');
ylabel('幅值 [dB]');
title('莱斯衰落信道幅度包络');
ylim([-40, 20]);
