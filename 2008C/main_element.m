clc,clear
load metrics.txt %把原始数据保存在纯文本文件metrics.txt中
metrics(3:8,:)=1./metrics(3:8,:);
metrics=metrics';
metrics_s=zscore(metrics); %数据标准化
r=corrcoef(metrics_s); %计算相关系数矩阵
[x,y,z]=pcacov(r); %特征向量,特征值,比重
f=repmat(sign(sum(x)),size(x,1),1);
x=x.*f;
df=metrics_s*x(:,1:4)
tf=df*z(1:4)/100;
[stf,ind]=sort(tf,'descend')