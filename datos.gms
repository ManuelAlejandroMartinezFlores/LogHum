Sets
i centros /Chipane, Saute ,Camo ,Faimba ,Mazive ,Macuene ,Fernando ,Banguene , Funhalouro/
;
alias (i, j);

Parameters
demanda(i) /Chipane 30,Saute 10,Camo 40,Faimba 40,Mazive 30,Macuene 20,Fernando 10,
Banguene 40, Funhalouro 80/

origen(i) /Chipane 0,Saute 0,Camo 0,Faimba 0,Mazive 0,Macuene 0,Fernando 0,
Banguene 0, Funhalouro 1/;

table d(i,j) distancia de la aldea i a la aldea j
            Chipane Saute Camo Faimba Mazive Macuene Fernando Banguene Funhalouro
Chipane         0     4     3      9      9       9        3        9           3
Saute           4     0     2      9      9       9        2        9           9
Camo            3     2     0      9      9       2        3        9           9
Faimba          9     9     9      0      3       9        9        9           3
Mazive          9     9     9      3      0       3        9        2           9
Macuene         9     9     2      9      3       0        9        9           3
Fernando        3     2     3      9      9       9        0        9           9
Banguene        9     9     9      9      2       9        9        0           2
Funhalouro      3     9     9      3      9       3        9        2           0
;
