I:(*:';`I$)@'+" "\'0:"day9.txt"

D:"RLDU"!(0 1;0 -1;1 0;-1 0)
H:T:0 0
sgn:0 1'
abs:{x|-x}

adj0:{*/(|/1<abs';sgn')@\:x-y}
adj1:{@[x;y;+;adj0.(x@-1 0+y)]}
adj:{adj1/[y;1_!x]}

mv0:{(h;t;d):x;adj[(h+:D@d;t);1],,d}
mv1:{adj[x;@[-1_y;0;+;D@d]],,d:*|y}
mv:{(-1_*|r;(*|x),1_r:(z)mv1[#*x]\(*x),,y)}

f:{(*|mv/[(((x,2)#0);());;].I)[;x-1]}
(#?:)'f'2 10

/ visualize!
/ r:-\:/1&/\r:f[2]
/ .[;;:;"#"]/[(1+|/r)#".";r]
