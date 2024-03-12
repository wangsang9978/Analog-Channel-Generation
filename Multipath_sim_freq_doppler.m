clear all; 
N=8;% number of multipath arrivals 
a=rand(1,N)*1e-6; %amplitude 
tau=rand(2,N); %arrival time 
tau(2,:)=tau(2,:)*0.05 ;
tau(1,1)=0;
fc=500e6; % the frequency of the carry signal 
fs=20*fc;
t=[0:1/(fs):0.00000008]; 
n=1; 
signal=zeros(1,length(t));% transmitted signal 
T=0.02*(1e-6)*((fc*20));%s
signal(1,1:T)=ones(1,T);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_d=0.1*fc;
f_shift=rand(1,N)*2*f_d-f_d; %Doppler shifts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% signal1=[zeros(1,round((length(t)*tau(k,N)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,N)))-length(ones(1,T)))]
% signal=[0, zeros(1,0),ones(1,501),zeros(1,1000)]; % transmitted signal 
subplot(3,2,1);plot(t,signal); 
y_d_t1=signal;
xlabel('时间（s）') ;
ylabel('幅度'); 
title('u(t)') ;
y_d_t=exp(-j*2*pi*fc*tau(n))*[zeros(1,round((length(t)*0))),ones(1,T),zeros(1,(length(t)-round(length(t)*0))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t);
subplot(3,2,2) 
y_d_t2=y_d_t;
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') ;
title('u(t)乘载波') ;
k=1;
y_d_t=a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);
for n=2:N 
y_d_t=y_d_t+a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*0.6*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*0.6*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);

end 
subplot(3,2,5) 
y_d_t5=y_d_t;
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') ;
title('延迟较大，0.1fc，y（t）') ;
k=2;
y_d_t=a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);
for n=2:N 
y_d_t=y_d_t+a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*0.6*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*0.6*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);

end 
subplot(3,2,6) 
y_d_t6=y_d_t;
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') 
title('时延较小，0.1fc,y（t）') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_d=0.01*fc;
f_shift=rand(1,N)*2*f_d-f_d; %Doppler shifts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1;
y_d_t=a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);
for n=2:N 
y_d_t=y_d_t+a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*0.6*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*0.6*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);

end 
subplot(3,2,3)
y_d_t3=y_d_t;
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') ;
title('延迟较大，0.01fc，y（t）') ;
k=2;
y_d_t=a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);
for n=2:N 
y_d_t=y_d_t+a(n)*exp(-j*2*pi*fc*tau(k,n))*[zeros(1,round((length(t)*0.6*tau(k,n)))),ones(1,T),zeros(1,(length(t)-round(length(t)*0.6*tau(k,n)))-length(ones(1,T)))].*exp(j*2*pi*(fc)*t).*exp(j*2*pi*(f_shift(n))*t);

end 
subplot(3,2,4) 
y_d_t4=y_d_t;
plot(t,y_d_t) 
xlabel('时间（s）') ;
ylabel('幅度') 
title('时延较小，0.01fc,y（t）') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2)
subplot(3,2,1)
fft_out=abs(fft(y_d_t1));
fft_out_L=length(fft_out);
x=((1:1:fft_out_L)-fft_out_L/2)/fft_out_L*fs;
fft_exch=[fft_out(1,fft_out_L/2+1:fft_out_L),fft_out(1,1:fft_out_L/2+1)];
plot(x,fft_exch)
xlabel('频率（Hz）') ;
ylabel('幅度') 
title('u(t)') ;
subplot(3,2,2)
fft_out=abs(fft(y_d_t2));
fft_out_L=length(fft_out);
x=((1:1:fft_out_L)-fft_out_L/2)/fft_out_L*fs;
fft_exch=[fft_out(1,fft_out_L/2+1:fft_out_L),fft_out(1,1:fft_out_L/2+1)];
plot(x,fft_exch)
xlabel('频率（Hz）') ;
ylabel('幅度') 
title('u(t)乘载波') ;
subplot(3,2,3)
fft_out=abs(fft(y_d_t3));
fft_out_L=length(fft_out);
x=((1:1:fft_out_L)-fft_out_L/2)/fft_out_L*fs;
fft_exch=[fft_out(1,fft_out_L/2+1:fft_out_L),fft_out(1,1:fft_out_L/2+1)];
plot(x,fft_exch)
xlabel('频率（Hz）') ;
ylabel('幅度') 
title('延迟较大，0.01fc，y（t）') ;
subplot(3,2,4)
fft_out=abs(fft(y_d_t4));
fft_out_L=length(fft_out);
x=((1:1:fft_out_L)-fft_out_L/2)/fft_out_L*fs;
fft_exch=[fft_out(1,fft_out_L/2+1:fft_out_L),fft_out(1,1:fft_out_L/2+1)];
plot(x,fft_exch)
xlabel('频率（Hz）') ;
ylabel('幅度') 
title('时延较小，0.01fc,y（t）') ;
subplot(3,2,5)
fft_out=abs(fft(y_d_t5));
fft_out_L=length(fft_out);
x=((1:1:fft_out_L)-fft_out_L/2)/fft_out_L*fs;
fft_exch=[fft_out(1,fft_out_L/2+1:fft_out_L),fft_out(1,1:fft_out_L/2+1)];
plot(x,fft_exch)
xlabel('频率（Hz）') ;
ylabel('幅度')  
title('延迟较大，0.1fc，y（t）') ;
subplot(3,2,6)
fft_out=abs(fft(y_d_t6));
fft_out_L=length(fft_out);
x=((1:1:fft_out_L)-fft_out_L/2)/fft_out_L*fs;
fft_exch=[fft_out(1,fft_out_L/2+1:fft_out_L),fft_out(1,1:fft_out_L/2+1)];
plot(x,fft_exch)
xlabel('频率（Hz）') ;
ylabel('幅度') 
title('时延较小，0.1fc,y（t）') ;
%%%%%%%%%%%%%%%%%%%%%%%%%
f_d=0.1*fc;
f_shift=rand(1,N)*2*f_d-f_d; %Doppler shifts
k=1;
y_d_t=a(n)*exp(-j*2*pi*fc*tau(k,n)).*exp(j*2*pi*(f_shift(n))*t);
for n=2:N 
y_d_t=y_d_t+a(n)*exp(-j*2*pi*fc*tau(k,n)).*exp(j*2*pi*(f_shift(n))*t);
end 
fft_out=abs(fft(y_d_t));
fft_out_L=length(fft_out);
x=((1:1:fft_out_L)-fft_out_L/2)/fft_out_L*fs;
fft_exch=[fft_out(1,fft_out_L/2+1:fft_out_L),fft_out(1,1:fft_out_L/2+1)];
plot(x,fft_exch)
%%%%%%%%%%%%%%%%%%%%%%%%%
k=1;
h_1=zeros(1,length(s_f_b));
for n=1:N 
h_1=h_1+a(n)*exp(-j*2*pi*f*tau(k,n))*exp(j*2*pi*(f_shift(n)));
end 
y_1=fft_exch.*s_f_b;
h_2=zeros(1,length(s_f_b));
k=2;
for n=1:N 
h_2=h_2+a(n)*exp(-j*2*pi*f*tau(k,n))*exp(j*2*pi*(f_shift(n)));
end 
y_2=h_2.*s_f_b;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_d=0.01*fc;
f_shift=rand(1,N)*2*f_d-f_d; %Doppler shifts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1;
k=1;
h_3=zeros(1,length(s_f_b));
for n=1:N 
h_3=h_1+a(n)*exp(-j*2*pi*f*tau(k,n))*exp(j*2*pi*(f_shift(n)));
end 
y_3=h_3.*s_f_b;
h_4=zeros(1,length(s_f_b));
k=2;
for n=1:N 
h_4=h_4+a(n)*exp(-j*2*pi*f*tau(k,n))*exp(j*2*pi*(f_shift(n)));
end 
y_4=h_4.*s_f_b;
%%信道
figure (3)
subplot(2,2,1) 
plot(f,abs(h__1)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较大，0.1fc，信道') ;
subplot(2,2,2) 
plot(f,abs(h__2)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较大，0.01fc，信道') ;
subplot(2,2,3) 
plot(f,abs(h__3)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较小，0.1fc，信道') ;
subplot(2,2,4) 
plot(f,abs(h__4)) 
xlabel('频率（GHz）') ;
ylabel('幅度') 
title('时延较小，0.01fc，信道') 