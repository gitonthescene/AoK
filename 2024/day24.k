I:1:"day24.txt"

(T;B):"\n"\'"\n\n"\I
T0:+": "\'T
T:!/(`s$T0 0;.(,/T0[1]),"b")

(O;V):+" -> "\'B
V0:V:`s$V

swp:(`rts`jpj`kgj`chv;`z07`z12`z26`vvw)

O0:+" "\'O
ops:("AND";"XOR";"OR")
O:(`s$;(&/;~=/;|/)@ops?;`s$)@'O0

proc:{@[z;y@w;:;{y@'+(x;z)}.(z@;::;z@)@'x[;w:&&/~^(!z)?x[0 2]]]}
calc:{ r:proc[x;y]/z
       2/|r@@/1<:\("z"=*'$:)#y}
calc[O;V] T

mkT:{(!T)!,/+|(45#2)\x}

c:(V;O 0;O 2)

k:?@/1<:\,//c / all nodes

S:2##k        / size of adjacency matrix

/ edges
e:,/+'{(,x 0),/:,'1_x}k?(V;O 0;O 2)

/ adjacencies
adj0:(=*S)|S#@[&*/S;S/+e;:;1]

/ transitive closure
adj:(|/&)\:[;adj0]/adj0

zs:&"z"=*'$k
xs:&"x"=*'$k
ys:&"y"=*'$k

ms:|\adj[xs;xs]
df:k@^':&'~|/''(~ms)&/:\:adj[;xs]

carry:,/,/:\:/&=3
carry4:,/,/:\:/&=4

find:{(z[0]+~#r;r:&~(+/+r)=calc[O;y]'mkT'r:(,/,/:\:/&=x)*/2+&z 0)}

srch:{v:@[V;|w;:;V@w:V?x[0]]
      (w;t):find[3;v]/(x 1;!0)
      b:|/#'2\'carry4[*t]*/2+&w
      c:df[b]^df[b-1]
      VT:{@[x;|w;:;x@w:x?z,'y]}[v;x 0]'cp:+@/1(&&\~=#:)\(^"xy"?*'$:)#c
      (w;{y@&(+/+r)~/:{(calc[O]y)'mkT'x}[r:carry*/2+&z]'x}[VT;cp]w) }

/ All very manual but this was effectively my process
/ May revisit to have a closer look at what's actually going on

srch((();());1)
find[4;@[V;|w;:;V@w:V?`nph`rts]]/(5;!0)
find[4;@[V;|w;:;V@w:V?`sdj`rts]]/(5;!0)
find[4;@[V;|w;:;V@w:V?`z07`rts]]/(5;!0) / best
srch((`rts;`z07);5)
find[4;@[V;|w;:;V@w:V?(`z07`bwg;`rts`z12)]]/(10;!0)
find[4;@[V;|w;:;V@w:V?(`z07`jpj;`rts`z12)]]/(10;!0) / best
srch((`z07`jpj;`rts`z12);24)
find[4;@[V;|w;:;V@w:V?(`z07`jpj`www;`rts`z12`z26)]]/(24;!0)
find[4;@[V;|w;:;V@w:V?(`z07`jpj`kgj;`rts`z12`z26)]]/(24;!0) / best

/ last screws up with a number with 33 bits but the issue is at the 34 bit calc

/
bit manipulators
bm:+(V;O 0;O0 1;O 2)@\:@/1(<1_/:$O[0]@)\@/1(>O0[1]@)\&&/~^(k@xs,ys)?O[0 2]
