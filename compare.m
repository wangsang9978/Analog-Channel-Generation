% [h1,Nfft,Nifft,Doppler_coeff]=Clarke_model(fd,fs,Ns); % 归一化的Clarke模型，功率为1
% [h2,t_state]=Jakes_model(fd,ts,Ns,t_state,1,0);  % generate channel
% h3=z_rayleigh(8,fd,t);
clear all
close all
addpath Clarke模型\
addpath Jakes模型\
addpath zheng模型\
ts=5e-5;
Ns=1e5;
t=(0:Ns-1)*ts;
%标准瑞利
x=0:0.01:2.5;
p=raylpdf(x,0.7);

h1=load("C.mat");
h2=load("J.mat");
h3=load("Z.mat");
figure(1)

plot(x,p,'k');
hold on
[f,xi]=ksdensity(abs(h1.h));
plot(xi,f,'r');
hold on
[ff,xii]=ksdensity(abs(h2.h));
plot(xii,ff,'c');
hold on
[fff,xiii]=ksdensity(abs(h3.h));
plot(xiii,fff,'b');
ylabel('概率密度');xlabel('幅度');title('幅度分布');axis([0 2.5 0 1]);
% plot(t,10*log10(abs(h1.h)));
% ylabel('幅度/dB');xlabel('时间/s');axis([0 0.01 -20 10]);
% hold on
% plot(t,10*log10(abs(h2.h)));
% ylabel('幅度/dB');xlabel('时间/s');axis([0 0.01 -20 10]);
% hold on
% plot(t,10*log10(abs(h3.h)));
% ylabel('幅度/dB');xlabel('时间/s');axis([0 0.01 -20 10]);
% 计算Clarke模型曲线的偏斜度和陡峭度
skewness_h1 = skewness(f);
kurtosis_h1 = kurtosis(f);
peak_val_h1 = max(f); % 计算峰值
mean_val_h1 = mean(f); % 计算均值
var_val_h1 = var(f); % 计算方差


% 计算Jakes模型模型曲线的偏斜度和陡峭度
skewness_h2 = skewness(ff);
kurtosis_h2 = kurtosis(ff);
peak_val_h2 = max(ff); % 计算峰值
mean_val_h2 = mean(ff); % 计算均值
var_val_h2 = var(ff); % 计算方差


% 计算理论包络曲线的偏斜度和陡峭度
skewness_Rician = skewness(p);
kurtosis_Rician = kurtosis(p);
peak_val_Rician = max(p); % 计算峰值
mean_val_Rician = mean(p); % 计算均值
var_val_Rician = var(p); % 计算方差


% 计算zheng模型曲线的偏斜度和陡峭度
skewness_h3 = skewness(fff);
kurtosis_h3 = kurtosis(fff);
peak_val_h3 = max(fff); % 计算峰值
mean_val_h3 = mean(fff); % 计算均值
var_val_h3 = var(fff); % 计算方差


disp('C的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_h1)]);
disp(['陡峭度: ', num2str(kurtosis_h1)]);
disp(['峰值：', num2str(peak_val_h1)]);
disp(['均值：', num2str(mean_val_h1)]);
disp(['方差：', num2str(var_val_h1)]);

disp('J模型曲线的偏斜度和陡峭度:');
disp(['偏斜度: ', num2str(skewness_h2)]);
disp(['陡峭度: ', num2str(kurtosis_h2)]);
disp(['峰值：', num2str(peak_val_h2)]);
disp(['均值：', num2str(mean_val_h2)]);
disp(['方差：', num2str(var_val_h2)]);

disp('Z模型曲线的偏斜度和陡峭度:');
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
