/ This is shakti
dt:,/.''0:"day15.txt"
dm:100

t:{(,(#*x)#0N),(-1)_x}
gn:{+,/'(t;{|t@|x};{+t@+x};{+|t@|+x})@\:x^!x*x}

nb:gn[dm]

mx:0N-1
dj:{n:n@&~dn[n:n@&~0N=n:nb[*x]];ds[n]&:(ds@*x)+dt@n;dn[*x]:1;n:?n,1_ x;n@<ds[n]}

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