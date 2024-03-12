clear;close;clc;
%对比逆变换的两种方法并显示图像
%生成具有自相关特性的随机变量
%导入具有自相关特性的Raylegh随机变量的逆变换
u=importdata('data_u.txt');
color=[142 182 156;238 191 109;217 79 51;131 64 38;33 158 188;0 47 73;122 27 100];
color=color/255;
%m=0.65
m=0.65;
a1=-0.0828;a2=-4.5634;a3=-15.8819;b1=63.1955;b2=23.2981;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
[b,a] = ksdensity(Nak);
% nakagami分布的概率密度的理论表达式
mu=0.65;
omega=2;
f1=figure('Color','white');
figure(f1);
tiledlayout(1,2,'TileSpacing','compact','Padding','tight')
x=0:.1:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
%在右子图显示
nexttile
p1 = plot(a,b,'-*','MarkerIndices',1:4:length(a),'Color',color(1,:),LineWidth=1.0);
hold on;
p2 = plot(x,y,'--','Color',color(1,:),LineWidth=1.0);
hold on;

% m=2的仿真结果
m=2;
a1=0.1890;a2=-0.0128;a3=0.2808;b1=-0.0809;b2=0.0638;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
[b,a] = ksdensity(Nak);

% nakagami分布的概率密度的理论表达式
mu=2;
omega=2;
x=0:.1:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p3 = plot(a,b,'-s','MarkerIndices',1:4:length(a),'Color',color(2,:),LineWidth=1.0);
hold on;
p4 = plot(x,y,'--','Color',color(2,:),LineWidth=1.0);
hold on;
% m=10的仿真结果
m=10.0;
a1=1.1088;a2=-1.6095;a3=0.6015;b1=-1.6046;b2=0.6488;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
[b,a] = ksdensity(Nak);
% nakagami分布的概率密度的理论表达式
mu=10.0;
omega=2;
x=0:.1:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p5 = plot(a,b,'-+','MarkerIndices',1:2:length(a),'Color',color(3,:),LineWidth=1.0);
hold on;
p6 = plot(x,y,'--','Color',color(3,:),LineWidth=1.0);
hold on;
axis([0 3 0 2]);
xlabel('r');
ylabel('f(r)');
legend('m=0.65,\Omega=2.0仿真','m=0.65,\Omega=2.0理论', ...
    'm=2.0,\Omega=2.0仿真','m=2.0,\Omega=2.0理论', ...
    'm=10.0,\Omega=2.0仿真','m=10.0,\Omega=2.0理论');

%生成独立的均匀随机变量
u=unifrnd(0,1,1,1000000);
%m=0.65
m=0.65;
a1=-0.0828;a2=-4.5634;a3=-15.8819;b1=63.1955;b2=23.2981;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
[b,a] = ksdensity(Nak);
% nakagami分布的概率密度的理论表达式
mu=0.65;
omega=2;
x=0:.1:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
nexttile
p1 = plot(a,b,'-*','MarkerIndices',1:4:length(a),'Color',color(1,:),LineWidth=1.0);
hold on;
p2 = plot(x,y,'--','Color',color(1,:),LineWidth=1.0);
hold on;

% m=2的仿真结果
m=2;
a1=0.1890;a2=-0.0128;a3=0.2808;b1=-0.0809;b2=0.0638;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
[b,a] = ksdensity(Nak);

% nakagami分布的概率密度的理论表达式
mu=2;
omega=2;
x=0:.1:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p3 = plot(a,b,'-s','MarkerIndices',1:4:length(a),'Color',color(2,:),LineWidth=1.0);
hold on;
p4 = plot(x,y,'--','Color',color(2,:),LineWidth=1.0);
hold on;
% m=10的仿真结果
m=10.0;
a1=1.1088;a2=-1.6095;a3=0.6015;b1=-1.6046;b2=0.6488;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
[b,a] = ksdensity(Nak);
% nakagami分布的概率密度的理论表达式
mu=10.0;
omega=2;
x=0:.1:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p5 = plot(a,b,'-+','MarkerIndices',1:2:length(a),'Color',color(3,:),LineWidth=1.0);
hold on;
p6 = plot(x,y,'--','Color',color(3,:),LineWidth=1.0);
hold on;
axis([0 3 0 2]);
xlabel('r');
ylabel('f(r)');
legend('m=0.65,\Omega=2.0仿真','m=0.65,\Omega=2.0理论', ...
    'm=2.0,\Omega=2.0仿真','m=2.0,\Omega=2.0理论', ...
    'm=10.0,\Omega=2.0仿真','m=10.0,\Omega=2.0理论');