clc;clear;
%Box Muller方法生成独立的高斯随机变量
N = 1000000;
u = sqrt(-2*log(rand(1,N)));
v = 2*pi*rand(1,N);
x = u.*sin(v);
y = u.*cos(v);
%由高斯随机变量得到瑞利分布的随机变量
z=sqrt(x.^2+y.^2);
[a,b]=mycdf(0,0.1,6,z);
f1=figure('Color','white');
figure(f1);
plot(a,b,'+');
hold on;

omega=1;
x=0:0.05:6;
y=1-exp(-power(x,2)/(2*omega));
plot(x,y,'-');
legend('Rayleigh随机变量累积分布函数','Rayleigh分布函数理论公式')
title('Rayleigh累计分布函数cdf')
u=1-exp(-power(z,2)./(2*omega));

%将变量u保存
fid=fopen('data_u.txt','w');
dlmwrite('data_u.txt',u);
fclose(fid);





