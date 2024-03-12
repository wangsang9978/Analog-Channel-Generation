%Xiao&Zheng模型
% 参数设置
K = 10^(1/10); % 莱斯因子（dB转换为线性）
f = 100000; % 信道采样频率
wd = 3000; % 最大多普勒频移
b0 = pi/4; % 直视路径到达角

% 生成复输出序列
N = 10000; % 采样点数
n = 1:N;
bn = rand(1,N)*2*pi - pi; % b0的随机相位偏移
c0 = rand*2*pi - pi; % c0的随机相位偏移
dn = rand(1,N)*2*pi - pi; % dn的随机相位偏移

an = (2*pi*n + bn)/N;
zc = (1/N)*sum(cos(wd*cos(an) + dn)) + sqrt(K)*cos(wd*cos(b0) + c0)/sqrt(1+K);
zs = (1/N)*sum(sin(wd*cos(an) + dn)) + sqrt(K)*sin(wd*cos(b0) + c0)/sqrt(1+K);
z = zc + zs;

% 计算幅度包络和相位
% amplitude = abs(z);
% phase = angle(z);
[f,xi]=ksdensity(abs(z));
[f2,xii]=ksdensity(angle(z));

% 幅度包络的概率密度分布函数 f|z|r(z) （Xiao&Zheng公式）
x = linspace(0, 2.5, 1000);
pdf_amplitude = 2*(1+K).*x.*exp(-K-(1+K).*x.^2).*besseli(0, 2*x*sqrt(K*(K+1)));

% 相位的概率密度分布函数 
edges = linspace(-pi,pi,1000);
pdf_phase = (1 / (2*pi)) * ones(size(edges));

% wd = 100; % 最大多普勒频移
% alpha = 0.5; % 衰落系数
% Ts = 1e-6; % 采样周期
% T = 1e-3;  % 采样时间
% t = 0:Ts:T;
% A = abs(exp(-alpha*t).*exp(2*pi*1j*wd*t)); % 幅值包络函数
% phi = angle(exp(-alpha*t).*exp(2*pi*1j*wd*t)); % 相位函数


% 绘制概率密度分布图
figure;
subplot(2, 1, 1);
% plot(x, pdf_amplitude);

plot(xi,f);
hold on;plot(x, pdf_amplitude,'r:');hold off;
xlabel('|Z| (dB)');
ylabel('f|z|r(z)');
title('幅度包络的概率密度分布函数');

subplot(2, 1, 2);
plot(edges, pdf_phase);
plot(xii,f2);
hold on;plot([-pi pi],[1/2/pi 1/2/pi],'r:');hold off;
xlabel('相位 (rad)');
ylabel('f\psi(\psi)');
title('相位的概率密度分布函数');

