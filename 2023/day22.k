I:0:"day22.txt"
I:II:.''d(d:,/$!10)?"~"\'I
I:I@<I[;0;2]
S:|/,/0 1+/:2#''I
sh:`0:(,"--")," "/'$/|1(-:1+|/#',/)\$:

B:S/'(+/(!--)\0 1+2#')'I
f:{(b;@[*|x;y;:;z+b:|/0^x[1;y]])}          / track highest height per landing spot
b:*+f\[(0N;(*/S)#!0);B;h:1+-/|+I[;;2]]     / as well as where each box lands
m:+,/{+r@'2#&~^?\:/B@/:r:(=b;=h+b)@\:x}'?b / match tops to bottoms
(#I)-#tpl:?,/tb@&1=#'?'tb:(*|m)@=*m        / boxes supported by only one box may topple
bt:(*m)@=*|m
g:{(?(^:)_,/bt@n;?(*|x),n:(&/'~^(*|x)?tb@)#*x)}' / find which boxes supported only by which boxes
t:g/(|1(,/bt@)\,:)'tpl                           / recursively
+/#'1_'*|+t                                      / only count other boxes

/ Alternative model for falling brings
/ Don't reorder.  Drop everything simultaneously
bk:(SZ:1+2|//II)/''(++/(!--)\0 1+)'II
u:(&=/1&/\)'(*|SZ)!bk  / Underside of each brick
fld:{y-(~|/'1=(*|SZ)!y)&&/'^(,/y)?-1+y@'x}
l:fld[u]/bk

/ All the bricks land in the same spot as above model (offset by 1)
(b+1)~(&/'(*|SZ)!l)II?I
