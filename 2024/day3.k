I:,/0:"day3.txt"

T:"\n"\" .do()n'tmul,N
..d......m....
d.do.....m....
o.d.(.n..m....
(.d..)...m....
).d......m....
n.d....'.m....
'.d.....tm....
t.d.(....m....
m.d......mu...
u.d......m.l..
l.d.[....m....
[.d......m...N
N.d..]...m..,N
,.d......m...N
].d......m...."

(C;T):0 1_T
T:1_/:(S:*'T)?T
C:@[&256;(c;"0123456789");:;(1+!#c;1+#c:?-1_2_*C)]@

I:"don't()",I
s:0{T[x;y]}\C I
f:{+/*/+`I$(2=#:')#","\'I@{x+4+!'y-x+4}/|1(m[0]@m[0]')\*|m:&'?[S;"m]"]=\:x}

rng:{(1 0=(z=x))@y}
f'(s;s*~rng[?[S;"to"]]\@[&#s;w;:;s@-2+w:&4=s])
