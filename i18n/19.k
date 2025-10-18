."\\l ",`env[]`KINIT
imp.ort[`l;"l.k"]

(I;Z):+"; "\'0:"19.txt"

ZB:"timezones/",/:("2018c";"2018g";"2021b";"2023d"),\:"/install/usr/share/zoneinfo/"
zi:zn!l.zi''1:''ZB,\:/:(zn:?Z)

D:+.''*''0N 2#/:(0 4 5 7 8 10 11 13 14 16 17 )_/:I
D:l.ut@@[D;1 2;-;1]
T:+(D;zi[Z])

ut:{x[0]-*'(x[1]@\:2)@'(x[1].\:1 1)@'g:(b:x[1].\:1 0){x'y}\:x[0]}

a:*{x^x^y}/?',/'(ut'T)@=Z

y:1970+((-365*86400)!a)
y-:-365!l:l.lds y
(dys;hms):86400\(365*86400)!a-86400*l
dys+:(~l.ly y)&~dys<l.ef
(m;mo):1 l.DS\l.DS'dys
d:dys-mo
(H;M;S):1_l.S\hms
`0:l.shw(y,m,d,H,M,S,0 0)
