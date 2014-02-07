%% 点度中心度
c1=sum(relation_511)/2/(num_main-1);

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
        c2(k)=c2(k)+1;
        while(k~=0)
            k=path(k,j);
            c2(k)=c2(k)+1;
        end
    end
end