clear all
clc
% ------------------------------number array---------------------------------
one=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1;-1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1;-1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1;-1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1;-1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1;-1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
two=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 -1 -1 -1 -1 -1 -1 1 1 -1;-1 -1 -1 -1 -1 -1 -1 1 1 -1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 1 1 -1 -1 -1 -1 -1 -1 -1;-1 1 1 -1 -1 -1 -1 -1 -1 -1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
%  --------------------------plot standard number figure--------------
subplot(2,3,1)
imshow(imresize(one,20))
title('standard number')

subplot(2,3,4)
imshow(imresize(two,20))
title('standard number')
% ---------------------------creat hopfield net---------------------
T=[one;two]';
net=newhop(T); 
% --------------------------generate rand noise------------------
for i=2:11
    for j=2:9
        a=rand;
        if a<=0.1
           one(i,j)=-one(i,j);
           two(i,j)=-two(i,j);
        end
    end
end
noise_one=one
noise_two=two
% -------------------------plot noise figure----------------------------
subplot(2,3,2)
imshow(imresize(noise_one,20))
title('noise number')

subplot(2,3,5)
imshow(imresize(noise_two,20))
title('noise number')
% ------------------------plot identify figure---------------------------
noise1={(noise_one)'};
tu1=sim(net,{12,3},{},noise1);
tu1{3}'
subplot(2,3,3)
imshow(imresize(tu1{3}',20))
title('identify number')

noise2={(noise_two)'};
tu2=sim(net,{12,3},{},noise2);
tu2{3}'
subplot(2,3,6)
imshow(imresize(tu2{3}',20))
title('identify number')