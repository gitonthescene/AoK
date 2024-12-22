I:`I$0:"day22.txt"

mix:{~x=y}
prune:{(&40),40_x}
shftl:{,[y_x;&y]}
shftr:{,[&-y;y_x]}
shft:{((shftl;shftr)[y<0])[x;y]}

bits:|0^@[;!64]@|2\
calc0:{prune mix[x;shft[x:prune mix[x;shft[x:prune mix[x;shft[x;6]];-5]];11]]}

+/*|s:+{2/+2000 calc0\bits x}'I

s:10!s
seqs:=,/diffs:+'4':-':s
sd:+'(2001-3;#I)\'seqs
calc:{+/s./:+|(!d;3+.d:x[0]@*'=*|x:+x)}
|/calc'sd
