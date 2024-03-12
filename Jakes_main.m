% plot AWGN
% clear;clc
fd=926;     % ���Doppler
ts_mu=50;   % ����ʱ��
scale=1e-6;
ts=ts_mu*scale; %����ʱ��
fs=1/ts;    % sample frequency
Ns=1e5;     % ������

M=2^12;
t=(0:Ns-1)*ts;
tt=(0:M-1)*ts;
ff=[-M/2:M/2-1]/(M*ts*fd);
temp=zeros(3,Ns);

%generat channel information
    t_state=0;  % ��ʼ����ʱ��
    [h,t_state]=Jakes_model(fd,ts,Ns,t_state,1,0);  % generate channel
   %%���˹��������ķ����׼���ֵ��������
    x1=var(real(h));
    x11=sqrt(x1);
    x2=var(imag(h));
    x22=sqrt(x2);
    m_r=mean(real(h));
    m_i=mean(imag(h));
    %������
    x111=rms(real(h));
    x222=rms(imag(h));
%plot AWGN
figure(1);
subplot(221)
plot((1:Ns)*ts,real(h));
axis([0 5 -3 3]);
xlabel('ʱ��/s');ylabel('����');title('Jakesģ��ʵ������');
subplot(222)
plot((1:Ns)*ts,imag(h));
axis([0 5 -3 3]);
xlabel('ʱ��/s');ylabel('����');title('Jakesģ���鲿����');

%% �ŵ�����
subplot(223)
[f,xi]=ksdensity(real(h));
plot(xi,f);
axis([-3 3 0 0.6]);
xlabel('��ֵ');ylabel('ͳ�Ƹ����ܶ�');title('Jakesģ��ʵ������');
subplot(224)
[ff,xii]=ksdensity(imag(h));
plot(xii,ff);
axis([-3 3 0 0.6]);
xlabel('��ֵ');ylabel('ͳ�Ƹ����ܶ�');title('Jakesģ���鲿����');
figure(2);
[f,xi]=ksdensity(real(h));
[ff,xii]=ksdensity(imag(h));
plot(xi,f,'-');
hold on
plot(xii,ff,'--');
xlabel('��ֵ');ylabel('ͳ�Ƹ����ܶ�');title('��·��������ͳ�Ƹ����ܶȱȽ�');
% figure(3)
% plot(fft(abs(real(h))));