% �������
N = 10000;     % ���������������
men = 0;    % ��ֵ
variance = 1;   % ����

% ���ɷ��Ӹ�˹�ֲ��������
awgn = norminv(rand(N, 1), men, sqrt(variance));

% ��ʾ���ɵ������
randNum=awgn;
mu=mean(randNum);
sigma=std(randNum);
sigma2=var(randNum);
 data2=(randNum-mu)./sigma;
 [y,x] = ksdensity(data2);
 figure ;
plot(x,y,'k--','LineWidth',1.0);
xlabel('x');
ylabel('pdf(x)');
legend('��任����������','��������\sigma=1,\mu=0');
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);

Fs=1/32;
N=10000
Y = fft( data2,N)/N*2;   %����N����2������ʵ��ֵ��NԽ�󣬷�ֵ����Խ��
 
f = Fs/N*(0:1:N-1); %Ƶ��
 
A = abs(Y);     %��ֵ
 
P = angle(Y);   %��ֵ
 
figure ;
 
subplot(211);plot(f(1:N/2),A(1:N/2));   %����fft����ֵ�����ݽṹ���жԳ���,�������ֻȡǰһ��
 
title('��ֵƵ��')
 
xlabel('Ƶ��(Hz)')
 
ylabel('��ֵ')
 
subplot(212);plot(f(1:N/2),P(1:N/2));
 
title('��λ��Ƶ')
 
xlabel('Ƶ��(Hz)')
 
ylabel('��λ')