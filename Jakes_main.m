% plot AWGN
% clear;clc
fd=926;     % 最大Doppler
ts_mu=50;   % 持续时间
scale=1e-6;
ts=ts_mu*scale; %采样时间
fs=1/ts;    % sample frequency
Ns=1e5;     % 采样数

M=2^12;
t=(0:Ns-1)*ts;
tt=(0:M-1)*ts;
ff=[-M/2:M/2-1]/(M*ts*fd);
temp=zeros(3,Ns);

%generat channel information
    t_state=0;  % 开始采样时刻
    [h,t_state]=Jakes_model(fd,ts,Ns,t_state,1,0);  % generate channel
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
%plot AWGN
figure(1);
subplot(221)
plot((1:Ns)*ts,real(h));
axis([0 5 -3 3]);
xlabel('时间/s');ylabel('幅度');title('Jakes模型实部序列');
subplot(222)
plot((1:Ns)*ts,imag(h));
axis([0 5 -3 3]);
xlabel('时间/s');ylabel('幅度');title('Jakes模型虚部序列');

%% 信道包络
subplot(223)
[f,xi]=ksdensity(real(h));
plot(xi,f);
axis([-3 3 0 0.6]);
xlabel('均值');ylabel('统计概率密度');title('Jakes模型实部包络');
subplot(224)
[ff,xii]=ksdensity(imag(h));
plot(xii,ff);
axis([-3 3 0 0.6]);
xlabel('均值');ylabel('统计概率密度');title('Jakes模型虚部包络');
figure(2);
[f,xi]=ksdensity(real(h));
[ff,xii]=ksdensity(imag(h));
plot(xi,f,'-');
hold on
plot(xii,ff,'--');
xlabel('均值');ylabel('统计概率密度');title('两路正交序列统计概率密度比较');
% figure(3)
% plot(fft(abs(real(h))));