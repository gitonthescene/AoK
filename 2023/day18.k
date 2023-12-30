I:0:"day18.txt"

(D;C;H):+" "\'I
C:.'C
D:"RDLU"?,/D
H:+16/''0 5_/:(,/($!10),"abcdef")?-1_'2_'H
O:,/-:\|=2

r:{-/,/'|'(0,/:(#x)!-1 1)_\:x}
sl:-2!{x|-x}@+/*/{r y}\+:        / [[https://en.wikipedia.org/wiki/Shoelace_formula][shoelace]]

a:{sl[+\x*O@y]+1+-2!+/x}         / [[https://en.wikipedia.org/wiki/Pick%27s_theorem][pick's theorem]]
a[C;D]

a.(H)

/ Alternate solution: make smaller model and use that to reflect on larger problem

fst:{-1_x&1_(~(*x)=':x,:0),0}
fl:|/(fst;|fst@|:)@\:

ml:{+-\:/1&/\+\&(+*|x)!|/*/x}                           / make loop
ci:{(~x#y)&((~=)\)'&':fl'x#y}                           / calc interior (sweeps, but flood should work)

f:{p:++\x*O@y             / points
   P:(?@/1<:\)'p          / unique x/y coordinates
   M:2*!'#'P              / indices of unique points expanded by 2
   m0:ml[1(0 1')\+1_-':,/1(,*:)\+2*P?'p]                    / make loop w/ coordinates with indices (i.e. model of the data)
   i:ci[s;@[&+/*/s;(s:1+|/'m0)/m0;:;1]]                     / plot loop/calc interior
   i:s#@[&*/s;(s:s+1)/1 0+&i;:;1]                           / expand a bit
   j:(i).[;;:;1]/(,/+'(0 1;-1 0;-1 1)+\:&i)                 / complete quadrants
   cnt:+/{*/-/+x@'+|1(1+)\y{x'y}'z}[P;M]'+@\:/1(&&/2!)\&j   / count area of points in model with distances in the original
   dd:x@&|/y=/:0 1                                          / adjustment for completed quadrants
   cnt-:(+/dd)-1
   cnt+/x}                                                  / add back the boundary

f[C;D]
f.(H)
