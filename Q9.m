F = [1,2;3,4];
L = [1;2];
controllability_matrix = [L,F*L,F^2*L];
rank_controllability_matrix = rank(controllability_matrix); %full rank
syms t1 t2 t3 t4 t5 t6
T = [t1 t2 t3;t4 t5 t6];
eq = T * A - F * T; 
sol = L * C;
eqs = [eq(1,1)==sol(1,1),eq(1,2)==sol(1,2),eq(1,3)==sol(1,3),eq(2,1)==sol(2,1),eq(2,2)==sol(2,2),eq(2,3)==sol(2,3)];
result = solve(eqs);
t = [result.t1,result.t2,result.t3;result.t4,result.t5,result.t6]; 
rank([C;t]) % full rank






