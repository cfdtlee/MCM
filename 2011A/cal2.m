r=4;
g=9.8;
d=4;
mu=0.03;%Ä¦²ÁÏµÊý
va=5;
alpha=60/180*pi;
beta=14/180*pi;
m=70;
vb=sqrt(r*pi*g*sin(alpha-beta)/sin(alpha)-pi*va^2*sin(alpha)-pi*mu*g*cos(beta)/sin(alpha)+va^2)
vc=sqrt(vb^2+2*g*d*sin(beta)/tan(alpha)-2*mu*g*cos(beta)/sin(alpha))
vd=sqrt(20000/m+vc^2-r*pi*g/sin(alpha)*sin(alpha-beta)-pi*vc^2*sin(alpha)-pi*mu*g*cos(beta)/sin(alpha))
h=vd^2*sin(alpha)^2/2/g/cos(beta)+sin(alpha)*cos(alpha)*vd*tan(beta)/g

aa=vc^2
bb=r*pi*g/sin(alpha)*sin(alpha-beta)
cc=pi*vc^2*sin(alpha)
dd=pi*mu*g*cos(beta)/sin(alpha)