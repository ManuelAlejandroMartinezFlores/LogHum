

Sets
i centros
;

alias (i, j);

Parameters
d(i, j) distancia del centro i a j es menor o igual a 3 horas
demanda(i) demandas en kg
origen(i) origen
;

Variables
X(i) centro i
A(i, j) asignar comunidad j a centro i
Z1 valor del objetivo1
Z2 valor objetivo2
V(i, j) viajar de i a j
Z3 valor objetivo3
T(j) tiempo de llegada j
O(j) oferta de alimento en j
;

Binary Variable A, X, V;
Positive Variable T;

Equations
cobertura(j) cubrir centro i
activacion(i, j) asegurar que solo se asigne a centros abiertos
objetivo1 cantidad de centros
cantidad_centros tiene que ser maximo 4
objetivo2 distancia total recorrida
permutacion_valida_col(j) los viajes son permutaciones validas
permutacion_valida_row(j) los viajes son permutaciones validas
restriccion_tiempo(i, j) tiempos de llegada van en orden
no_diag no permite viajes de i a i
oferta(j) la oferta en j debe corresponder a las demandas
objetivo3 costo de transporte de alimento
;

cobertura(j).. sum(i $ (d(i, j) <= 3), A(i, j)) =E= 1;
activacion(i, j).. A(i, j) =L= X(i);
objetivo1.. Z1 =E= sum(i, X(i));
cantidad_centros.. Z1 =L= 4;
objetivo2.. Z2 =E= sum((i, j), demanda(j) * A(i, j) * d(i, j));
permutacion_valida_col(j).. X(j) =E= sum(i, V(i, j));
permutacion_valida_row(i).. X(i) =E= sum(j, V(i, j));
restriccion_tiempo(i, j) .. T(j) =G= + d(i, j) * V(i, j) - 50 * (1 - V(i, j)) + T(i) $ (origen(i) < 1);
no_diag.. sum(i, V(i, i)) =E= 0;
oferta(j).. O(j) =E= 1;
objetivo3.. Z3 =E= sum((i, j), V(i, j) * d(i, j));



Model inciso1 /all/;
$include "datos.gms";



solve inciso1 minimizing Z1 using MIP;
display X.l;
display A.l;
display Z1.l;

Model inciso2 /all/;
solve inciso2 minimizing Z2 using MIP;
display X.l;
display A.l;
display Z2.l;

Model inciso3 /all/;
solve inciso3 minimizing Z3 using MIP;
display X.l;
display A.l;
display V.l;
display T.l;
display Z3.l;