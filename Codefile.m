a=1.4; b=1.7; c=1.5; d=1.5;
%tau=.001;alpha=4.515*10^0;beta=10;gama=1.545*10^0;
tau=1;alpha=10;beta=1;gama=1.5;
tau1=1;alpha1=0;beta1=0;gama1=0;
Ps=1034250;Ap=3.35*10^-4;
Ps1=0;Ap1=0;
Ixx=460;Iyy=2160;M=1500;m=59;
v=8;
Kufr=190000;Kufl=190000;Kurl=190000;Kurr=190000;
Ksfr=35000;Ksfl=35000;Ksrr=38000;Ksrl=38000;
Csfr=1000;Csfl=1000;Csrr=1100;Csrl=1100;
B=[zeros(3,4)         ,
   1/tau 0     0     0,
   zeros(3,4)         ,
   0     1/tau 0     0,
   zeros(3,4)         ,
   0     0     1/tau 0,
   zeros(3,4)         ,
   0     0     0     1/tau];
G=[ 0          0      0           0,
    Kufr/m  0      0           0,
    zeros(3,4)                     ,
    0    Kufl/m    0           0,
    zeros(3,4),
    0          0   Kurr/m      0,
    zeros(3,4),
    0          0      0  Kurl/m ,
    zeros(2,4)];

W=[1 1  1  1
   a a -b -b 
  -c d -c  d];
Wplus= W.'/(W*W.');
t1=transpose(0.5:.001:1);
t2=transpose(3:.001:3.25);
t3=transpose(2:.001:2.5);
delay=(a+b)/v;
Zffr1=[t1 .03*(1-cos(4*pi*t1))]; Zffr2=[t2 .03*(1-cos(8*pi*t2))]; Zffr3=[t3 -.03*sin(2*pi*t3)];
Zffl1=[t1 .0145*(1-cos(4*pi*t1))]; Zffl2=[t2 .0145*(1-cos(8*pi*t2))]; Zffl3=[t3 -.0145*sin(2*pi*t3)];
%Zfrr1=[t1 .004*sin(2*pi.*(t1-delay))]; Zfrr2=[t2 .005*sin(10*pi.*(t2-delay))]; Zfrr3=[t3 .02*sin(.2*pi.*(t3-delay))];
%Zfrl1=[t1 .015*sin(2*pi.*(t1-delay))]; Zfrl2=[t2 .009*sin(11*pi.*(t2-delay))]; Zfrl3=[t3 .02*sin(.2*pi.*(t3-delay))];