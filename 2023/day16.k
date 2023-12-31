I:0:"day16.txt"
I:(" ./\\|-")?4(|+" ",)/I

S:-1_#'*:\I
I:,/I

T:(0N 0 3 1 0N 0
   0N 1 2 0 1  0N
   0N 2 1 3 0N 2
   0N 3 0 2 3  0N)

NP:(!#I)+/:S/+,/-:\|=2    / next position
ND:.[T;]''(!4),/:\:I      / next direction

tr:{(~^*:){(ND[x[0];n];n:.[NP;x])}\x}   / trace point

/ paths
p:tr'0,/:S/'(s:1+!l:S[0]-2),\:0
p,:tr'1,/:S/|+s,\:0
p,:tr'2,/:S/+s,\:l
p,:tr'3,/:S/|+s,\:l

/ forks
f:tr',/1 3,/:\:&4=I
f,:tr',/0 2,/:\:&5=I
ft:f@=*|+*'f              / fork head -> fork trails

/ match ends of paths, avoid repeating
ps:{&*|{((x[1]@)_?(^:)_2(*|:)'/,/ft[*x];@[;;:;1].|x)}/(,*|*|x;&#I)}'p
*c:#'(^:)_/:(~I@)_/:?',//'((*|+1_-1_)'p),'(*|+-1_)'''ft@(~I@)_/:ps
|/c
