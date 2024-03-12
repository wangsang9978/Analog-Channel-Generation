function [Nak]=Count_Nak(a1,a2,a3,b1,b2,m,data_u)
%½üËÆÄæcdfº¯Êý
u=data_u;
x=power(sqrt(log(1./(1-u))),1/m);
[Nak]=x+(a1*x+a2*power(x,2)+a3*power(x,3))./(1+b1*x+b2*power(x,2));
