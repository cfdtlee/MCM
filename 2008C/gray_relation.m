clc,clear
load metrics.txt %把原始数据存放在纯文本文件x.txt 中
y=[ 2.2213   1.4876    1.4102    0.2262   -0.6785   -2.1531   -2.5138];
metrics_y=[y; metrics];
for i=1:3
metrics_y(i,:)=metrics_y(i,:)/metrics_y(i,1); %标准化数据，越大越好
end
for i=10:12
metrics_y(i,:)=metrics_y(i,:)/metrics_y(i,1); %标准化数据，越大越好
end
for i=4:9
metrics_y(i,:)=metrics_y(i,1)./metrics_y(i,:); %标准化数据
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
[rs,rind]=sort(r,'descend') %对关联度进行排序

