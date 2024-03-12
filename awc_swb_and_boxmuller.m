clc
clear
close all;
b=2^24;
p=22;
q=16;
c=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%% SWB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C1(p)=c;
C2(p)=c;
N=2^15;
X1=ones(1,N);
for k=1:20:N
    X1(k)=0;
end
X2=ones(1,N);
for j=1:30:N
    X2(j)=0;
end
for i=(p+1):N
    X1(i)=mod((X1(i-q)-X1(i-p)-C1(i-1)),b);
    Y1(i)=X1(i)/(2^24);
    M1=X1(i-q)-X1(i-p)-C1(i-1);
    if(M1<0)
        C1(i)=1;
    else
        C1(i)=0;
    end
end
for i=(p+1):N
    X2(i)=mod((X2(i-q)-X2(i-p)-C2(i-1)),b);
    Y2(i)=X2(i)/(2^24);
    M2=X2(i-q)-X2(i-p)-C2(i-1);
    if(M2<0)
        C2(i)=1;
    else
        C2(i)=0;
    end
end
u1=cos(2*pi.*Y1).*sqrt(-2.*log(Y2)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%% AWC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ca1(p)=c;
Ca2(p)=c;
N=2^15;
Xa1=ones(1,N);
for k=1:20:N
    Xa1(k)=0;
end
Xa2=ones(1,N);
for j=1:30:N
    Xa2(j)=0;
end
for i=(p+1):N
    Xa1(i)=mod((Xa1(i-q)+Xa1(i-p)+Ca1(i-1)),b);
    Ya1(i)=Xa1(i)/(2^24);
    Ma1=Xa1(i-q)+Xa1(i-p)+Ca1(i-1);
    if(Ma1>=b)
        Ca1(i)=1;
    else
        Ca1(i)=0;
    end
end
for i=(p+1):N
    Xa2(i)=mod((Xa2(i-q)+Xa2(i-p)+Ca2(i-1)),b);
    Ya2(i)=Xa2(i)/(2^24);
    Ma2=Xa2(i-q)+Xa2(i-p)+Ca2(i-1);
    if(Ma2>=b)
        Ca2(i)=1;
    else
        Ca2(i)=0;
    end
end
ua1=cos(2*pi.*Ya1).*sqrt(-2.*log(Ya2)); 
figure
subplot(2,2,1)
plot(Ya1)
title("AWC-伪随机序列1")
xlabel('取样点数')
ylabel('信号幅度值')
xa1=Ya1;%% 计算均值方差
[fa1,xia1]=ksdensity(xa1);
xia1=xia1-0.5;
subplot(2,2,3)
plot(xia1,fa1)
title("统计概率密度1")
xlabel('均值')
ylabel('统计概率密度')

subplot(2,2,2)
plot(Ya2)
title("AWC-伪随机序列2")
xlabel('取样点数')
ylabel('信号幅度值')
xa2=Ya2;%% 计算均值方差
[fa2,xia2]=ksdensity(xa2);
xia2=xia2-0.5;
subplot(2,2,4)
plot(xia2,fa2)
title("统计概率密度2")
xlabel('均值')
ylabel('统计概率密度')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,2,1)
plot(Y1)
title("SWB-伪随机序列1")
xlabel('取样点数')
ylabel('信号幅度值')
x1=Y1;%% 计算均值方差
[f1,xi1]=ksdensity(x1);
xi1=xi1-0.5;
subplot(2,2,3)
plot(xi1,f1)
title("统计概率密度1")
xlabel('均值')
ylabel('统计概率密度')

subplot(2,2,2)
plot(Y2)
title("SWB-伪随机序列2")
xlabel('取样点数')
ylabel('信号幅度值')
x2=Y2;%% 计算均值方差
[f2,xi2]=ksdensity(x2);
xi2=xi2-0.5;
subplot(2,2,4)
plot(xi2,f2)
title("统计概率密度2")
xlabel('均值')
ylabel('统计概率密度')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,2,2)
plot(u1);
title("SWB-高斯随机序列")
xlabel('取样点数')
ylabel('信号幅度值')
for l=1:N
    if(u1(1,l)==inf)
        u1(1,l)=0;
    end
end
[f,xx]=ksdensity(u1);
subplot(2,2,4)
plot(xx,f);
title("统计概率密度2")
xlabel('均值')
ylabel('统计概率密度')
subplot(2,2,1)
plot(ua1);
title("AWC-高斯随机序列")
xlabel('取样点数')
ylabel('信号幅度值')
for l=1:N
    if(ua1(1,l)==inf)
        ua1(1,l)=0;
    end
end
[fa,xxa]=ksdensity(ua1);
subplot(2,2,3)
plot(xxa,fa);
title("统计概率密度1")
xlabel('均值')
ylabel('统计概率密度')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
  plot(xx,f,'blue')
  hold on;
  plot(xxa,fa,'r')
  title("SWB与AWC统计概率密度比较")
xlabel('均值')
ylabel('统计概率密度')
legend('SWB','AWC')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1)
plot(abs(fft(u1)))
title("SWB")
subplot(2,1,2)
plot(abs(fft(ua1)))
title("AWC")
y1=rms(u1);
ya=rms(ua1);
y1mean=mean(u1);
yamean=mean(ua1);
y1var=var(u1);
y1bvar=sqrt(y1var);
yavar=var(ua1);
yabvar=sqrt(yavar);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
awgn=randn([1,N]);
%figure
%plot(awgn)
%figure
[fawgn,xawgn]=ksdensity(awgn);
%plot(xawgn,fawgn)
%figure
%plot(abs(fft(awgn)))
yawgn=rms(awgn);%均方根
ymean=mean(awgn);%均值
yvar=var(awgn);%方差
ybvar=sqrt(yvar);