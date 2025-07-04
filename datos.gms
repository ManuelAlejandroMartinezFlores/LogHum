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
;

Binary Variable A, X, V;
Positive Variable T;

Equations
cobertura(j) cubrir centro i
activacion(i, j) asegurar que solo se asigne a centros abiertos
objetivo1 cantidad de centros
cantidad_centros tiene que ser maximo 4
objetivo2 distancia total recorrida
;

cobertura(j).. sum(i $ (d(i, j) <= 3), A(i, j)) =E= 1;
activacion(i, j).. A(i, j) =L= X(i);
objetivo1.. Z1 =E= sum(i, X(i));
cantidad_centros.. Z1 =L= 4;
objetivo2.. Z2 =E= sum((i, j), demanda(j) * A(i, j) * d(i, j));




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
