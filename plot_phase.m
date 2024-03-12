%显示坐标
clc;clear all;
r=readmatrix('data_r_fwgn.txt');
z=abs(r);
ang_r=angle(r)+pi;
[b,a] = ksdensity(ang_r);
f1=figure('Color','white');
figure(f1);
plot(a,b,'k-');
hold on;
plot(a,b,'-+');
xlim([0 2*pi])
x = 0:pi/3:2*pi;
y=repmat(1/(2*pi),size(x));
x_label={'0','\pi/3','2\pi/3','\pi','4\pi/3','5\pi/3','2\pi'};
ylim([0 0.2]);
yy=0:0.02:0.2;
set(gca,'ytick',yy);
set(gca,'xtick',x, 'xticklabel',x_label);
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
legend('理论值','仿真值','FontName','Microsoft YaHei');
xlabel('phase \theta','FontName','Microsoft YaHei');
ylabel('PDF of Phase','FontName','Microsoft YaHei');