syms k kt m M L R z0 zt0 g
k=30000;kt=200000; m=30; M=117; g=9.81; L=.3; R=.3;
B=[0;0;kt/m;0];
z0=L-M*g/k+R-(M+m)*g/kt;
zt0=R-(M+m)*g/kt;
C1=[0 1 0 0]; %chassis displacement Z(s)
C2=[0 0 0 1]; %wheel displacement Zt(s)
C3=[0 1 0 -1]; %suspension deflection Z(s)-Zt(s)
C4=[0 0 0 1]; D4=-1; %tire deflection Zt(s)-Zr(s)
D=0;
c=[700 1500 3000];
%Fz=zeros(1,3);
for i=1
A=[-c(i)/M -k/M c(i)/M k/M;
     1       0    0     0; 
   c(i)/m  k/m -c(i)/m (-k-kt)/m; 
    0       0     1     0];
T=ss(A,B,C1,D);
Fz(i)=tf(T);
end
%bode(Fz(1),Fz(2),Fz(3));
