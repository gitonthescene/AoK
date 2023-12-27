I:0:"day22.txt"
I:I:.''d(d:,/$!10)?"~"\'I
I:I@<I[;0;2]
S:|/,/0 1+/:2#''I
sh:`0:(,"--")," "/'$/|1(-:1+|/#',/)\$:

B:S/'(+/(!--)\0 1+2#')'I
f:{(hs;ds):x;(b;@[ds;y;:;z+b:|/0^ds[y]])}  / track highest height per landing spot
b:*+f\[(0N;(*/S)#!0);B;1+-/|+I[;;2]]       / as well as where each box lands
t:b+1+-/|+I[;;2]                           / the top of each box
m:+,/{+r@'2#&~^?\:/B@/:r:(=b;=t)@\:x}'?b   / match tops to bottoms
(#I)-#tpl:?,/tb@&1=#'?'tb:(*|m)@=*m        / boxes supported by only one box may topple
bt:(*m)@=*|m
g:{(?(^:)_,/bt@n;?(*|x),n:(&/'~^(*|x)?tb@)#*x)}' / find which boxes supported only by which boxes
eee:g/(|1(,/bt@)\,:)'tpl                         / recursively
+/#'1_'*|+eee                                    / only count other boxes
