clc;clear all;
%nakagami参数设置
m=1.4;
p=0.2;
omega=0.5;
%帽子函数系数计算
a=m/omega;
x_abs=sqrt((m+m*p-1)*omega/(2*m));
y_abs=sqrt((m-m*p-1)*omega/(2*m));
x0=x_abs;
y0=y_abs;
b_x=(m/omega)^(((1+p)/2)*m)*(abs(x0)^((1+p)*m-1))/gamma(((1+p)/2)*m)*exp(-((m*x0^2)/omega));
b_y=(m/omega)^(((1-p)/2)*m)*(abs(y0)^((1-p)*m-1))/gamma(((1-p)/2)*m)*exp(-((m*y0^2)/omega));
C_x=b_x*sqrt(pi/a)*(1+erf(sqrt(a)*x0));
C_y=b_y*sqrt(pi/a)*(1+erf(sqrt(a)*y0));
%%
% 比较帽子函数与目标分布
x=[-2:0.01:2];
y=[-2:0.01:2];
g_x=b_x*exp(-a*(abs(x)-x0).^2);
f_x=(m/omega)^(((1+p)/2)*m)*(abs(x).^((1+p)*m-1))/gamma(((1+p)/2)*m).*exp(-((m*(x.^2))/omega));
figure('Color','white');
subplot(121)
plot(x,g_x,'--');
hold on;
plot(x,f_x);
g_y=b_y*exp(-a*(abs(y)-y0).^2);
f_y=(m/omega)^(((1-p)/2)*m)*(abs(y).^((1-p)*m-1))/gamma(((1-p)/2)*m).*exp(-((m*y.^2)/omega));
h=text(-1.5,0.8,'$$f_X(x)$$');
set(h,'Interpreter','latex');

xlim([-2 2])
xx = -2:0.5:2;
xx_ = cell(1,length(xx));
xx_(1:2:end)=num2cell(-2:1:2);
set(gca,'xtick',xx, 'xticklabel',xx_)
ylim([0 0.9])
yy = 0:0.15:0.9;
yy_ = cell(1,length(yy));
yy_(1:2:end)=num2cell(0:0.3:0.9);
set(gca,'ytick',yy, 'yticklabel',yy_);
subplot(122)
plot(y,g_y,'--');
hold on;
plot(y,f_y);
h=text(-1.5,0.8,'$$f_Y(y)$$');
set(h,'Interpreter','latex');

xlim([-2 2])
xx = -2:0.5:2;
xx_ = cell(1,length(xx));
xx_(1:2:end)=num2cell(-2:1:2);
set(gca,'xtick',xx, 'xticklabel',xx_)
ylim([0 0.9])
yy = 0:0.15:0.9;
yy_ = cell(1,length(yy));
yy_(1:2:end)=num2cell(0:0.3:0.9);
set(gca,'ytick',yy, 'yticklabel',yy_);

