/ This is shakti
dt:,/.''0:"day15.txt"
dm:100

gn:{p:!x*x;,/'+(,(@).'+(n;&'(n<x*x)&(~n<0)&1=abs (x mod p)--2^x mod ,/n:+p+/:-1 1)),,(@).'+(n;&'(n<x*x)&(~n<0)&1=abs (x div p)--2^x div ,/n:+p+/:(-x;x))}

nb:gn[dm]

mx:0N-1
dj:{n:nb[*x];n:n@&~dn[n];ds[n]&:(ds@*x)+dt@n;dn[*x]:1;n:?n,1_ x;n@<ds[n]}

ds:0,((#dt)-1)#mx
dn:(#dt)#0
nxt:,0

(dm*dm;dj)/:nxt;
ds@-1+dm*dm

dt:,//:(,/+)'5^dm^'1+9 mod/:-1+dt+/:,/(!5)+/:!5
 
dm*:5;
nb:gn[dm]
 
ds:(#dt)#mx
ds:0,((#dt)-1)#mx
dn:(#dt)#0
nxt:,0

(dm*dm;dj)/:nxt;
ds@-1+dm*dm

\\