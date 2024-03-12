%--------------------------基于滤波法的逆变换模型-----------------------
%绘制生成变量的自相关特性曲线
r=readmatrix('data_r_fwgn.txt');
z=abs(r);
ang_r=angle(r);
z=z.*sqrt(2);
omega=1;
u=1-exp(-power(z,2)./(2*omega));

m=0.65;
a1=-0.0828;a2=-4.5634;a3=-15.8819;b1=63.1955;b2=23.2981;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
r1=Nak.*cos(ang_r)+Nak*1i.*sin(ang_r);

[ACF,lags,bounds]=autocorr(r1,1000);
acf=(ACF.*ACF+m)/(1+m);
f1=figure('Color','white');
figure(f1);
plot(lags(1:end),acf(1:end),'mo','MarkerIndices',1:20:length(lags)) ;
hold on;
%-------------------------------------
m=2;
a1=0.1890;a2=-0.0128;a3=0.2808;b1=-0.0809;b2=0.0638;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
r2=Nak.*cos(ang_r)+Nak*1i.*sin(ang_r);

[ACF,lags,bounds]=autocorr(r2,1000);
acf=(ACF.*ACF+m)/(1+m);
plot(lags(1:end),acf(1:end),'c*','MarkerIndices',1:20:length(lags)) ;
hold on;
grid on;

m=10;
a1=1.1088;a2=-1.6095;a3=0.6015;b1=-1.6046;b2=0.6488;
[Nak]=Count_Nak(a1,a2,a3,b1,b2,m,u);
Nak=Nak./sqrt(m/2);
r3=Nak.*cos(ang_r)+Nak*1i.*sin(ang_r);
[ACF,lags,bounds]=autocorr(r3,1000);
acf=(ACF.*ACF+m)/(1+m);
plot(lags(1:end),acf(1:end),'b+','MarkerIndices',1:20:length(lags)) ;
hold on ;

fc = 2e9; % carry frequency (Hz)
ts = 1e-4; % sample interval (s)
v = 25/3; % transmitter-receiver relative speed (m/s)
c = 3e8; % speed of light (m/s)
fd = v*fc/c; % maximum Doppler shift
tt = 0:ts:1000*ts;
J_autocorr = besselj(0,2*pi*fd*tt);
m=0.65;
acf1=(J_autocorr.^2+m)/(1+m);
m=2;
acf2=(J_autocorr.^2+m)/(1+m);
m=10;
acf3=(J_autocorr.^2+m)/(1+m);
plot(acf1,'m-');
hold on;
plot(acf2,'c-');
hold on;
plot(acf3,'b-');
hold on;
axis([0 500 0.3 1]);
legend('m=0.65仿真曲线','m=0.65理论曲线','m=2仿真曲线','m=2理论曲线','m=10仿真曲线','m=10理论曲线');
xlabel('lag x');ylabel('自相关函数');
%title('基于滤波法的逆变换模型自相关函数');
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
