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
controllability_matrix1 = [B,A*B,A^2*B];
rank_controllability_matrix1 = rank(controllability_matrix1);
visibility_matrix1 = [C;C*A;C*A^2];
rank_visibility_matrix1 = rank(visibility_matrix1);

A2 = [0,1,0;g/0.03,0,2*c/M*sqrt(g*M/c*0.03)*1/0.03; 0,0,-1*R/L];
controllability_matrix2 = [B,A2*B,A2^2*B];
rank_controllability_matrix2 = rank(controllability_matrix2);
visibility_matrix2 = [C;C*A2;C*A2^2];
rank_visibility_matrix2 = rank(visibility_matrix2);

