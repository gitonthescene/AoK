I:0:"day12.txt"

I:4(+|0N,)/I
S:-1_#'*:\I

C:S/+,/-:\=2
I:,/I
D:4,#I

N:C+/:!#I
T:D/+,/(!4),/:'+N       / forward (transition)
TR:T@D/4 0!'-1 0+D\!#T  / turn right
TL:T@D/4 0!' 1 0+D\!#T  / turn left

cx:{?/:/(&I=x;y@'&'x=I@y)}
dis:{*|(#*:)({(y^r;z,,(r:(?,//1(x@)\)/*y))}[x].)/(!#x;())}

d:N@G:(=I)_0N
g:dis'cx.'+(!d;.d)  / collect groups
g:,/(.G)@'g         / list groups

A:.#'g
P:+//'^?/'+1(N@)\g
+/A*P

sds:{m:@[&#I;x;:;1]
     p:T@D/{(z;x@y)}[x]/&~m@N@x
     tr:1_m@*|D\2 TR\p
     tl:1_m@*|D\2 TL\p
     -2!+/,//(<\1 0=)'(tr;tl)}

+/A*sds'g

/
sh:`0:" "/'$/|1(-:1+|/#',/)\$:   / show
