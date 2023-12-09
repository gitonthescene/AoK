I:1:"day8.txt"

(I;M):"\n\n"\I
M:+(r:"\n"\M)@\:0 7 12+\:!3
I:"LR"?I
L:(N:*M)?+-2#M

(S;E):&'"AZ"=\:(*|+N)
f:{{(0=*|y)|^x?*y}[x]{(L[*y; I@(#I)!*|y];1+*|y)}[E]\(y;0)}

P:f[E]'S  / Paths from the start
l:#'*'+'P   / Lengths

PP:f[E]'(C:*'|'*'+'P) / Paths continuing from the finish

N@*'(S;C)           / part 1
-1+*l

l~#'*'+'PP          / Just happens to be the same
(#I)!-1+l           / All happen to be multiples of #I
(-#I)!-1+l          / Rest happen to be prime
(#I)**/(-#I)!-1+l   / Cheap LCM calculation

