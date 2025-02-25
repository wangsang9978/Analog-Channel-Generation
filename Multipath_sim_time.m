clear all; 
N=8;% number of multipath arrivals 
a=rand(1,N)*1e-6; %amplitude 
tau=rand(2,N); %arrival time 
tau(2,:)=tau(2,:)*0.05 ;
tau(1,1)=0;
fc=500e6; % the frequency of the carry signal 
t=[0:1/(fc*20):0.00000008]; 
n=1; 
signal=zeros(1,length(t));% transmitted signal 
T=0.008*(1e-6)*((fc*20));%s
signal(1,1:T)=ones(1,T);

% signal1=[zeros(1,round((length(t)*tau(k,N)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,N)))-length(ones(1,T)))]
% signal=[0, zeros(1,0),ones(1,501),zeros(1,1000)]; % transmitted signal 
subplot(2,2,1);plot(t,signal); 
xlabel('时间（s）') ;
ylabel('幅度'); 
title('u(t)') ;
y_d_t=exp(-1i*2*pi*fc*tau(n))*[zeros(1,round((length(t)*0))),ones(1,T),zeros(1,(length(t)-round(length(t)*0))-length(ones(1,T)))].*exp(1i*2*pi*(fc)*t);
subplot(2,2,2) 
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') ;
title('u(t)乘载波') ;
k=1;
y_d_t=a(n)*exp(-1i*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,n)))-length(ones(1,T)))].*exp(1i*2*pi*(fc)*t);
for n=2:N 
y_d_t=y_d_t+a(n)*exp(-1i*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*0.6*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*0.6*tau(k,n)))-length(ones(1,T)))].*exp(1i*2*pi*(fc)*t);

end 
subplot(2,2,3) 
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') ;
title('延迟较大，y（t）') ;
k=2;
y_d_t=a(n)*exp(-1i*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,n)))-length(ones(1,T)))].*exp(1i*2*pi*(fc)*t);
for n=2:N 
y_d_t=y_d_t+a(n)*exp(-1i*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*0.6*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*0.6*tau(k,n)))-length(ones(1,T)))].*exp(1i*2*pi*(fc)*t);

end 
subplot(2,2,4) 
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') 
title('时延较小，y（t）') ;
