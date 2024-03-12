function nak=hat_x(m,p,omega,seed)
%nak:Nakagami-m随机变量实部
%m:Nakagami-m随机变量m值
%omega:功率Omega
%帽子函数系数计算

a=m/omega;
x_abs=sqrt((m+m*p-1)*omega/(2*m));
x0=x_abs;
b_x=(m/omega)^(((1+p)/2)*m)*(abs(x0)^((1+p)*m-1))/gamma(((1+p)/2)*m)*exp(-((m*x0^2)/omega));
C_x=b_x*sqrt(pi/a)*(1+erf(sqrt(a)*x0));

%step1:生成服从帽子majorizing density的随机变量
%计算反函数
syms v
fv = b_x*exp(-a*(abs(v)-x0).^2)/C_x;
int_v=double(int(fv,v,-3,3));
f1=fv/int_v;

x=-3:0.01:3;
y=zeros(1,length(x));
for i=1:length(x)
    xi=x(i);
    y(i)=double(int(f1,v,-3,xi));
end

%插值法生成随机变量
Np = 2^22;%需要的个数
randome=rand(1,Np)*max(y);
vi=interp1(y,x,randome, 'pchip');
vi=vi';%变成一列，即为所求
pts = linspace(-3,3,600); 
[f, v] = ksdensity(vi,pts);
figure;
plot(v,f);
hold on;
x=[-3:0.01:3];
g_x=b_x*exp(-a*(abs(x)-x0).^2)/C_x;
plot(x,g_x);
hold on;

%step2:采用接受-拒绝法由帽子函数生成目标函数
%计算实部x
Ns=2^21;
z_x=zeros(1,Ns);
rng(seed);
u=rand(1,Np);
j=1;
f_x=(m/omega)^(((1+p)/2)*m)*(abs(vi).^((1+p)*m-1))/gamma(((1+p)/2)*m).*exp(-((m*(vi.^2))/omega));
t_x=b_x*exp(-a*(abs(vi)-x0).^2);
ft=f_x./t_x;
for i=1:Np
    if u(i)<=ft(i)
        z_x(j)=vi(i);
        j=j+1;
    end
    if j>Ns
        break;
    end
end
fname=sprintf('data_x_m_%.2f_p_%.2f.mat',m,p);
save(fname,"z_x");
nak=z_x;
