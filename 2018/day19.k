(i;c):+(0 1_" "\)'I:0:"day18.txt"
I:1_+i:(`$*'i;`I$c)
fa:{@[z;[y@2];:;x/2#y]}
(ir;ri;rr):(1;0;0 1)
ft:{(@[y;x;:;z@y@x];z)}
mf:{fa[x].ft[y].(z)}
bt:{2/x/+2\(y;z)}
fns:((`addi;+;ri)
 (`addr;+;rr)
 (`muli;*;ri)
 (`mulr;*;rr)
 (`banr;bt[&];rr)
 (`bani;bt[&];ri)
 (`borr;bt[|];rr)
 (`bori;bt[|];ri)
 (`seti;*,;ir)
 (`setr;*,;rr)
 (`eqir;=;ir)
 (`eqri;=;ri)
 (`eqrr;=;rr)
 (`gtir;>;ir)
 (`gtri;>;ri)
 (`gtrr;>;rr))

fns:!/+{(*x;mf.1_x)}'fns

S:100
run:{(c;ip;r):z
  $[^f:fns[*i:x@ip];z
  (1+c;1+r@y;r:f@(i@1;@[r;y;:;ip]))]}

a:{*(~x<*|:){((*y)+f*(~f!x);1+f:*|y)}[x]/0}
r:20 run[I;***|i]/(0;0;6#0)
a@*|r[2]
r:20 run[I;***|i]/(0;0;1,5#0)
a@*|r[2]
