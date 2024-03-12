clc;clear all;
%nakagami参数设置
m=1.25;
omega=1.6;
p=0.2;
%调用自定义函数生成实部和虚部随机变量
seed1=1;
seed2=2;
z_x=hat_x(m,p,omega,seed1);
z_y=hat_y(m,p,omega,seed2);
%验证包络
z=sqrt(z_x.^2+z_y.^2);
pts = linspace(0,3,300); 
[f, z] = ksdensity(z,pts);
figure;
plot(z,f);
hold on;
x=linspace(0,3,300);
y = pdf('Nakagami', x, m, omega);  % 计算概率密度函数
plot(x,y);
legend("simulate","theoretical");

