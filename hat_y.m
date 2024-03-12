function nak=hat_y(m,p,omega,seed)
%nak:Nakagami-m随机变量实部
%m:Nakagami-m随机变量m值
%omega:功率Omega

%帽子函数系数计算

a=m/omega;
y_abs=sqrt((m-m*p-1)*omega/(2*m));
y0=y_abs;
b_y=(m/omega)^(((1-p)/2)*m)*(abs(y0)^((1-p)*m-1))/gamma(((1-p)/2)*m)*exp(-((m*y0^2)/omega));
C_y=b_y*sqrt(pi/a)*(1+erf(sqrt(a)*y0));

% 计算虚部y
%%
%step1:生成服从帽子majorizing density的随机变量
%计算反函数
syms v
fv = b_y*exp(-a*(abs(v)-y0).^2)/C_y;
int_v=double(int(fv,v,-3,3));
f2=fv/int_v;

x=-3:0.01:3;
y=zeros(1,length(x));
for i=1:length(x)
    xi=x(i);
    y(i)=double(int(f2,v,-3,xi));
end
%插值法生成随机变量
Np = 2^22;
randome=rand(1,Np)*max(y);
vi=interp1(y,x,randome, 'pchip');
vi=vi';
figure;
pts = linspace(-3,3,600); 
[f, v] = ksdensity(vi,pts);
plot(v,f);
hold on;
y=[-3:0.01:3];
g_y=b_y*exp(-a*(abs(y)-y0).^2)/C_y;
plot(y,g_y);
hold on;
legend("simulation","function");
%%
%step2:采用接受-拒绝法由帽子函数生成目标函数
%计算虚部y
Ns=2^21;
z_y=zeros(1,Ns);
j=1;
t_y=b_y*exp(-a*(abs(vi)-y0).^2);
f_y=(m/omega)^(((1-p)/2)*m)*(abs(vi).^((1-p)*m-1))/gamma(((1-p)/2)*m).*exp(-((m*vi.^2)/omega));
rng(seed);
u=rand(1,Np);
j=1;
ft=f_y./t_y;
for i=1:Np
    if u(i)<=ft(i)
        z_y(j)=vi(i);
        j=j+1;
    end
    if j>Ns
        break;
    end
end
fname=sprintf('data_y_m_%.2f_p_%.2f.mat',m,p);
save(fname,"z_y");
nak=z_y;