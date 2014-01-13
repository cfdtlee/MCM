function Y_gray=gray_prediction(X0,Y0,N)
%gray_prediction.m 
%X0 自变量
%Y0 应变量
%N 预测后面N个数

n=length(Y0);
lamda=Y0(1:n-1)./Y0(2:n) %求级比
range=minmax(lamda)
y1=cumsum(Y0); %累加
for i=2:n
    z(i)=0.5*(y1(i)+y1(i-1));
end
B=[-z(2:n)',ones(n-1,1)]; %构造矩阵B和向量Y
Y=Y0(2:n)';
u=B\Y
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),y1(1)});
yuce1=subs(x,'t',[0:n+N-1]);
%digits(6),y=vpa(x) %为提高预测精度，先计算预测值，再显示微分方程的解
temp=double(yuce1);
yuce=[Y0(1),diff(temp)];
Y_gray=yuce;
epsilon=Y0-yuce(1:n) %计算残差
delta=abs(epsilon./Y0) %计算相对误差
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda %计算级比偏差值
figure;
plot(X0,Y0)
hold on
%plot(1997:2025,yuce)