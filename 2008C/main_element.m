clc,clear
load metrics.txt %��ԭʼ���ݱ����ڴ��ı��ļ�metrics.txt��
metrics(3:8,:)=1./metrics(3:8,:);
metrics=metrics';
metrics_s=zscore(metrics); %���ݱ�׼��
r=corrcoef(metrics_s); %�������ϵ������
[x,y,z]=pcacov(r); %��������,����ֵ,����
f=repmat(sign(sum(x)),size(x,1),1);
x=x.*f;
df=metrics_s*x(:,1:4)
tf=df*z(1:4)/100;
[stf,ind]=sort(tf,'descend')