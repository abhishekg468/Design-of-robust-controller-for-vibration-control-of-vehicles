syms kf kr kt mf mr M lf lr Iy cf cr p
%kf=30000; kr=20000;kt=200000; mf=50; mr=50; M=400; lf=1.4;lr=1; Iy=1400;  
kf=30000; kr=30000;kt=200000; mf=30; mr=30; M=117; lf=.75;lr=.75; Iy=1000;
B=[0 0 0;0 0 0;kt/mf 0 0;0 0 0;0 kt/mr 0;0 0 0;0 0 1/Iy;0 0 0];%b=8*3
C1=[0 0 0 0 0 0 0 1]; %pitch at COG Phi(s)
C2=[0 1 0 0 0 0 0 0]; %chassis displacement Z(s)
C3=[0 0 0 1 0 0 0 0]; %front suspension deflection Ztf(s)
C4=[0 0 0 0 0 1 0 0]; %Rear suspension deflection Ztr(s)
D=0;
%cf=[700 1000 1500]; 
cr=[700 1500 3000]; cf=[700 1500 3000];
%X=[z' z ztf' ztf ztr' ztr phi' phi]' A=8*8
for i=1:3 
    for j=1 %j(1)=Zrf; j(9)=Zrr; j(17)=Mdj
A=[-(cf(i)+cr(i))/M -(kf+kr)/M     cf(i)/M      kf/M     cr(i)/M   kr/M   (cr(i)*lr-cf(i)*lf)/M (kr*lr-kf*lf)/M;     
        1                 0           0           0        0        0            0                    0        ;   
   cf(i)/mf             kf/mf     -cf(i)/mf  -kt-kf/mf     0        0       cf(i)*lf/mf           kf*lf/mf     ; 
        0                 0           1           0        0        0            0                    0        ;
   cr(i)/mr             kr/mr         0           0    -cr(i)/mr -kr-kt/mr -cr(i)*lr/mr          -kr*lr/mr     ;
        0                 0           0           0        1        0            0                    0        ;
 (lf*cf(i)-lr*cr(i))/Iy (lf*kf-lr*kr)/Iy -cf(i)*lf/Iy  -lf*kf/Iy lr*cr(i)/Iy lr*kr/Iy   (cf(i)*lf^2+cr(i)*lr^2)/Iy (kf*lf^2+kr*lr^2)/Iy;
        0                 0           0           0        0        0            1                    0        ;
  ];
T=ss(A,B(j:j+7)',C4,D);
Fz(i+j)=tf(T);
    end
end
bode(Fz(2),Fz(3),Fz(4));