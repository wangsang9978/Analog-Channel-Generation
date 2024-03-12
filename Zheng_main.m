% 改进Jakes模型，也就是Zheng模型
clear;clc;
fd=926;
ts=5e-5;
Ns=1e5;
M=2^12;

t=(0:Ns-1)*ts;
tt=(0:M-1)*ts;
ff=[-M/2:M/2-1]/(M*ts*fd);
temp=zeros(3,Ns);

h=zheng_model(8,fd,t);
%%求高斯随机变量的方差，标准差，均值，均方根
    x1=var(real(h));
    x11=sqrt(x1);
    x2=var(imag(h));
    x22=sqrt(x2);
    m_r=mean(real(h));
    m_i=mean(imag(h));
    %均方根
    x111=rms(real(h));
    x222=rms(imag(h));
%幅度和相位分布函数
[f,xi]=ksdensity(real(h));
[f2,xii]=ksdensity(imag(h));

%% 画图：幅度、幅度分布、相位分布
figure(1);
%幅度增益
subplot(221);
plot(t,(real(h)));
xlabel('时间/s');ylabel('幅度');title('Zheng模型实部序列');
% axis([0 0.2 -50 10])
subplot(222)
plot(t,(imag(h)));
% axis([0 0.2 -50 10]);
xlabel('时间/s');ylabel('幅度');title('Zheng模型实部序列');
% axis([0 0.2 -50 10]);
subplot(223);
plot(xi,f);
xlabel('均值');ylabel('统计概率密度');title('Zheng模型实部包络');
subplot(224);
plot(xii,f2);
xlabel('均值');ylabel('统计概率密度');title('Zheng模型虚部包络');
figure(2);
[f,xi]=ksdensity(real(h));
[ff,xii]=ksdensity(imag(h));
plot(xi,f,'-');
hold on
plot(xii,ff,'--');
xlabel('均值');ylabel('统计概率密度');title('两路正交序列统计概率密度比较');