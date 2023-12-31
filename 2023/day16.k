I:0:"day16.txt"
I:(C:" ./\\|-")?4(|+" ",)/I

D:4*(S:-1_#'*:\I)/',/-:\|=2 / ESWN
I:,/I

T:(0 0 3 1 0N 0
   1 1 2 0 1  0N
   2 2 1 3 0N 2
   3 3 0 2 3  0N)

/ headings
h:b:,/0 2 1 3+4*S/'',/1(|:'')\(1+!s),\:/:(0,s:*-1+S)  / from edges
h,:,/(4*&"-"=C@I)+/:2 0                               / horiz forks
h,:,/(4*&"|"=C@I)+/:3 1                               / vert forks

nxt:{(p;-p-x+D@p:4!x)}                                / next pos/dir
stp:{(d;n):nxt@x;$[^d:T[d;I@-4!n];d;n+d]}             / redirect

parts:{*|(#*:){(((^:)_,/x@*y)^y[1];,/y)}[x]/(,*y;!0)} / connected paths
cnt:{#?(~:I@)_-4!,/x[y]}                              / count unique positions

p:(^:)_/:h,'({~(^x)|~I@-4!x}stp\stp@)'h   / paths
f:(p@=-4!*'p)_-4!b                        / forks
hp:!/|1*:'\p                              / head -> path
ht:(*'p)!*''f@-4!*|+nxt'(*|)'p            / head -> tail

*c:cnt[hp]'parts[ht]'hp@b
|/c
