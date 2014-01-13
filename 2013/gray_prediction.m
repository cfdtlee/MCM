function Y_gray=gray_prediction(X0,Y0,N)
%gray_prediction.m 
%X0 �Ա���
%Y0 Ӧ����
%N Ԥ�����N����

n=length(Y0);
lamda=Y0(1:n-1)./Y0(2:n) %�󼶱�
range=minmax(lamda)
y1=cumsum(Y0); %�ۼ�
for i=2:n
    z(i)=0.5*(y1(i)+y1(i-1));
end
B=[-z(2:n)',ones(n-1,1)]; %�������B������Y
Y=Y0(2:n)';
u=B\Y
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),y1(1)});
yuce1=subs(x,'t',[0:n+N-1]);
%digits(6),y=vpa(x) %Ϊ���Ԥ�⾫�ȣ��ȼ���Ԥ��ֵ������ʾ΢�ַ��̵Ľ�
temp=double(yuce1);
yuce=[Y0(1),diff(temp)];
Y_gray=yuce;
epsilon=Y0-yuce(1:n) %����в�
delta=abs(epsilon./Y0) %����������
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda %���㼶��ƫ��ֵ
figure;
plot(X0,Y0)
hold on
%plot(1997:2025,yuce)