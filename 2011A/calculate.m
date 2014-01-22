clear
r=[3.5 4 4.5 5];%3.5 4 4.5 5
v01=6;
v0=[4:0.1:8];
g=9.8;
mu=0.03;%Ä¦²ÁÏµÊý
w=6000;
w1=4000:100:10000;
m=70;
%h=v0^2/2/g-r*(exp(pi*mu)+1)*(2*mu+1)/(4*mu^2+1)
for i=1:4
    h1(i,:)=(-r(i)/(4*mu^2+1)*(exp(pi*mu)+1)*(2*mu+1)+v01^2/2/g+w1/m/g)*exp(-mu*pi);
    h(i,:)=(-r(i)/(4*mu^2+1)*(exp(pi*mu)+1)*(2*mu+1)+v0.^2/2/g+w/m/g)*exp(-mu*pi);
end
subplot(1,2,1);
plot(w1,h1)
hold on
plot(w1,0)
legend('r=3.5m','r=4m','r=4.5m','r=5m')
text(5000,0,'123');text(5000,0,'123')
subplot(1,2,2);
plot(v0,h)
hold on
plot(v0,0)
text(5,0,'123');text(5,0,'123')
legend('r=3.5m','r=4m','r=4.5m','r=5m')