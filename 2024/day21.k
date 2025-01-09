I:0:"day21.txt"

NP:"\n"\"789
456
123
 0A"

DP:"\n"\" ^A
<v>"

C:,/-:\|=2
D:">v<^"

sh:-1_#'*:\

NS:sh NP
NP:,/NP
NC:NS/+C
NN:NP?p@((2+NS)/+C)+/:!#p:,/4(+|" ",)/NS#NP
NN:NN@(2+NS)/1+!NS

DS:sh DP
DP:,/DP
DC:DS/+C
DN:DP?p@((2+DS)/+C)+/:!#p:,/4(+|" ",)/DS#DP
DN:DN@(2+DS)/1+!DS

cmb:(,/,/:\:)/(),/:

/ Goal.  Top state.
G:" 029A"
G:" 980A"
G:" 179A"
/G:" 456A"
/G:" 379A"
S:(#G;#NP;#DP;#DP)
/ all states
s:|!S


/ at the bottom level every button neighbors every other
N:N0:![0],/:((^DP@)_/:DN@s[0]),\:'/1_s

/ bottom button pushed
bbp:=+/&\"A"=(DP;DP;NP)@'-1_s

/ Hitting A button only on the bottom moves state one level up.
t:@[s[;bbp[0]];1;:;(^DP@)_/:DN[s[1;bbp[0]]]@'">v<^"?DP@s[0;bbp[0]]]
N:N1:@[N;bbp[0];,;![0],/:{cmb t[;x]}'!#t 0]

/ Same for when two A buttons align only it moves the numerical pad
t:@[s[;bbp[1]];2;:;(^NP@)_/:NN[s[2;bbp[1]]]@'">v<^"?DP@s[1;bbp[1]]]
N:N2:@[N;bbp[1];,;![0],/:{cmb t[;x]}'!#t 0]

/ When three buttons line up only advance if button is next in the code
t:@[s[;bbp[2]];3;:;![0],/:#'/|1(NP[s[2;bbp[2]]]=G@)\1+s[3;bbp[2]]]
N:N3:@[N;bbp[2];,;![0],/:{cmb t[;x]}'!#t 0]

N:N4:![0],/:(S/|:)''N

/ Invert neighbors (i.e. *from* neighbors instead of *to* neighbors
NB:d[0]@=*|d:+,/(!#N),/:'N

/ unachievable states
emp:&|/^(DP;DP;NP)@'-1_s

/ purge unachievable states
NB:((,0N)!,!0),_/1(&~#:')\(^[;emp]'NB)_emp

/ Button controlling button
bb:{ t:@[s[;y];x+1;:;(^DP@)_/:DN[s[x+1;y]]@'">v<^"?DP@s[x;y]]
     @[z;y;,;![0],/:{cmb x[;y]}[t]'!#t 0]}

/ Button controlling number pad
bn:{ t:@[s[;y];x+1;:;(^NP@)_/:NN[s[x+1;y]]@'">v<^"?DP@s[x;y]]
     @[z;y;,;![0],/:{cmb x[;y]}[t]'!#t 0]}

/ Number pad to code
ng:{[x;y;z;w]t:@[s[;z];y+1;:;![0],/:#'/|1(NP[s[y;z]]=x@)\1+s[y+1;z]]
   @[w;z;,;![0],/:{cmb x[;y]}[t]'!#t 0]}

/ back neighbors pruned
nb:{x:![0],/:(S/|:)''x
    x:d[0]@=*|d:+,/(!#x),/:'x
    ((,0N)!,!0),_/1(&~#:')\(^[;y]'x)_y}

slv0:{ bp:=+/&\"A"=(DP;DP;NP)@'-1_s:|!S
       n:![0],/:((^DP@)_/:DN@s[0]),\:'/1_s
       n:bb[0;bp[0];n]
       (bp;bn[1;bp[1];n])}

slv:{ (bp;n):x
      n:ng[y:" ",y;2;bp[2];n]
      n:nb[n;emp]
      st:S/(G;NP;DP;DP)?'" AAA"
      X:@[+/1(&:)\*/S;st;:;0]
      dj:{y&/'(1+y@x)@!*/S}[n]/X
      1+dj@S/3,(NP;DP;DP)?'"AAA"}

+/*/(`I$-1_/:I;slv[slv0[]]'I)
