%clc,clear
load metrics.txt %��ԭʼ���ݴ���ڴ��ı��ļ�x.txt ��
y=[0.668899310882880,-0.654565707840577,-2.45359080091927,1.68329534392123,1.58253236763562,-2.01945005172403,2.38578503692820,1.58675223880470,0.838669734822448,-0.834767994218344,-0.785994268017891,-1.89972186983298,-2.10555587297694,-0.287920893264771,1.32974185885896,0.965891566940783];
metrics_y=[y; metrics];
for i=1:3
metrics_y(i,:)=metrics_y(i,:)/metrics_y(i,1); %��׼�����ݣ�Խ��Խ��
end
for i=10:12
metrics_y(i,:)=metrics_y(i,:)/metrics_y(i,1); %��׼�����ݣ�Խ��Խ��
end
for i=4:9
metrics_y(i,:)=metrics_y(i,1)./metrics_y(i,:); %��׼������
end
data=metrics_y;
n=size(data,1);
ck=data(1,:);m1=size(ck,1);
bj=data(2:n,:);m2=size(bj,1);
for i=1:m1
    for j=1:m2
        t(j,:)=bj(j,:)-ck(i,:);
    end
    jc1=min(min(abs(t')));jc2=max(max(abs(t')));
    rho=0.5;
    ksi=(jc1+rho*jc2)./(abs(t)+rho*jc2);
    rt=sum(ksi')/size(ksi,2);
    r(i,:)=rt;
end
r
[rs,rind]=sort(r,'descend') %�Թ����Ƚ�������

