%显示接收-拒绝法生成Nakagami-m随机变量相位分布
clc;clear all;
color=[142 182 156;238 191 109;217 79 51;131 64 38;33 158 188;0 47 73;122 27 100];
color=color/255;
%m=1.25,p=0.2的相位分布
x_data=load("data_x_m_1.25_p_0.20.mat");
y_data=load("data_y_m_1.25_p_0.20.mat");
m=1.25;
p=0.2;
r_real=cell2mat(struct2cell(x_data));
r_img=cell2mat(struct2cell(y_data));
nak=r_real+r_img*1i;
ang_r=angle(nak);
xi=-pi:pi/100:pi;
[b,a] = ksdensity(ang_r,xi);
f1=figure('Color','white');
figure(f1);
plot(a,b,'-+','MarkerIndices',1:5:length(a),'Color',color(1,:),'LineWidth',1.5);
hold on;
x=xi;
y=gamma(m)*abs(sin(2*x)).^(m-1)./(2^m)./(gamma((1+p)*m/2)*(gamma((1-p)*m/2)*abs(tan(x)).^(p*m)));
plot(x,y,'k-');
hold on;

%m=2.8,p=0.1的相位分布
x_data=load("data_x_m_2.80_p_0.10.mat");
y_data=load("data_y_m_2.80_p_0.10.mat");
r_real=cell2mat(struct2cell(x_data));
r_img=cell2mat(struct2cell(y_data));
nak=r_real+r_img*1i;
ang_r=angle(nak);
xi=-pi:pi/100:pi;
[b,a] = ksdensity(ang_r,xi);
plot(a,b,'-^','MarkerIndices',1:5:length(a),'Color',color(2,:),'LineWidth',1.5);
hold on;
x=xi;
m=2.80;
p=0.10;
y=gamma(m)*abs(sin(2*x)).^(m-1)./(2^m)./(gamma((1+p)*m/2)*(gamma((1-p)*m/2)*abs(tan(x)).^(p*m)));
plot(x,y,'k-');


%m=1.0,p=0的相位分布
x_data=load("data_x_m_1.00_p_0.00.mat");
y_data=load("data_y_m_1.00_p_0.00.mat");
r_real=cell2mat(struct2cell(x_data));
r_img=cell2mat(struct2cell(y_data));
nak=r_real+r_img*1i;
ang_r=angle(nak);
xi=-pi:pi/100:pi;
[b,a] = ksdensity(ang_r,xi);
plot(a,b,'-o','MarkerIndices',1:5:length(a),'Color',color(3,:),LineWidth=1.5);
hold on;
x=xi;
m=1.00;
p=0.00;
y=gamma(m)*abs(sin(2*x)).^(m-1)./(2^m)./(gamma((1+p)*m/2)*(gamma((1-p)*m/2)*abs(tan(x)).^(p*m)));
plot(x,y,'k-');

xlim([-pi pi])
x = -pi:pi/4:pi;
y=repmat(1/(2*pi),size(x));
x_label={'-\pi','-3\pi/4','-\pi/2','-\pi/4','0','\pi/4','\pi/2','3\pi/4','\pi'};
ylim([0 0.50]);
yy=0:0.05:0.50;
set(gca,'ytick',yy);
set(gca,'xtick',x, 'xticklabel',x_label);
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
legend('m=1.25;p=0.2 仿真值','m=1.25;p=0.2 理论值','m=2.8;p=0.1 仿真值','m=2.8;p=0.1 理论值','m=1.0;p=0 仿真值','m=1.0;p=0 理论值')
xlabel('phase \theta','FontName','Microsoft YaHei');
ylabel('PDF of Phase','FontName','Microsoft YaHei');
