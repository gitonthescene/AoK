I:`I$0:"day22.txt"

I1:1 10 100 2024
I1:1 2 3 2024

magic:16777216

mix:{~x=y}
prune:{(&40),40_x}
shftl:{,[y_x;&y]}
shftr:{,[&-y;y_x]}
shft:{((shftl;shftr)[y<0])[x;y]}

bits:|0^@[;!64]@|2\
calc:{prune mix[x;shft[x:prune mix[x;shft[x:prune mix[x;shft[x;6]];-5]];11]]}

+/*|s:+{2/'2000 calc\bits x}'I

s:*'|'10\'s
seqs:=,/+'4':diffs:-':s
sd:+'(2001-3;#I)\'seqs
calc:{+/s./:+|(!d;3+.d:x[0]@*'=*|x:+x)}
|/calc'sd
