clear all
close all
addpath Ni\
addpath zheng_pdf\
addpath XZBbaoluo\
ts=5e-5;
Ns=1e5;
t=(0:Ns-1)*ts;
h1=load("N.mat");
h2=load("Z.mat");
h3=load("XZB.mat");
figure(1)
% [f,xi]=ksdensity(abs(h1.pdf));
x = linspace(0, 2.5, 1000);
plot(x,h1.pdf,'r');
hold on
% [ff,xii]=ksdensity(abs(h2.pdf_amplitude));
plot(x,h2.pdf_amplitude,'g');
hold on
% [fff,xiii]=ksdensity(abs(h3.f));
plot(x,h3.f,'b');
%添加莱斯信道理论包络曲线
K = 0.7; % 莱斯因子
% sigma = 1; % 高斯分布的标准差
A=0.8;
sigma=sqrt(A.^2/2*K);
Rician_pdf = (x./(sigma.^2)).*exp(-(x.^2 + A.^2)./(2*sigma.^2)).*besseli(0, A.*x./(sigma.^2));
plot(x, Rician_pdf, 'm');
hold on



ylabel('概率密度');xlabel('幅值');title('幅度分布');axis([0 2.5 0 1]);
legend('逆变换法','Xiao&Zheng模型','XZB模型','理论包络');

% 计算逆变换法曲线的偏斜度和陡峭度
skewness_h1 = skewness(h1.pdf);
kurtosis_h1 = kurtosis(h1.pdf);
peak_val_h1 = max(h1.pdf); % 计算峰值
mean_val_h1 = mean(h1.pdf); % 计算均值
var_val_h1 = var(h1.pdf); % 计算方差


% 计算Xiao&Zheng模型曲线的偏斜度和陡峭度
skewness_h2 = skewness(h2.pdf_amplitude);
kurtosis_h2 = kurtosis(h2.pdf_amplitude);
peak_val_h2 = max(h2.pdf_amplitude); % 计算峰值
mean_val_h2 = mean(h2.pdf_amplitude); % 计算均值
var_val_h2 = var(h2.pdf_amplitude); % 计算方差


% 计算理论包络曲线的偏斜度和陡峭度
skewness_Rician = skewness(Rician_pdf);
kurtosis_Rician = kurtosis(Rician_pdf);
peak_val_Rician = max(Rician_pdf); % 计算峰值
mean_val_Rician = mean(Rician_pdf); % 计算均值
var_val_Rician = var(Rician_pdf); % 计算方差


% 计算XZB模型曲线的偏斜度和陡峭度
skewness_h3 = skewness(h3.f);
kurtosis_h3 = kurtosis(h3.f);
peak_val_h3 = max(h3.f); % 计算峰值
mean_val_h3 = mean(h3.f); % 计算均值
var_val_h3 = var(h3.f); % 计算方差


disp('逆变换法曲线的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_h1)]);
disp(['陡峭度: ', num2str(kurtosis_h1)]);
disp(['峰值：', num2str(peak_val_h1)]);
disp(['均值：', num2str(mean_val_h1)]);
disp(['方差：', num2str(var_val_h1)]);

disp('Xiao&Zheng模型曲线的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_h2)]);
disp(['陡峭度: ', num2str(kurtosis_h2)]);
disp(['峰值：', num2str(peak_val_h2)]);
disp(['均值：', num2str(mean_val_h2)]);
disp(['方差：', num2str(var_val_h2)]);

disp('XZB模型曲线的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_h3)]);
disp(['陡峭度: ', num2str(kurtosis_h3)]);
disp(['峰值：', num2str(peak_val_h3)]);
disp(['均值：', num2str(mean_val_h3)]);
disp(['方差：', num2str(var_val_h3)]);

disp('理论包络曲线的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_Rician)]);
disp(['陡峭度: ', num2str(kurtosis_Rician)]);
disp(['峰值：', num2str(peak_val_Rician)]);
disp(['均值：', num2str(mean_val_Rician)]);
disp(['方差：', num2str(var_val_Rician)]);