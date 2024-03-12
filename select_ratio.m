%计算舍弃率
clc;
clear all;
m=1:1:10;
omega=1;
p=0;
g1=zeros(1,10);
g2=zeros(1,10);

for i=1:10
    mu=m(i);
    a=mu/omega;
    y0=sqrt((mu-1)*omega/(2*mu));
    b_y=(mu/omega)^(((1-p)/2)*mu)*(abs(y0)^((1-p)*mu-1))/gamma(((1-p)/2)*mu)*exp(-((mu*y0^2)/omega));
    C_y=b_y*sqrt(pi/a)*(1+erf(sqrt(a)*y0));
    g1(i)=1/C_y;
end
f1=figure('Color','white');
figure(f1);
plot(m,g1,'-o');
hold on;
for i=1:10
    mu=m(i)
    b=gamma(mu)/2^mu/(gamma(mu/2)^2);
    C=2*pi*b;
    g2(i)=1/C;
end
plot(m,g2,'-^');
legend('改进复Nakagami帽子函数','均匀帽子函数','FontName','Microsoft YaHei','FontSize',10);
xlabel('m','FontName','Microsoft YaHei');
ylabel('舍弃率','FontName','Microsoft YaHei');