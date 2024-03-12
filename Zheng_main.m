% �Ľ�Jakesģ�ͣ�Ҳ����Zhengģ��
clear;clc;
fd=926;
ts=5e-5;
Ns=1e5;
M=2^12;

t=(0:Ns-1)*ts;
tt=(0:M-1)*ts;
ff=[-M/2:M/2-1]/(M*ts*fd);
temp=zeros(3,Ns);

h=zheng_model(8,fd,t);
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
%���Ⱥ���λ�ֲ�����
[f,xi]=ksdensity(real(h));
[f2,xii]=ksdensity(imag(h));

%% ��ͼ�����ȡ����ȷֲ�����λ�ֲ�
figure(1);
%��������
subplot(221);
plot(t,(real(h)));
xlabel('ʱ��/s');ylabel('����');title('Zhengģ��ʵ������');
% axis([0 0.2 -50 10])
subplot(222)
plot(t,(imag(h)));
% axis([0 0.2 -50 10]);
xlabel('ʱ��/s');ylabel('����');title('Zhengģ��ʵ������');
% axis([0 0.2 -50 10]);
subplot(223);
plot(xi,f);
xlabel('��ֵ');ylabel('ͳ�Ƹ����ܶ�');title('Zhengģ��ʵ������');
subplot(224);
plot(xii,f2);
xlabel('��ֵ');ylabel('ͳ�Ƹ����ܶ�');title('Zhengģ���鲿����');
figure(2);
[f,xi]=ksdensity(real(h));
[ff,xii]=ksdensity(imag(h));
plot(xi,f,'-');
hold on
plot(xii,ff,'--');
xlabel('��ֵ');ylabel('ͳ�Ƹ����ܶ�');title('��·��������ͳ�Ƹ����ܶȱȽ�');