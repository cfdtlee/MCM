
clc,clear
y=1997:2012;
x0=[5566.03	5435.39	5590.88	5497.59	5567.43	5497.28	5320.4	5547.8	5632.98	5794.97	5818.67	5909.95	5965.15	6021.99	6107.18	6141.8];
n=length(x0);
lamda=x0(1:n-1)./x0(2:n) %求级比
range=minmax(lamda)
x1=cumsum(x0); %累加
for i=2:n
z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-z(2:n)',ones(n-1,1)]; %构造矩阵B和向量Y
Y=x0(2:n)';
u=B\Y
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
yuce1=subs(x,'t',[0:n+3]);
%digits(6),y=vpa(x) %为提高预测精度，先计算预测值，再显示微分方程的解
temp=double(yuce1);
yuce=[x0(1),diff(temp)];
epsilon=x0-yuce(1:n) %计算残差
delta=abs(epsilon./x0) %计算相对误差
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda %计算级比偏差值
figure;
plot(y,x0)
hold on
plot(1997:2016,yuce)
yuce