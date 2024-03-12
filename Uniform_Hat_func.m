clc;clear all;
N=2^20;
color=[142 182 156;238 191 109;217 79 51;131 64 38;33 158 188;0 47 73;122 27 100];
color=color/255;

%产生[0,2pi]之间的均匀随机变量x
%产生[0,1]之间均匀随机变量u
%对于m=2的情况
m=1.25;
b=gamma(m)/2^m/(gamma(m/2)^2);
x=rand(N,1)*2*pi;
u=rand(N,1);
phase=zeros(N,1);
j=1;
for i=1:N
    f=gamma(m)*abs(sin(2*x(i))).^(m-1)./(2^m)./(gamma(m/2).^2);
    t=b;
    v=f/t;
    if u(i)<=v
        phase(j)=x(i);
        j=j+1;
    end
end    

xi=0:pi/100:2*pi;
num=phase(1:j-1);
[y1,x1]=ksdensity(num,xi);
f1=figure('Color','white');
figure(f1);

plot(x1,y1,'m-^','MarkerIndices',1:5:length(y1),'Color',color(1,:),'LineWidth',1.5);
hold on;
x = 0:0.01:2*pi;
y=gamma(m)*abs(sin(2*x)).^(m-1)./(2^m)./(gamma(m/2).^2);
plot(x,y,'k--');
hold on;


m=2.8;
b=gamma(m)/2^m/(gamma(m/2)^2);
x=rand(N,1)*2*pi;
u=rand(N,1);
phase=zeros(N,1);
j=1;
for i=1:N
    f=gamma(m)*abs(sin(2*x(i))).^(m-1)./(2^m)./(gamma(m/2).^2);
    t=b;
    v=f/t;
    if u(i)<=v
        phase(j)=x(i);
        j=j+1;
    end
end    

xi=0:pi/100:2*pi;

num=phase(1:j-1);
[y1,x1]=ksdensity(num,xi);


plot(x1,y1,'m-+','MarkerIndices',1:3:length(y1),'Color',color(2,:),'LineWidth',1.5);
hold on;
x = 0:0.01:2*pi;
y=gamma(m)*abs(sin(2*x)).^(m-1)./(2^m)./(gamma(m/2).^2);
plot(x,y,'k--');
hold on;

m=1.0;
b=gamma(m)/2^m/(gamma(m/2)^2);
x=rand(N,1)*2*pi;
u=rand(N,1);
phase=zeros(N,1);
j=1;
for i=1:N
    f=gamma(m)*abs(sin(2*x(i))).^(m-1)./(2^m)./(gamma(m/2).^2);
    t=b;
    v=f/t;
    if u(i)<=v
        phase(j)=x(i);
        j=j+1;
    end
end    

xi=0:pi/100:2*pi;
num=phase(1:j-1);
[y1,x1]=ksdensity(num,xi);

plot(x1,y1,'m-o','MarkerIndices',1:5:length(y1),'Color',color(3,:),'LineWidth',1.5);
hold on;
x = 0:0.01:2*pi;
y=gamma(m)*abs(sin(2*x)).^(m-1)./(2^m)./(gamma(m/2).^2);
plot(x,y,'k--');
grid on;

axis([0 2*pi 0 0.5]);
xticks([0,pi/4,pi/2,3*pi/4,pi,5*pi/4,3*pi/2,7*pi/4,2*pi]);    %位置指定为向量
xticklabels({'0','0.25\pi','0.5\pi/2','0.75\pi','\pi','1.25\pi','1.5\pi','1.75\pi','2\pi'});%关联的标签，用cell指定刻度标签
legend('m=1.25 仿真值','m=1.25 理论值','m=2.8 仿真值','m=2.8 理论值','m=1.0 仿真值','m=1.0 理论值');
xlabel('phase \theta','FontName','Microsoft YaHei');
ylabel('PDF of Phase','FontName','Microsoft YaHei');
