%clc,clear
load china.txt %��ԭʼ���ݱ����ڴ��ı��ļ�metrics.txt��
%china(3:8,:)=1./china(3:8,:);
china=china';
china_s=zscore(china); %���ݱ�׼��
r=corrcoef(china_s); %�������ϵ������
[x,y,z]=pcacov(r); %��������,����ֵ,����
f=repmat(sign(sum(x)),size(x,1),1);
x=x.*f;
df=china_s*x(:,1:3)
tf=df*z(1:3)/100;
[stf,ind]=sort(tf,'descend')
