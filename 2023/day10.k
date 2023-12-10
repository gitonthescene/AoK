I:0:"day10.txt"

.[I;(*+&"S"=I)+\:-1+!4]          / visualize to figure out what start character is

/      F     -     7     |     L     J
P:+((0 0 0;0 0 0;0 0 0;0 1 0;0 1 0;0 1 0;0 0 0)
    (0 1 1;1 1 1;1 1 0;0 1 0;0 1 1;1 1 0;0 0 0)
    (0 1 0;0 0 0;0 1 0;0 1 0;0 0 0;0 0 0;0 0 0))

s:3                              / start character ( for me )
sh:-1_#'*:\

d:sh@M0:,/'+,'/P@s^"F-7|LJ."?I
M:1&,/M0
D:d/'(,/-:\|=2) /ESWN
B:d/(1+3**+&"S"=I)

B2:*(M@)#B+/:D                   / next steps.  pick one

/ Chase around loop.  Divide by 3 for scale and 2 for halfway
-6!#L:(~B=*:){(((M@)#x[0]+/:D)^x 1),x}/(B2;B)

L:4(|+1,)/M0*d#@[&#M;L;:;1]      / discard everything but the loop

d+:2
T:,/.[L;1 1;:;2]                 / mark start of flood
N:(!#T)+/:d/-1+!3 3

/ Flood fill and take the zero pixels at the scaled down size
+//~.[d#{x+2*(~x)&2=|/x@N}/T;2+3*!'-3!d]
