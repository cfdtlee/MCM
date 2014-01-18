clear 
clc
load class.txt
class_1=class(1:11,:);
class_2=class(12:22,:);
class_3=class(23:33,:);

a_country=zeros(1,11);
judge=zeros(1,11);


%% draw
te=classify(metrics(1,:));
[m n]=size(te)
for i=1:m
    for j=1:n
        if te(i,j)>0
            plot(j,m-i,'ko','MarkerFaceColor','k');
        else
            plot(j,m-i,'ko');
        end
        hold on
    end
end
axis([0 6 0 12])
axis off

%% Hopfield

sim_1=classify([79,0.179000000000000,0.848428835830146,0.00961538461538462,0.125000000000000,0.0476190476190476,0.212765957446809,3.03030303030303,36.9000000000000,4.80000000000000,1]);
sim_2=classify([79,0.179000000000000,0.887200000000000,0.00961538461538462,0.125000000000000,0.0476190476190476,0.212765957446809,8,38,4.80000000000000,1]);
sim_3=classify([79,0.179000000000000,0.848428835830146,0.00961538461538462,0.260000000000000,0.122000000000000,0.212765957446809,3.03030303030303,38,4.80000000000000,1]);
%%
T=[class_1 class_2 class_3];
A={[sim_1 sim_2 sim_3]};



net=newhop(T)
Y=sim(net,{9 20},{}, A);
Y1=Y{20}(:,1:3)
Y2=Y{20}(:,4:6)
Y3=Y{20}(:,7:9)

%% show result
result={T; A{1}; Y{20}};
figure
for p=1:3
    for k=1:3
        subplot(3,3,(p-1)*3+k)
        te=result{p}(:,(k-1)*3+1:k*3);
        [m n]=size(te);
        for i=1:m
            for j=1:n
                if te(i,j)>0
                    plot(j,m-i,'ko','MarkerFaceColor','k');
                else
                    plot(j,m-i,'ko');
                end
                hold on
            end
        end
        axis([0 4 0 12])
        axis off
        title(['class' num2str(k)])
    end
end
