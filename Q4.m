g = 9.8;
M = 0.2 + 0.434;
y = 0.03;
c = 0.3;
R = 50;
L = 0.2;
% A1 = [0,1,0;g/y,0,-(2*c/M)*sqrt(g*M*y/c)/y;0,0,-R/L];
A2 = [0,1,0;g/y,0,+(2*c/M)*sqrt(g*M*y/c)/y;0,0,-R/L];
B  = [0;0;1/L];
C = [1 0 0 ];
D  = 0;

[numerator,denumerator]=ss2tf(A2,B,C,D);
roots(denumerator)
p = [-250 -200 -150];
K1 = place(A2,B,p)
Ac1=(A2-B*K1);
sys1=ss(Ac1,B,C,D);
figure
step(sys1);

p = [-5 -4 -3];
K2 = place(A2,B,p)
Ac2=(A2-B*K2);
figure
sys2=ss(Ac2,B,C,D);
step(sys2);

