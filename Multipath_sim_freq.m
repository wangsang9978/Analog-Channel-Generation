clear all; 
N=8;% number of multipath arrivals 
a=rand(1,N)*1e-6; %amplitude 
tau=rand(2,N); %arrival time 
tau(2,:)=tau(2,:)*0.05 ;
tau(1,1)=0;
fc=500e6; % the frequency of the carry signal 
t=[0:1/(fc*10):0.0000008]; 
n=1; 
signal=zeros(1,length(t));% transmitted signal 
T=0.008*(1e-6)*((fc*20));%s
signal(1,1:T)=ones(1,T);
y_d_t=exp(-j*2*pi*fc*tau(n))*[zeros(1,round((length(t)*0))),ones(1,T),zeros(1,(length(t)-round(length(t)*0))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t);
s_f=fft(y_d_t)
ban=(length(s_f)-1)/2;
s_f_z=s_f([1:ban]);
s_f_f=s_f([ban+1:length(s_f)])
s_f_b=[s_f_f,s_f_z]
% fs=2*fc;
f_s=([0:length(s_f_b)-1]-ban-1)*fc*10/(length(s_f))/1e9;
f=f_s;
% signal1=[zeros(1,round((length(t)*tau(k,N)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,N)))-length(ones(1,T)))]
% signal=[0, zeros(1,0),ones(1,501),zeros(1,1000)]; % transmitted signal 

k=1;
h_1=zeros(1,length(s_f_b));
for n=1:N 
h_1=h_1+a(n)*exp(-j*2*pi*f*tau(k,n));
end 
y_1=h_1.*s_f_b;
h_2=zeros(1,length(s_f_b));
k=2;
for n=1:N 
h_2=h_2+a(n)*exp(-j*2*pi*f*tau(k,n));
end 
y_2=h_2.*s_f_b;
%%
figure(1);
subplot(3,2,1);plot(f_s,abs(s_f_b)); 
xlabel('频率（GHz）') ;
ylabel('幅度'); 
title('u(t)') ;
title('u(t)乘载波') ;
%%
subplot(3,2,3) 
plot(f,abs(h_1)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较大，多径信道') ;
%%
subplot(3,2,2);
plot(f_s,angle(s_f_b)); 
xlabel('频率（GHz）') ;
ylabel('幅度'); 
title('u(t)') ;
title('u(t)乘载波') ;
%%
subplot(3,2,4) 
plot(f,angle(h_1)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较大，多径信道') ;
%%
subplot(3,2,5) ;
plot(f,abs(y_1)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较大，多径信道') ;
%%
subplot(3,2,6) ;
plot(f,angle(y_1)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较大，多径信道') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
subplot(3,2,1);plot(f_s,abs(s_f_b)); 
xlabel('频率（GHz）') ;
ylabel('幅度'); 
title('u(t)') ;
title('u(t)乘载波') ;
%%
subplot(3,2,3) 
plot(f,abs(h_2)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较小，多径信道') ;

%%
subplot(3,2,2);
plot(f_s,angle(s_f_b)); 
xlabel('频率（GHz）') ;
ylabel('幅度'); 
title('u(t)') ;
title('u(t)乘载波') ;
%%
subplot(3,2,4) 
plot(f,angle(h_2)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较小，多径信道') ;
%%
subplot(3,2,5) ;
plot(f,abs(y_2)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较小，多径信道') ;
%%
subplot(3,2,6) ;
plot(f,angle(y_2)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较小，多径信道') ;
figure (2)
subplot(1,2,1) ;
plot(f,abs(h_2)) 
hold on;
plot(f,abs(h_1)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
legend('时延较小','时延较大') ;
title('多径信道') ;
subplot(1,2,2) ;
plot(f,angle(h_2)) 
hold on;
plot(f,angle(h_1)) 
xlabel('频率（GHz）') ;
ylabel('相位') 
legend('时延较小','时延较大') ;
title('多径信道') 