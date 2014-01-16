%clc,clear
load china.txt %把原始数据保存在纯文本文件metrics.txt中
%china(3:8,:)=1./china(3:8,:);
china=china';
china_s=zscore(china); %数据标准化
r=corrcoef(china_s); %计算相关系数矩阵
[x,y,z]=pcacov(r); %特征向量,特征值,比重
f=repmat(sign(sum(x)),size(x,1),1);
x=x.*f;
df=china_s*x(:,1:3)
tf=df*z(1:3)/100;
[stf,ind]=sort(tf,'descend')
