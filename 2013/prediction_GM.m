
clc,clear
y=1997:2012;
x0=[5566.03	5435.39	5590.88	5497.59	5567.43	5497.28	5320.4	5547.8	5632.98	5794.97	5818.67	5909.95	5965.15	6021.99	6107.18	6141.8];
n=length(x0);
lamda=x0(1:n-1)./x0(2:n) %�󼶱�
range=minmax(lamda)
x1=cumsum(x0); %�ۼ�
for i=2:n
z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-z(2:n)',ones(n-1,1)]; %�������B������Y
Y=x0(2:n)';
u=B\Y
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
yuce1=subs(x,'t',[0:n+3]);
%digits(6),y=vpa(x) %Ϊ���Ԥ�⾫�ȣ��ȼ���Ԥ��ֵ������ʾ΢�ַ��̵Ľ�
temp=double(yuce1);
yuce=[x0(1),diff(temp)];
epsilon=x0-yuce(1:n) %����в�
delta=abs(epsilon./x0) %����������
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda %���㼶��ƫ��ֵ
figure;
plot(y,x0)
hold on
plot(1997:2016,yuce)
yuce