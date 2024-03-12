clear all
close all
clc;
h1=load("InverM.mat");
h2=load("qtZhang.mat");
h3=load("skipSave.mat");
m=3.0;p=0;omega=2;
h1=cell2mat(struct2cell(h1));
h2=cell2mat(struct2cell(h2));
h3=cell2mat(struct2cell(h3));
f1=figure('Color','white');
figure(f1);
% [f,xi]=ksdensity(abs(h1.pdf));
% x = linspace(0, 2.5, 1000);
xi=0:0.03:3.0;
% plot(x,h1.pdf,'r');
[b1,a1] = ksdensity(h1,xi);
plot(a1,b1,'r');
hold on
% [ff,xii]=ksdensity(abs(h2.pdf_amplitude));
% plot(x,h2.pdf_amplitude,'g');
[b2,a2] = ksdensity(h2,xi);
plot(a2,b2,'g');
hold on
% [fff,xiii]=ksdensity(abs(h3.f));
%plot(x,h3.f,'b');
[b3,a3] = ksdensity(h3,xi);
plot(a3,b3,'b');
%添加Nakagami-m理论曲线
x=xi;
mu=3.0;
omega=2.0;
Nakagami_pdf=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
plot(xi,Nakagami_pdf,'k');
ylabel('概率密度');xlabel('幅值');title('幅度分布');axis([0 2.5 0 1]);
legend('近似逆累积变换法','信道分解法','舍取法','理论包络');

% 计算近似逆累积变换法曲线的偏斜度和陡峭度
skewness_h1 = skewness(b1);
kurtosis_h1 = kurtosis(b1);
peak_val_h1 = max(b1); % 计算峰值
mean_val_h1 = mean(b1); % 计算均值
var_val_h1 = var(b1); % 计算方差


% 计算信道分解法模型曲线的偏斜度和陡峭度
skewness_h2 = skewness(b2);
kurtosis_h2 = kurtosis(b2);
peak_val_h2 = max(b2); % 计算峰值
mean_val_h2 = mean(b2); % 计算均值
var_val_h2 = var(b2); % 计算方差


% 计算理论包络曲线的偏斜度和陡峭度
skewness_Rician = skewness(Nakagami_pdf);
kurtosis_Rician = kurtosis(Nakagami_pdf);
peak_val_Rician = max(Nakagami_pdf); % 计算峰值
mean_val_Rician = mean(Nakagami_pdf); % 计算均值
var_val_Rician = var(Nakagami_pdf); % 计算方差


% 计算舍取法模型曲线的偏斜度和陡峭度
skewness_h3 = skewness(b3);
kurtosis_h3 = kurtosis(b3);
peak_val_h3 = max(b3); % 计算峰值
mean_val_h3 = mean(b3); % 计算均值
var_val_h3 = var(b3); % 计算方差


disp('近似逆累积变换法曲线的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_h1)]);
disp(['陡峭度: ', num2str(kurtosis_h1)]);
disp(['峰值：', num2str(peak_val_h1)]);
disp(['均值：', num2str(mean_val_h1)]);
disp(['方差：', num2str(var_val_h1)]);

disp('信道分解法的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_h2)]);
disp(['陡峭度: ', num2str(kurtosis_h2)]);
disp(['峰值：', num2str(peak_val_h2)]);
disp(['均值：', num2str(mean_val_h2)]);
disp(['方差：', num2str(var_val_h2)]);

disp('舍取法模型曲线的偏斜度和陡峭度:');
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
