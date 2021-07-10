clear;clc;
g = 9.8;
M = 0.2 + 0.434;
y = 0.03;
c = 0.3;
R = 50;
L = 0.2;
A = [0,1,0;g/y,0,+(2*c/M)*sqrt(g*M*y/c)/y;0,0,-R/L];
B  = [0;0;1/L];
C = [1 0 0 ];
D = 0;

% syms L1 L2 L3 s
% AL = A2 - [L1; L2; L3]*C;
% det(s*eye(3) - AL)

p1 = [-5 -4 -3];
L1 = place(A',C',p1)';
AL1 = A - L1 * C;
sys = ss(AL1,B,C,D);
figure
step(sys);

p2 = [-250 -200 -150];
L2 = place(A',C',p2)';
AL2 = A - L2 * C;
sys = ss(AL2,B,C,D);
figure
step(sys);
