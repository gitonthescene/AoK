I:0:"day6.txt"

I:4(|+" ",)/I
S:-1_#'*:\I
C:S/+c:,/|-:\=2

I:,/I
D:4,(#I)
s:*&"^"=I

T:@[&*/D;D/w;:;D/{(x;y+C x)}/w:+,/(!4),/:\:S/1+!S-2]
T:@[T;w;:;D/4 0!'-1 0+D\w:&"#"=I@*|D\T]

stp:{$[y[0;D/m:x@y[1]];:y;(@[y 0;D/m;:;1];m)]}
+/p:(^I)<|/(4,0N)#*stp[T]/(&*/D;0,s)

up:{f:{(x;y+C@4!x-2)}/+(!4),\:y;t:(4!f[0]-1;f[1]);@[x;D/f;:;D/t]}

+/~{|/(^I)&|/(4,0N)#0+*stp[up[T;x]]/(`b$&*/D;0,s)}'&p

/ `b$ needs updates in https://codeberg.org/growler/k
/

vw:{S#@[I;(y[1];s;x);:;("^<v>"y[0];"S";"X")]}
