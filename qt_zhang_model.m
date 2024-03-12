color=[142 182 156;238 191 109;217 79 51;131 64 38;33 158 188;0 47 73;122 27 100];
color=color/255;
%---------------m=1.2--------------%
m=1.2;
Ns=1000;
p=floor(2*m);
alpha=(2*p*m+sqrt(2*p*m*(p+1-2*m)))/p/(p+1);
beta=2*m-alpha*p;
eta=1/sqrt(alpha*p+beta);
x=zeros(1,Ns);
for n=1:p
randn('seed', n);
e = randn(1, Ns); % Gaussian noise
x=e.^2+x;
end
y = randn(1, Ns); % Gaussian noise
y=y.^2;
ans=sqrt(x*alpha+beta*y);
nak=eta*ans;
[b,a] = ksdensity(nak);
mu=1.2;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
f1=figure('Color','white');
figure(f1);
p1= plot(a,b,'-*','MarkerIndices',1:4:length(a));
hold on;
p2 = plot(x,y,'--');
p1(1).Color=color(4,:);
p2(1).Color=color(4,:);
hold on;
p1(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p2(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
xlabel('r');
ylabel('pdf(r)');
%---------------m=3.5--------------%
m=3.5;
Ns=1000;
p=floor(2*m);
alpha=(2*p*m+sqrt(2*p*m*(p+1-2*m)))/p/(p+1);
beta=2*m-alpha*p;
eta=1/sqrt(alpha*p+beta);
x=zeros(1,Ns);
for n=1:p
randn('seed', n);
e = randn(1, Ns); % Gaussian noise
x=e.^2+x;
end
y = randn(1, Ns); % Gaussian noise
y=y.^2;
ans=sqrt(x*alpha+beta*y);
nak=eta*ans;
[b,a] = ksdensity(nak);
mu=3.5;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p1= plot(a,b,'-*','MarkerIndices',1:4:length(a));
hold on;
p2 = plot(x,y,'--');
p1(1).Color='#03A89E';
p2(1).Color='#00C78C';
hold on;
p1(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p2(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
xlabel('r');
ylabel('pdf(r)');
%---------------m=5.5--------------%
m=5.5;
Ns=100000;
p=floor(2*m);
alpha=(2*p*m+sqrt(2*p*m*(p+1-2*m)))/p/(p+1);
beta=2*m-alpha*p;
eta=1/sqrt(alpha*p+beta);
x=zeros(1,Ns);
for n=1:p
randn('seed', n);
e = randn(1, Ns); % Gaussian noise
x=e.^2+x;
end
y = randn(1, Ns); % Gaussian noise
y=y.^2;
ans=sqrt(x*alpha+beta*y);
nak=eta*ans;
[b,a] = ksdensity(nak);
mu=5.5;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p3= plot(a,b,'-*','MarkerIndices',1:4:length(a));
hold on;
p4 = plot(x,y,'--');
hold on;
p3(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p4(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
p3(1).Color='#DA70D6';
p4(1).Color='#DDA0DD';
%---------------m=7.5--------------%
m=7.5;
Ns=100000;
p=floor(2*m);
alpha=(2*p*m+sqrt(2*p*m*(p+1-2*m)))/p/(p+1);
beta=2*m-alpha*p;
eta=1/sqrt(alpha*p+beta);
x=zeros(1,Ns);
for n=1:p
randn('seed', n);
e = randn(1, Ns); % Gaussian noise
x=e.^2+x;
end
y = randn(1, Ns); % Gaussian noise
y=y.^2;
ans=sqrt(x*alpha+beta*y);
nak=eta*ans;
[b,a] = ksdensity(nak);
mu=7.5;
omega=1;
x=0:.01:6;
y=2*mu.^mu.*x.^(2*mu-1).*exp(-mu*x.^2./omega)./gamma(mu)./omega^mu;
p5= plot(a,b,'r-*','MarkerIndices',1:4:length(a));
hold on;
p6 = plot(x,y,'r-');
hold on;
p5(1).LineWidth = 1.2;%设置第一个线条的线宽为2磅
p6(1).LineWidth = 1.2;%设置第二个线条的线宽为2磅
p5(1).Color='#ED9121';
p6(1).Color='#FF8000';
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
xlabel('r');
ylabel('pdf(r)');
axis([0 3 0 2.5]);
legend('m=1.2仿真值','m=1.2理论值','m=3.5仿真值','m=3.5理论值','m=5.5仿真值','m=5.5理论值','m=7.5仿真值','m=7.5理论值');
%title('qt.zhang模型不同m值的仿真结果');