% 定义参数
N = 10000;     % 生成随机数的数量
men = 0;    % 均值
variance = 1;   % 方差

% 生成服从高斯分布的随机数
awgn = norminv(rand(N, 1), men, sqrt(variance));

% 显示生成的随机数
randNum=awgn;
mu=mean(randNum);
sigma=std(randNum);
sigma2=var(randNum);
 data2=(randNum-mu)./sigma;
 [y,x] = ksdensity(data2);
 figure ;
plot(x,y,'k--','LineWidth',1.0);
xlabel('x');
ylabel('pdf(x)');
legend('逆变换法仿真数据','理论曲线\sigma=1,\mu=0');
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);

Fs=1/32;
N=10000
Y = fft( data2,N)/N*2;   %除以N乘以2才是真实幅值，N越大，幅值精度越高
 
f = Fs/N*(0:1:N-1); %频率
 
A = abs(Y);     %幅值
 
P = angle(Y);   %相值
 
figure ;
 
subplot(211);plot(f(1:N/2),A(1:N/2));   %函数fft返回值的数据结构具有对称性,因此我们只取前一半
 
title('幅值频谱')
 
xlabel('频率(Hz)')
 
ylabel('幅值')
 
subplot(212);plot(f(1:N/2),P(1:N/2));
 
title('相位谱频')
 
xlabel('频率(Hz)')
 
ylabel('相位')