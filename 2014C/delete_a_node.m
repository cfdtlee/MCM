%% �޳�each���ͼ��Ч�ʵ�Ӱ��c4
for tt=469:num_main
    tt
    a_temp=relation_511;
    %a_temp(tt,:)=0; a_temp(:,tt)=0;%����tt������ڽӱ����޳�
    n=num_main;
    M=max(max(a_temp))*n^2; %MΪ��ִ����ʵ��
    a_temp=a_temp+((a_temp==0)-eye(n))*M;
    path=zeros(n);
    for k=1:n
        for i=1:n
            for j=1:n
                if a_temp(i,j)>a_temp(i,k)+a_temp(k,j)
                    a_temp(i,j)=a_temp(i,k)+a_temp(k,j);
                    path(i,j)=k;
                end
            end
        end
    end
    %a_temp, path
    a_temp(a_temp==M)=0;
    %c4(tt)=sum(1./a_temp(a_temp~=0))/(num_main-num_along-1)/(num_main-num_along); 
end
c4_0=sum(1./a_temp(a_temp~=0))/(num_main-num_along-1)/(num_main-num_along);
c4=(c4_0-c4)/c4_0;
[value_c4,rank_c4]=sort(c4,2,'descend');