[~,num_along]=size(find(~sum(relation_511)));

%% 点度中心度c1
c1=sum(relation_511)/2/(num_main-num_along-1);
c1=c1/max(c1);
%% 中间中心度c2
n=num_main; a=relation_511;
M=max(max(a))*n^2; %M为充分大的正实数
a=a+((a==0)-eye(n))*M;
path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(k,j)
                a(i,j)=a(i,k)+a(k,j);
                path(i,j)=k;
            end
        end
    end
end
a, path

%i到j的最短路经过的所有点
c2=zeros(1,num_main);
for i=1:num_main
    for j=i:num_main
        k=path(i,j);
        while(k~=0)
            c2(k)=c2(k)+1;
            k=path(k,j);
        end
    end
end
c2=c2./(num_main-num_along-1);
c2=c2/max(c2);
%% 接近中心度c3
c3=zeros(1,num_main);
a_temp=a;
a_temp(a_temp==M)=0;
p=sum(a_temp); %each点到其他任何点的最短路之和
for i=1:num_main
    a_col=a_temp(:,i);
    a_col=sort(a_col);
    j=1;
    min_col=a_col(j);
    while min_col==0 && j<511
        j=j+1;
        min_col=a_col(j);
    end
    max_col=a_col(end);
    if(max_col-min_col~=0) 
        c3(i)=(p(i)-min_col*num_main)/(max_col-min_col)/(num_main-num_along-1);
    else
        c3(i)=0;
    end
end
c3=-c3/max(c3);
c_rank=c1+c2+c3;
[value_au,rank_au]=sort(c_rank,2,'descend'); 
%% 511剔除37个孤立点的网络中：最长距离length_max   平均距离length_avg  最大度degree_max   平均度degree_avg   最小度degree_min
length_max=max(max(a_temp));
[num_a_temp,~]=size(find(a_temp));
length_avg=sum(sum(a_temp))/num_a_temp;
degree_max=max(sum(relation_511));
degree_avg=sum(sum(relation_511))/(num_main-num_along);
degree_min=1;






