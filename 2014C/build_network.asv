%% 将cell转成str
load data_raw.mat
[num_total,~]=size(name);
name_total=str2mat(name{1:num_total});
index_main=find(year);
name_main=name_total(index_main,:);%Erdos=1的名字
times(index_main)=1; %将与Erdos合作次数为1的赋值
[num_main,~]=size(find(year));
relation_511=zeros(511);

%{
去*和年份
for i=1:511*38
    if name_main(i)=='*'
        name_main(i)=0;
    elseif name_main(i)>='0' && name_main(i)<='9'
        name_main(i)=0;
    end
end
%}

%% 计算邻接矩阵
tt=0;
for i=1:num_main-1 %Erdos=1的下标
    for j=index_main(i)+1:index_main(i+1)-1 %Erdos=2的下标
        for k=1:num_main
            %[i,j]
            if name_total(j,:)==name_main(k,:)
                %tt=tt+1
                bef=relation_511(i,k)
                relation_511(i,k)=relation_511(i,k)+1;
                aft=relation_511(i,k)
            end
        end
    end
end
i=num_main;
for j=index_main(num_main)+1:num_total
    for k=1:num_main
        if name_total(j,:)==name_main(k,:)
            tt=tt+1
            relation_511(i,k)=relation_511(i,k)+1;
        end
    end
end

%% 画图
xy=rand(511,2);
for i=1:511
    for j=i:511
        if relation_511(i,j)
            plot([xy(i,1),xy(j,1)],[xy(i,2),xy(j,2)]);
            hold on;
        end
    end
end
