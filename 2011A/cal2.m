clear
g=9.8;mu=0.03;%Ħ��ϵ��
r=4;
d=5;
va=7.73;
alpha=60/180*pi;
beta=14/180*pi;
m=70;
w=10000;
vb=sqrt(r*pi*g*sin(alpha-beta)/sin(alpha)-pi*va^2*sin(alpha)-pi*mu*g*cos(beta)/sin(alpha)+va^2);
vc=sqrt(vb^2+2*g*d*sin(beta)/tan(alpha)-2*mu*g*cos(beta)/sin(alpha));
vd=sqrt(2*w/m+vc^2-r*pi*g/sin(alpha)*sin(alpha-beta)-pi*vc^2*sin(alpha)-pi*mu*g*cos(beta)/sin(alpha))
h=vd^2*sin(alpha)^2/2/g/cos(beta)+sin(alpha)*cos(alpha)*vd*tan(beta)/g;
ppp=(h-2.4418)/2.4418;
aaa=(vd*sin(alpha-beta)-tan(beta)*vd*cos(alpha-beta));
t=(aaa*2)/g
sin(alpha-beta)*vd*t
