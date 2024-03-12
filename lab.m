%比较qt.zhang模型以及qt.zhang修正模型，并绘制其pdf曲线进行对比
clc;clear all;
color=[142 182 156;238 191 109;217 79 51;131 64 38;33 158 188;0 47 73;122 27 100];
color=color/255;
%---------------m=1.0--------------%
m=1.0;
Ns=1000000;
mu=m;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
f1=figure('Color','white');
figure(f1);
tiledlayout(1,2,'TileSpacing','compact','Padding','tight')
%subplot(121);
nexttile
[a1,b1]=qz_m1(m,Ns);
p1= plot(a1,b1,'-*','MarkerIndices',1:4:length(a1));
hold on;
p2 = plot(x,y,'--');
hold on;
p1(1).Color=color(1,:);
p2(1).Color=color(1,:);
p1(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p2(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
xlabel('r');
ylabel('f(r)');
%---------------m=1.2--------------%
m=1.2;
Ns=1000000;
mu=m;
omega=1;
[a2,b2]=qz_m1(m,Ns);
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p3= plot(a2,b2,'-*','MarkerIndices',1:4:length(a2));
hold on;
p4 = plot(x,y,'--');
hold on;
p3(1).Color=color(3,:);
p4(1).Color=color(3,:);
p3(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p4(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
% 
% %---------------m=1.3--------------%
m=1.3;
Ns=1000000;
[a3,b3]=qz_m1(m,Ns);
mu=m;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p5= plot(a3,b3,'-*','MarkerIndices',1:4:length(a3));
hold on;
p6 = plot(x,y,'--');
hold on;
p5(1).Color=color(4,:);
p6(1).Color=color(4,:);
p5(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p6(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
%设置x轴和y轴刻度
xlim([0 2.5]);
xx = 0:0.25:2.5;
xx_ = cell(1,length(xx));
xx_(1:4:end)=num2cell(0:1.0:2.5);
set(gca,'xtick',xx, 'xticklabel',xx_)
ylim([0 1.1]);
yy = 0:0.1:1.1;
yy_ = cell(1,length(yy));
yy_(1:2:end)=num2cell(0:0.2:1.1);
set(gca,'ytick',yy, 'yticklabel',yy_);
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
%%----------------------------使用qt.zhang修正模型----------------------------%%
%subplot(122);
nexttile
%---------------m=1.0--------------%
m=1.0;
Ns=1000000;
mu=m;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
[a1,b1]=qz_m2(m,Ns);
p1= plot(a1,b1,'-*','MarkerIndices',1:4:length(a1));
hold on;
p2 = plot(x,y,'--');
hold on;
p1(1).Color=color(1,:);
p2(1).Color=color(1,:);
p1(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p2(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
xlabel('r');
ylabel('f(r)');
%---------------m=1.2--------------%
m=1.2;
Ns=1000000;
mu=m;
omega=1;
[a2,b2]=qz_m2(m,Ns);
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p3= plot(a2,b2,'-*','MarkerIndices',1:4:length(a2));
hold on;
p4 = plot(x,y,'--');
hold on;
p3(1).Color=color(3,:);
p4(1).Color=color(3,:);
p3(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p4(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
% 
% %---------------m=1.4--------------%
m=1.4;
Ns=1000000;
[a3,b3]=qz_m2(m,Ns);
mu=m;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p5= plot(a3,b3,'-*','MarkerIndices',1:4:length(a3));
hold on;
p6 = plot(x,y,'--');
hold on;
p5(1).Color=color(4,:);
p6(1).Color=color(4,:);
p5(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p6(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
%设置x轴和y轴刻度
xlim([0 2.5]);
xx = 0:0.25:2.5;
xx_ = cell(1,length(xx));
xx_(1:4:end)=num2cell(0:1.0:2.5);
set(gca,'xtick',xx, 'xticklabel',xx_)
ylim([0 1.1]);
yy = 0:0.1:1.1;
yy_ = cell(1,length(yy));
yy_(1:2:end)=num2cell(0:0.2:1.1);
set(gca,'ytick',yy, 'yticklabel',yy_);
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
legend('m=1.0仿真值','m=1.0理论值','m=1.2仿真值','m=1.2理论值','m=1.4仿真值','m=1.4理论值');

