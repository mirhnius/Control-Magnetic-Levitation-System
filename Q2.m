R = 50;
L  = 0.2;
g = 9.8;
c = 0.3;
y_star = 0.03;
M = 0.2+0.434;

A = [0,1,0;g/0.03,0,-2*c/M*sqrt(g*M/c*0.03)*1/0.03; 0,0,-1*R/L];
B  = [0;0;1/L];
C = [1 0 0 ];
D  = 0;
A2 = [0,1,0;g/0.03,0,2*c/M*sqrt(g*M/c*0.03)*1/0.03; 0,0,-1*R/L];

[V1,D1]= eig(A);

[V2,D2]= eig(A2);


