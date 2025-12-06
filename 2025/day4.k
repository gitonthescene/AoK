I:0:"day4.txt"

sh:-1_#'*:\
d:sh I
I:@[&*/d;(d:d+2)/1+!d;:;,/"@"=I]

w:d/1+!d-1
n:d/-1+!3 3

f:{@[x;w;>;5>+/w{x y+z}[x]/:n]}
+/I>1 f/I
+/I>f/I
