%滤波法及Jakes模型产生具有自相关特性的Rayleigh随机变量
fc = 2e9; % 载波 (Hz)
ts = 1e-4; % 采样间隔 (s)
v = 25/3; % 收发机相对运动速度 (m/s)
c = 3e8; % 光速 (m/s)
fd = v*fc/c; % 多普勒扩展
Ns = 1000000; 
x = (randn(Ns, 1) + sqrt(-1)*randn(Ns, 1))/sqrt(2); % 高斯白噪声

%---------------------Jakes模型-------------------------%
Ts=ts;
t_state=0;
[c1,t_state]=Jakes_Flat(fd,Ts,Ns,t_state,1,0);
%----------------------滤波法---------------------------%

fs = 1/ts; % 采样频率
f_limit = floor(fd*Ns/fs); % |f| <= fd
f = 0:fs/Ns:f_limit*fs/Ns;
Sc = 1./(pi*fd*sqrt(1-(f/fd).^2)); % 多普勒功率谱

G = sqrt(Sc);
G_hat = zeros(Ns,1);
G_hat(1:f_limit+1) = G(1:end);
G_hat(end-f_limit+1:end) = G(end:-1:2);

X = x*sqrt(Ns)/std(G_hat); % make c2 have unit variance
c2 = ifft(G_hat.*X);

%------------------------------------------------
f1=figure('Color','white');
figure(f1);
% h = findobj(gca,'Type','patch');
% h.FaceColor = 'w';
% h.EdgeColor = 'k';
subplot(2,2,1)
hist(abs(c1),50);
title('叠加法幅度统计分布');
xlabel('幅度');
ylabel('次数');

subplot(2,2,2)
hist(abs(c2),50);
title('滤波法幅度统计分布');
xlabel('幅度');
ylabel('次数');
subplot(2,2,3)
hist(angle(c1),50);
title('叠加法相位统计分布');
xlabel('相位');
ylabel('次数');

subplot(2,2,4);
hist(angle(c2),50);
title('滤波法相位统计分布');
xlabel('相位');
ylabel('次数');
%-------------------------------------------------


f2=figure('Color','white');
figure(f2);
[ACF,lags,bounds]=autocorr(c1,500);
plot(lags(1:end),ACF(1:end),'m-o','MarkerIndices',1:20:length(lags)) ;
hold on;

[ACF,lags,bounds]=autocorr(c2,500);
plot(lags(1:end),ACF(1:end),'b-*','MarkerIndices',1:25:length(lags)) ;


tt = 0:ts:500*ts;
J_autocorr = besselj(0,2*pi*fd*tt);
hold on
plot(0:500,J_autocorr,'g--');

xlabel('lag x');ylabel('Autocorrelation');
legend('叠加法','滤波法','理论曲线');
title('自相关函数');
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);

fid=fopen('data_r_jakes.txt','w');
dlmwrite('data_r_jakes.txt',c1);
fclose(fid);

fid=fopen('data_r_fwgn.txt','w');
dlmwrite('data_r_fwgn.txt',c2);
fclose(fid);
