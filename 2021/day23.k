T:0:"day23.txt"

/ steps between home and corridor and vice versa
hw:(0 1;2;3;4;5 6)
db:(3 2 2 4 6 8 9;5 4 2 2 4 6 7;7 6 4 2 2 4 5;9 8 6 4 2 2 3)
pb:{(|'(!#x)_\:x),(1+!#y)#\:y}.',/''(0,/:1+!4)_\:hw
hcpb:{,/|{y,/:'x}\[pb+x*4;|((4*!x)+\:!4)]}
hcdb:{,/|(!x)+\:db}


wt:3(10*)\1

mv:{@[x;2#y;:;0,x@*y]}

/ see who's home
ih:{0N 4#(4!!x)=hm@y@!x}

/ valid move with index into cost table
mi:{V:(*:';(:/)')@\:.[P;]'+I:&1=+/''~~y@P:hcp;(V;+I)}

/ calc cost
cc:{[V;I;i;s;c](c+(.[hcd;]'I)*wt@hm@|/s@V)@i}

/ move from home to corridor
hc:{[d;s;c](V;I):mi[d;s];i:&s[*V]&~(H:,/&\ih[d;s])@*V;$[#i;::;&/H;:+,(s;c);:()];(mv[s]@/:(0;d)+/:I@i;cc[V;I;i;s;c])}

/ move from corridor to home
b:,&0,4
ch:{[d;s;c](V;I):mi[d;s];i:&((4!*V)=hm@s[*|V])&(,/|1_<\(|ih[d;s]),b)@*V;$[~#i;:+,(s;c);];(mv[s]@/:|'(0;d)+/:I@i;cc[V;I;i;s;c])}

mh:{r:{+{[r;d;s;c]r,+ch[d;s;c]}/[();x;y@0;y@1]}[x]/[+,(y;z)];(!r;.r:&/'r[1]@=r[0])}
mc:{{r:{+{[r;d;s;c]r,+mh[d;s;c]}/[();x;y@0;y@1]}[x;y];(!r;.r:&/'r[1]@=r[0])}[x;hc[x;y;z]]}
slv:{r:{+{[r;d;s;c]r,+mc[d;s;c]}/[();x;y@0;y@1]}[x;y];(((15#9)\)@/:!r;.r:&/'r[1]@=((15#9)/)@/:r[0])}

/ initial state
st:@[&15;!8;:;1+!8]
hm:0N,(,/t:.[T;(3 2;3 5 7 9)])-"A"
hcp:hcpb@2
hcd:hcdb@2
&/*|slv[8]/(+,(st;0))

st:@[&23;!16;:;1+!16]
hm:?[hm;5;,/("DBAC";"DCBA")-"A"]
hcp:hcpb@4
hcd:hcdb@4
\\
&/*|slv[16]/(+,(st;0))
