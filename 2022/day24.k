S:"#"=I:0:"day24.txt"
(u;d;l;r):"^v<>"=\:-1_1_-1_'1_'I
sh:#'-1_*:\
rot:{,/|_[(#y)!0,x;y]}
shw:{`0:".#"x,,""}
fe:{:[;x]_y}
D:(,0 0),,/-:\=2
lcm:#(((ht;wd):sh@u)!'1+)\1 1
u:1_ht rot[1]\u
d:1_ht rot[-1]\d
l:+1_'wd rot[1]\'l
r:+1_'wd rot[-1]\'r
cyc:|/lcm#/:(u;d;r;l)
nb:{(1^.[S;]')_x+/:D}
s:s0:(0;,0 1)
e:e0:(-2+#I),(*|I)?"."
msk:{(n;1^.[cyc@lcm!*x;]''-1+n:nb'*|x)}
/stp:{(n;m):msk[x];c:#'n;(1+*x;?(#/|1(x[1]~)\s[1]),,/fe'[m;n])}
stp:{(n;m):msk[x];c:#'n;(1+*x;?s[1],/fe'[m;n])}
:r:1+*(^?/|(,e),,*|:) stp/s
s:(r;,e0+1 0)
e:s0[1;0]+1 0
r:1+*(^?/|(,e),,*|:) stp/s
s:(r;s0[1])
e:e0
:r:1+*(^?/|(,e),,*|:) stp/s
/shw'cyc;
