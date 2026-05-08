I:0:"day10.txt"

E:D:+{(*x;*|x;1_-1_x)}'" "\'I
f:.''","\'1_/:-1_/:
E:@[E;2;f']
D:+@[@[@[D;2;f'];1;f];0;"#"=-1_/:1_/:]
F:D:{@[x;2;~@[&#x 0;;:;1]']}'D
D:.[D;(::;2);(=)@']
G:D[;0]
D:.[D;(::;0);0&]

tgl:{@[y;0;y[2;x]]} / tgl[button;row] -> updated row

upd:{@[x;y;tgl z]}

/ from l/maths.k
cmb:{$[y~*y;;:y@o[x;#y]];*|(y-x){((,(1|#*x)#-1+**y),x),'y}\/,''y+!'-!1+x} /combinations(lexicographic)
mmu:(+/*)\:

+/-1+*|+{(~*:){(|/x~/:0{x{y x}/y}'y@+cmb[z 1;#y];1+z 1)}[G x;D[x;2]]/(0 1)}'!#D

bump:{@[@[y;0;y[2;x]=];1;~[y[2;x]]+]}
F:.[F;(::;2);~:]
G:F[;1]
F:.[F;(::;0 1);0&]

C:{((","/v)," = Ints",((" "/v)/"''")/"()";"obj=o.minimize",("+"/v)/"()"),{"o.add",x/"()"}'((v:`c$"a"+![#y]),\:">=0"),"=="/'+("+"/'`c$"a"+*'&'![#x]=\:y;$x)}/'+@[1_E;0;.'-1_/:1_/:]
p:{("from z3 import *";"o=Optimize()"),x,("print(o.check())";"m = o.model()";"print(sum(m[i].py_value() for i in m))")}'C;
python:"python3"
r:{"\n"\`x(,python;"\n"/x)}'p
+/.'*|+r
