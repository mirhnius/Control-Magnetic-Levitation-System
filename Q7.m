clear;clc;
R = 50;
L  = 0.2;
g = 9.8;
c = 0.3;
y_star = 0.03;
M = 0.2+0.434;

% A = [0,1,0;g/0.03,0,-2*c/M*sqrt(g*M/c*0.03)*1/0.03; 0,0,-1*R/L];
A = [0,1,0;g/0.03,0,2*c/M*sqrt(g*M/c*0.03)*1/0.03; 0,0,-1*R/L];
B  = [0;0;1/L];
C = [1 0 0];
D  = 0;

A_bar = [A,[0;0;0];-C,0];
B_bar = [B;0];

controllability_matrix = [B_bar,A_bar*B_bar,A_bar^2*B_bar,A_bar^3*B_bar];
rank_controllability_matrix  = rank(controllability_matrix);


%%% Design
C=[1 0 0 0];
D=0;

p = [-5 -1 -2 -3];
K = place(A_bar,B_bar,p)
Ac=(A_bar-B_bar*K);
sys=ss(Ac,B_bar,C,D);
step(sys);
