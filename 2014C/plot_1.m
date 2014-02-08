%% »­Í¼
hold on;
plot([x(i),x(j)],[y(i),y(j)]);j=1;i=2
plot(x(j),y(j),'o','MarkerSize',4,'MarkerFaceColor',[0,0,0])

plot(x(1),y(1),'o','MarkerSize',10,'MarkerFaceColor',[1,0,0]);
plot(x(j),y(j),'o','MarkerSize',2,'MarkerFaceColor',[0.5,0.5,1])
r=611:-1:101;
t=r;
x=r.*cos(t);
y=r.*sin(t);
n=5;
plot_name={'BABAI,LASZLO','Korner,Janos','Cypher,RobertE.','Egawa,Yoshimi','Kannan,Sampath'};
for i=1:n
    
    for j=i:511
        if relation_511(rank_c4(i),j)
            plot([x(i),x(j)],[y(i),y(j)]);
            plot(x(j),y(j),'o','MarkerSize',4,'MarkerFaceColor',[0,0,0])
        else
            plot(x(j),y(j),'o','MarkerSize',2,'MarkerFaceColor',[0.5,0.5,1])
        end
    end
    text(x(i),y(i),['\fontsize{16}',plot_name{i}]);
end
legend('conections between coauthors','significant authors','coauthors of significant authors','general authors');
plot(x(1:n),y(1:n),'o','MarkerSize',10,'MarkerFaceColor',[1,0,0]);
axis off