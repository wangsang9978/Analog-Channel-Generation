%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%线性同余法%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%利用乘同余法和变换抽样法产生均值为0，方差为0.7的正态分布的白噪声
%公式：Xi=A*Xi*mod(M)
clc
clear
close all;
M1=2^11;%为2的方幂
M2=2^17;%为2的方幂
A1=119;%%不能太小
A2=279;%%不能太小
x1=1;%伪随机序列1的初值
x2=11;%伪随机序列2的初值
X1=x1;
X2=x2;
Y1=[];%伪随机序列1
Y2=[];%伪随机序列1
n=2^15; %伪随机序列长度
%%%%%采用乘同余法产生伪随机序列%%%%%
for i=1:n
    %产生伪随机序列1
    X1=mod(A1*X1,M1);
    Y1=[Y1 X1/M1];
    %产生伪随机序列2
    X2=mod(A2*X2,M2);
    Y2=[Y2 X2/M2];
end
x1=Y1;%% 计算均值方差
[f1,xi1]=ksdensity(x1);
xi1=xi1-0.5;

x2=Y2;%% 计算均值方差
[f2,xi2]=ksdensity(x2);
xi2=xi2-0.5;

%%%%%利用变换抽样法产生正态分布的白噪声%%%%%
%%公式:Y3=m+v*sqrt(-2*log(Y1))*cos(2*pi*Y2)
v=0.7;%白噪声方差
m=0;%白噪声均值
%正态分布的白噪声
Y3=m+sqrt(-2*log(Y1)).*cos(2*pi*Y2);%正态分布的白噪声
x3=Y3;%% 计算均值方差
[f3,xi3]=ksdensity(x3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%线性反馈移位寄存器法%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=2^15;                
Np = 15;
length_M= 15;
%%  M1序列
feedback=[1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1];   
register = [zeros(1,length_M-1) 1];
m_ma=zeros(N,Np);
 
for i=1:N
    BP_s(i) = mod(sum(feedback(2:end).*register),2);  
    for j=1:length_M-1
        register(length_M-j+1) = register(length_M-j);     %右移
    end
    register(1)=BP_s(i) ;                                  %反馈
    m_ma(i,:)=register(1:Np);
end
%BP_s=2*(BP_s-0.5);
 
 m_float=zeros(1,N);
 for i=1:N
     for j=1:Np
          m_float(i)= m_float(i)+2^(j-1)* m_ma(i,j);
     end
          m_float(i)= m_float(i)/2^Np;
 end
 
xm=m_float;%% 计算均值方差
[fm,xim]=ksdensity(xm);
xim=xim-0.5;

 %%  m2序列
feedback_2=[1 0 0 1 0 0 0 0 0 0 0 0 1 0 1 1];   
register_2 = [zeros(1,length_M-1) 1];
m_ma_2=zeros(N,Np);
 
for i=1:N
    BP_s_2(i) = mod(sum(feedback_2(2:end).*register_2),2);  
    for j=1:length_M-1
        register_2(length_M-j+1) = register_2(length_M-j);     %右移
    end
    register_2(1)=BP_s_2(i) ;                                  %反馈
    m_ma_2(i,:)=register_2(1:Np);
end
%BP_s=2*(BP_s-0.5);
 
 m_float_2=zeros(1,N);
 for i=1:N
     for j=1:Np
          m_float_2(i)= m_float_2(i)+2^(j-1)* m_ma_2(i,j);
     end
          m_float_2(i)= m_float_2(i)/2^Np;
 end
xm2=m_float_2;%% 计算均值方差
[fm2,xim2]=ksdensity(xm2);
xim2=xim2-0.5;

 %% 产生高斯噪声
 u1=cos(2*pi.*m_float).*sqrt(-2.*log(m_float_2));    %[0:1]的均匀分布变成标准高斯分布

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%画图%%%%%%%%%%%%%%%%%%%%%%%%
x=u1;%% 计算均值方差
figure
[f,xi]=ksdensity(x);
  plot(xi3,f3,'blue')
  hold on;
  plot(xi,f,'r')
  title("线性同余法与线性反馈移位寄存器法-统计概率密度比较")
xlabel('均值')
ylabel('统计概率密度')
legend('线性同余法','线性反馈移位寄存器法')

%%线性同余法画图
figure
subplot(2,2,1)
plot(Y1)
title("线性同余法-伪随机序列1")
xlabel('取样点数')
ylabel('信号幅度值')
subplot(2,2,2)
plot(Y2)
title("线性同余法-伪随机序列2")
xlabel('取样点数')
ylabel('信号幅度值')
subplot(2,2,3)
plot(xi1,f1)
title("统计概率密度1")
xlabel('均值')
ylabel('统计概率密度')
subplot(2,2,4)
plot(xi2,f2)
title("统计概率密度2")
xlabel('均值')
ylabel('统计概率密度')

%%移位寄存器法画图
figure
subplot(2,2,1)
plot(m_float)
title("线性反馈移位寄存器法-m序列1")
xlabel('取样点数')
ylabel('信号幅度值')
subplot(2,2,2)
plot(m_float_2)
title("线性反馈移位寄存器法-m序列2")
xlabel('取样点数')
ylabel('信号幅度值')
subplot(2,2,3)
plot(xim,fm)
title("统计概率密度1")
xlabel('均值')
ylabel('统计概率密度')
subplot(2,2,4)
plot(xim2,fm2)
title("统计概率密度2")
xlabel('均值')
ylabel('统计概率密度')

%%两个一起画
figure
subplot(2,2,1)
plot(Y3)
title("线性同余法-高斯随机序列")
xlabel('取样点数')
ylabel('信号幅度值')
subplot(2,2,2)
plot(u1)
title("线性反馈移位寄存器法-高斯随机序列")
xlabel('取样点数')
ylabel('信号幅度值')
subplot(2,2,3)
plot(xi3,f3)
title("统计概率密度1")
xlabel('均值')
ylabel('统计概率密度')
subplot(2,2,4)
plot(xi,f)
title("统计概率密度2")
xlabel('均值')
ylabel('统计概率密度')

y1=rms(u1);
ya=rms(Y3);
y1mean=mean(u1);
yamean=mean(Y3);
y1var=var(u1);
y1bvar=sqrt(y1var);
yavar=var(Y3);
yabvar=sqrt(yavar);