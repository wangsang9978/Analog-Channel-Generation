%显示接收-拒绝法生成Nakagami-m随机变量包络分布
clc;clear all;
color=[142 182 156;238 191 109;217 79 51;131 64 38;33 158 188;0 47 73;122 27 100];
color=color/255;
%m=1.25,p=0.2的相位分布
x_data=load("data_x_m_1.25_p_0.20.mat");
y_data=load("data_y_m_1.25_p_0.20.mat");
r_real=cell2mat(struct2cell(x_data));
r_img=cell2mat(struct2cell(y_data));
nak=r_real+r_img*1i;
abs_r=abs(nak);
xi=0:0.03:3.0;
[b,a] = ksdensity(abs_r,xi);
f1=figure('Color','white');
figure(f1);
plot(a,b,'-+','MarkerIndices',1:3:length(a),'Color',color(1,:),'LineWidth',1.5);
hold on;
x=xi;
mu=1.25;
p=0.2;
omega=1.6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
plot(x,y,'k-');
hold on;

%m=2.8,p=0.1的相位分布
x_data=load("data_x_m_2.80_p_0.10.mat");
y_data=load("data_y_m_2.80_p_0.10.mat");
r_real=cell2mat(struct2cell(x_data));
r_img=cell2mat(struct2cell(y_data));
nak=r_real+r_img*1i;
abs_r=abs(nak);
xi=0:0.03:3.0;
[b,a] = ksdensity(abs_r,xi);
plot(a,b,'-^','MarkerIndices',1:3:length(a),'Color',color(2,:),'LineWidth',1.5);
hold on;
x=xi;
mu=2.80;
p=0.10;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
plot(x,y,'k-');


%m=1.0,p=0的相位分布
x_data=load("data_x_m_1.00_p_0.00.mat");
y_data=load("data_y_m_1.00_p_0.00.mat");
r_real=cell2mat(struct2cell(x_data));
r_img=cell2mat(struct2cell(y_data));
nak=r_real+r_img*1i;
abs_r=abs(nak);
xi=0:0.03:3.0;
[b,a] = ksdensity(abs_r,xi);
plot(a,b,'-o','MarkerIndices',1:3:length(a),'Color',color(3,:),LineWidth=1.5);
hold on;
x=xi;
mu=1.00;
p=0.00;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
plot(x,y,'k-');

xlim([0 3])
x = 0:0.25:3;
x_cell = cell(1,length(x));
x_cell(1:2:end)=num2cell(0:0.5:3);
set(gca,'xtick',x, 'xticklabel',x_cell);
ylim([0 1.2]);
yy=0:0.1:1.2;
y_cell = cell(1,length(yy));
y_cell(1:2:end)=num2cell(0:0.2:1.2);
set(gca,'ytick',yy,'yticklabel',y_cell);
%grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
legend('m=1.25;p=0.2 仿真值','m=1.25;p=0.2 理论值','m=2.8;p=0.1 仿真值','m=2.8;p=0.1 理论值','m=1.0;p=0 仿真值','m=1.0;p=0 理论值')
xlabel('r','FontName','Microsoft YaHei');
ylabel('f(r)','FontName','Microsoft YaHei');
