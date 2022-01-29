data:0:`day4.txt
call:0$'","\data 0
data:2_ data

bds:{c:0=#:'x;(1+#&c;5)#{0$'l@&:~0=#:'l:" "\x}'x@&~c}data
st:((#bds;5;5)#0;0,call)
pl:{{({x[z]|((*1_ y)=)'bds[z]}[x;y]'!#bds;1_ y)}@/x}
/ wn:{|/(|/(&)/')'(x;+x)}
/ workaround.  above should work
wn:{|//{(|/(&)/')'(x;+x)}x}

r:{~|/wn'*x}pl/st

(**|r)*+//(bds*~*r)@&wn'*r

st:(st;(#bds)#0)
r:{|/~*|x}{r:pl[*x];(r;(*|x)|(#r@1)*wn'*r)}/st;

(**|*r)*+//(bds*~**r)@&(&/*|r)=*|r
\\