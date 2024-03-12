function [a,b]=qz_m2(m,Ns)
%m:Nakagami分布m值
%Ns:返回变量个数
%a:绘制的pdf曲线横坐标的值
%b:绘制的pdf曲线纵坐标的值
p=floor(2*m);
alpha=(2*p*m+sqrt(2*p*m*(p+1-2*m)))/p/(p+1);
beta=2*m-alpha*p;
eta=1/sqrt(alpha*p+beta);
eps=2*m-p;
q=0;
if eps <=0.3
    q=4;
elseif eps<=0.7
    q=3;
elseif m>=1.5
    q=2;
else q=2;
end

x=zeros(1,Ns);
for n=1:p
randn('seed', n);
e = randn(1, Ns); % Gaussian noise
x=e.^2+x;
end
y = randn(1, Ns); % Gaussian noise
y=abs(y);
y=y.^q;
ans=sqrt(x*alpha+beta*y);
nak=eta*ans;
[b,a] = ksdensity(nak);